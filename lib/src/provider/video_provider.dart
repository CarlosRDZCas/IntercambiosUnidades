import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  late VideoPlayerController? _controller;
  VideoPlayerController? get controller => _controller;
  set controller(VideoPlayerController? value) {
    _controller = value;
    controller!.value = value!.value;
    notifyListeners();
  }

  bool? _isInitialized = false;
  bool? get isInitialized => _isInitialized;
  set isInitialized(bool? value) {
    _isInitialized = value;
    notifyListeners();
  }

  bool? _isPlaying = false;
  bool? get isPlaying => _isPlaying;
  set isPlaying(bool? value) {
    _isPlaying = value;
    notifyListeners();
  }

  Future<void> initialize() async {
    if (video == null) {
      notifyListeners();
      return;
    }
    controller = VideoPlayerController.file(File(video!.path));
    await controller!.initialize();
    await controller!.setLooping(true);
    await controller!.play();
    isPlaying = true;
    notifyListeners();
  }

  XFile? _video;
  XFile? get video => _video;
  set video(XFile? value) {
    if (video != null) {
      controller!.dispose();
      isInitialized = false;
      notifyListeners();
    }
    _video = value;
    if (video != null) {
      initialize();
      isInitialized = true;
    }
    notifyListeners();
  }

  void clear() {
    video = null;
    notifyListeners();
  }
}
