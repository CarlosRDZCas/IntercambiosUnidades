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

  late VideoPlayerController? _controllerCons;
  VideoPlayerController? get controllerCons => _controllerCons;
  set controllerCons(VideoPlayerController? value) {
    _controllerCons = value;
    controllerCons!.value = value!.value;
    notifyListeners();
  }

  bool? _isInitialized = false;
  bool? get isInitialized => _isInitialized;
  set isInitialized(bool? value) {
    _isInitialized = value;
    notifyListeners();
  }

  bool? _isInitializedCons = false;
  bool? get isInitializedCons => _isInitializedCons;
  set isInitializedCons(bool? value) {
    _isInitializedCons = value;
    notifyListeners();
  }

  bool? _isPlaying = false;
  bool? get isPlaying => _isPlaying;
  set isPlaying(bool? value) {
    _isPlaying = value;
    notifyListeners();
  }

  bool? _isPlayingCons = false;
  bool? get isPlayingCons => _isPlayingCons;
  set isPlayingCons(bool? value) {
    _isPlayingCons = value;
    notifyListeners();
  }

  Future<void> initialize(bool cons) async {
    if (cons) {
      if (videoCons == null) {
        notifyListeners();
        return;
      }
      bool validURL = videoCons!.path.contains('http://') ||
          videoCons!.path.contains('https://');
      if (validURL) {
        controllerCons = VideoPlayerController.network(videoCons!.path);
        await controllerCons!.initialize();
        await controllerCons!.play();
        isPlayingCons = true;
        notifyListeners();
      } else {
        controllerCons = VideoPlayerController.file(File(videoCons!.path));
        await controllerCons!.initialize();
        await controllerCons!.play();
        isPlayingCons = true;
        notifyListeners();
      }
    } else {
      if (video == null) {
        notifyListeners();
        return;
      }
      bool validURL = videoCons!.path.contains('http://') ||
          videoCons!.path.contains('https://');
      if (validURL) {
        controller = VideoPlayerController.network(video!.path);
        await controller!.initialize();
        await controller!.play();
        isPlaying = true;
        notifyListeners();
      } else {
        controller = VideoPlayerController.file(File(video!.path));
        await controller!.initialize();
        await controller!.play();
        isPlaying = true;
        notifyListeners();
      }
    }
  }

  String? _error = '';
  String? get error => _error;
  set error(String? value) {
    _error = value;
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
      initialize(false);
      isInitialized = true;
    }
    notifyListeners();
  }

  XFile? _videoCons;
  XFile? get videoCons => _videoCons;
  set videoCons(XFile? value) {
    if (videoCons != null) {
      controllerCons!.dispose();
      isInitializedCons = false;
      notifyListeners();
    }
    _videoCons = value;
    if (videoCons != null) {
      initialize(true);
      isInitializedCons = true;
    }
    notifyListeners();
  }

  void clear() {
    video = null;
    notifyListeners();
  }
}
