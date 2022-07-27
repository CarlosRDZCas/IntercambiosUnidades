import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intercambio_unidades/src/services/services.dart';
import 'package:path_provider/path_provider.dart';

import '../models/models.dart';

class IntercambioProvider extends ChangeNotifier {
  bool? _isLoading = false;
  bool? get isLoading => _isLoading;
  set isLoading(bool? value) {
    _isLoading = value;
    notifyListeners();
  }

  bool? _datosIsExpanded = true;
  bool? get datosIsExpanded => _datosIsExpanded;
  set datosIsExpanded(bool? value) {
    _datosIsExpanded = value;
    notifyListeners();
  }

  bool? _detallesIsExpanded = true;
  bool? get detallesIsExpanded => _detallesIsExpanded;
  set detallesIsExpanded(bool? value) {
    _detallesIsExpanded = value;
    notifyListeners();
  }

  bool? _imagenIsExpanded = true;
  bool? get imagenIsExpanded => _imagenIsExpanded;
  set imagenIsExpanded(bool? value) {
    _imagenIsExpanded = value;
    notifyListeners();
  }

  bool? _isError = false;
  bool? get isError => _isError;
  set isError(bool? value) {
    _isError = value;
    notifyListeners();
  }

  bool? _isSuccess = false;
  bool? get isSuccess => _isSuccess;
  set isSuccess(bool? value) {
    _isSuccess = value;
    notifyListeners();
  }

  Future<void> sendFTP(List<File> imagenes, String unidad) async {
    isLoading = true;
    if (await sendImageFTP(imagenes, unidad)) {
      isSuccess = true;
      isError = false;
    } else {
      isError = true;
      isSuccess = false;
    }
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory\\EditImages').list().forEach((element) {
      element.delete();
    });
    isLoading = false;
    notifyListeners();
  }

  Intercambio? _intercambio;
  Intercambio? get intercambio => _intercambio;
  set intercambio(Intercambio? value) {
    _intercambio = value;
    notifyListeners();
  }

  List<String> getImagenes() {
    List<String> imagenes = [];
    if (intercambio != null) {
      imagenes.add(intercambio!.frontalImg);
      imagenes.add(intercambio!.lateralDer1Img);
      imagenes.add(intercambio!.lateralIzq1Img);
      imagenes.add(intercambio!.trasera1Img);
      imagenes.add(intercambio!.trasera2Img);
      imagenes.add(intercambio!.trasera3Img);
      imagenes.add(intercambio!.interiorImg);
      imagenes.add(intercambio!.colchonImg);
      imagenes.add(intercambio!.tableroImg);
    } else {
      imagenes;
    }
    return imagenes;
  }

  Future<List<Intercambio>?> getIntercambios(String unidad) async {
    List<Intercambio>? response = await TractoresService.getIntercambio(unidad);
    return response!.isNotEmpty ? response : null;
  }
}
