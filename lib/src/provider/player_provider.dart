import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PlayerProvider extends ChangeNotifier {
  Player? _controller;
  Player? get controller => _controller;
  set controller(Player? value) {
    _controller = value;
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
    controller = Player(
      id: 0,
      videoDimensions: const VideoDimensions(640, 360),
    );
    controller!.open(
      Media.file(File(video!.path)),
      autoStart: true,
    );
    controller!.play();
    isPlaying = true;
    notifyListeners();
  }

  XFile? _video;
  XFile? get video => _video;
  set video(XFile? value) {
    if (video != null) {
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

  void clear(){
    video = null;
    notifyListeners();
  }
}
