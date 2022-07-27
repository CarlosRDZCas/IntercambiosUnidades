import 'dart:io';

import 'package:flutter/cupertino.dart';

class EditImageProvider extends ChangeNotifier {
  EditImageProvider() {
    points = [];
  }

  GlobalKey genKey = GlobalKey();
  
  List<Offset?> _points = <Offset?>[];
  List<Offset?> get points => _points;
  set points(List<Offset?> value) {
    _points = value;
    notifyListeners();
  }

  File? _image;
  File? get image => _image;
  set image(File? value) {
    _image = value;
    notifyListeners();
  }
}
