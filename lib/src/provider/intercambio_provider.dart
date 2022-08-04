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

  bool? _frontalIsExpanded = true;
  bool? get frontalIsExpanded => _frontalIsExpanded;
  set frontalIsExpanded(bool? value) {
    _frontalIsExpanded = value;
    notifyListeners();
  }

  bool? _lateralDerIsExpanded = true;
  bool? get lateralDerIsExpanded => _lateralDerIsExpanded;
  set lateralDerIsExpanded(bool? value) {
    _lateralDerIsExpanded = value;
    notifyListeners();
  }

  bool? _lateralIzqIsExpanded = true;
  bool? get lateralIzqIsExpanded => _lateralIzqIsExpanded;
  set lateralIzqIsExpanded(bool? value) {
    _lateralIzqIsExpanded = value;
    notifyListeners();
  }

  bool? _traseraIsExpanded = true;
  bool? get traseraIsExpanded => _traseraIsExpanded;
  set traseraIsExpanded(bool? value) {
    _traseraIsExpanded = value;
    notifyListeners();
  }

  bool? _trampasyAcumIsExpanded = true;
  bool? get trampasyAcumIsExpanded => _trampasyAcumIsExpanded;
  set trampasyAcumIsExpanded(bool? value) {
    _trampasyAcumIsExpanded = value;
    notifyListeners();
  }

  bool? _interiorIsExpanded = true;
  bool? get interiorIsExpanded => _interiorIsExpanded;
  set interiorIsExpanded(bool? value) {
    _interiorIsExpanded = value;
    notifyListeners();
  }

  bool? _imagenesIsExpanded = true;
  bool? get imagenesIsExpanded => _imagenesIsExpanded;
  set imagenesIsExpanded(bool? value) {
    _imagenesIsExpanded = value;
    notifyListeners();
  }

  bool? _videoIsExpanded = true;
  bool? get videoIsExpanded => _videoIsExpanded;
  set videoIsExpanded(bool? value) {
    _videoIsExpanded = value;
    notifyListeners();
  }

  count() {
    List<int> counters = [];
    int counterFrontal = 0;
    int counterLateralDer = 0;
    int counterLateralIzq = 0;
    int counterTrasera = 0;
    int counterTYA = 0;
    int counterInterior = 0;
    if (intercambio != null) {
      if (intercambio!.placaDel == true) counterFrontal++;
      if (intercambio!.iave == true) counterFrontal++;
      if (intercambio!.engomados == true) counterFrontal++;
      if (intercambio!.parrilla == true) counterFrontal++;
      if (intercambio!.copete == true) counterFrontal++;
      if (intercambio!.faros == true) counterFrontal++;
      if (intercambio!.defensa == true) counterFrontal++;
      if (intercambio!.cofreCentr == true) counterFrontal++;
      if (intercambio!.parabrisas == true) counterFrontal++;
      if (intercambio!.conchasEspe == true) counterFrontal++;
      if (intercambio!.defLateDer) counterLateralDer++;
      if (intercambio!.llantaPos1) counterLateralDer++;
      if (intercambio!.puertaDer) counterLateralDer++;
      if (intercambio!.cofLateDer) counterLateralDer++;
      if (intercambio!.faldonesDer) counterLateralDer++;
      if (intercambio!.ventanasDer) counterLateralDer++;
      if (intercambio!.espCofreDer) counterLateralDer++;
      if (intercambio!.conchEspeDer) counterLateralDer++;
      if (intercambio!.costadoDerCab) counterLateralDer++;
      if (intercambio!.aleronesDer) counterLateralDer++;
      if (intercambio!.copeteCostDer) counterLateralDer++;
      if (intercambio!.estribosDer) counterLateralDer++;
      if (intercambio!.defLateIzq) counterLateralIzq++;
      if (intercambio!.llantaPos2) counterLateralIzq++;
      if (intercambio!.puertaIzq) counterLateralIzq++;
      if (intercambio!.cofLateIzq) counterLateralIzq++;
      if (intercambio!.faldonesIzq) counterLateralIzq++;
      if (intercambio!.ventanasIzq) counterLateralIzq++;
      if (intercambio!.espCofreIzq) counterLateralIzq++;
      if (intercambio!.conchEspIzq) counterLateralIzq++;
      if (intercambio!.costadoIzqCab) counterLateralIzq++;
      if (intercambio!.aleronesIzq) counterLateralIzq++;
      if (intercambio!.copeteCostIzq) counterLateralIzq++;
      if (intercambio!.estribosIzq) counterLateralIzq++;
      if (intercambio!.placaTrasera) counterTrasera++;
      if (intercambio!.quinta) counterTrasera++;
      if (intercambio!.chirriones) counterTrasera++;
      if (intercambio!.guardafangos) counterTrasera++;
      if (intercambio!.portaloderas) counterTrasera++;
      if (intercambio!.loderas) counterTrasera++;
      if (intercambio!.lucesTras) counterTrasera++;
      if (intercambio!.silenciador) counterTrasera++;
      if (intercambio!.bastidores) counterTrasera++;
      if (intercambio!.bolsas) counterTrasera++;
      if (intercambio!.espaldaCab) counterTrasera++;
      if (intercambio!.mallaEscape) counterTrasera++;
      if (intercambio!.plataformaTrabajo) counterTrasera++;
      if (intercambio!.miembrosTransv) counterTrasera++;
      if (intercambio!.mangueServicio) counterTrasera++;
      if (intercambio!.llantaPos3) counterTrasera++;
      if (intercambio!.llantaPos4) counterTrasera++;
      if (intercambio!.llantaPos5) counterTrasera++;
      if (intercambio!.llantaPos6) counterTrasera++;
      if (intercambio!.llantaPos7) counterTrasera++;
      if (intercambio!.llantaPos8) counterTrasera++;
      if (intercambio!.llantaPos9) counterTrasera++;
      if (intercambio!.llantaPos10) counterTrasera++;
      if (intercambio!.trampaIzq) counterTYA++;
      if (intercambio!.trampaDer) counterTYA++;
      if (intercambio!.acum) counterTYA++;
      if (intercambio!.colch) counterInterior++;
      if (intercambio!.llavesEncend) counterInterior++;
      if (intercambio!.controles) counterInterior++;
      if (intercambio!.tapiceria) counterInterior++;
      if (intercambio!.estereo) counterInterior++;
      if (intercambio!.limpiezaUnidad) counterInterior++;
      if (intercambio!.carpeta) counterInterior++;
      if (intercambio!.ac) counterInterior++;
    }
    counters.add(counterFrontal);
    counters.add(counterLateralDer);
    counters.add(counterLateralIzq);
    counters.add(counterTrasera);
    counters.add(counterTYA);
    counters.add(counterInterior);
    return counters;
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
