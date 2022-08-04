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

  Player? _controllerCons;
  Player? get controllerCons => _controllerCons;
  set controllerCons(Player? value) {
    _controllerCons = value;
    notifyListeners();
  }

  bool? _isInitialized = false;
  bool? get isInitialized => _isInitialized;
  set isInitialized(bool? value) {
    _isInitialized = value;
    notifyListeners();
  }

  Future<void> initialize(bool cons) async {
    if (cons) {
      if (videoCons == null) {
        notifyListeners();
        return;
      }
      controllerCons = Player(
        id: 0,
        videoDimensions: const VideoDimensions(640, 360),
      );
      bool validURL = videoCons!.path.contains('http://') ||
          videoCons!.path.contains('https://');

      if (validURL) {
        controllerCons!.open(Media.network(videoCons!.path), autoStart: true);
      } else {
        controllerCons!
            .open(Media.file(File(videoCons!.path)), autoStart: true);
      }
      controllerCons!.play();
      notifyListeners();
    } else {
      if (video == null) {
        notifyListeners();
        return;
      }
      controller = Player(
        id: 1,
        videoDimensions: const VideoDimensions(640, 360),
      );
      bool validURL =
          video!.path.contains('http://') || video!.path.contains('https://');

      if (validURL) {
        controller!.open(Media.network(video!.path), autoStart: true);
      } else {
        controller!.open(Media.file(File(video!.path)), autoStart: true);
      }
      controller!.play();
      notifyListeners();
    }
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
      initialize(false);
      isInitialized = true;
    }
    notifyListeners();
  }

  XFile? _videoCons;
  XFile? get videoCons => _videoCons;
  set videoCons(XFile? value) {
    if (videoCons != null) {
      isInitialized = false;
      notifyListeners();
    }
    _videoCons = value;
    if (videoCons != null) {
      initialize(true);
      isInitialized = true;
    }
    notifyListeners();
  }

  void clear() {
    video = null;
    notifyListeners();
  }
}
