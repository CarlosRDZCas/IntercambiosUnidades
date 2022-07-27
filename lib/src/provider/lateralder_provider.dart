import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LateralDerechoProvider extends ChangeNotifier {
  void clear() {
    imagenLateralDer = null;
    defensaLateralDerchecked = false;
    controllerDefensaLateralDer = TextEditingController(text: '');
    defensaLateralDer = '';
    llantaPos1checked = false;
    controllerllantaPos1 = TextEditingController(text: '');
    llantaPos1 = '';
    puertaDerchecked = false;
    controllerPuertaDer = TextEditingController(text: '');
    puertaDer = '';
    cofreLateralDerchecked = false;
    controllercofreLateralDer = TextEditingController(text: '');
    cofreLateralDer = '';
    faldonesDerchecked = false;
    controllerfaldonesDer = TextEditingController(text: '');
    faldonesDer = '';
    ventanasDerchecked = false;
    controllerventanasDer = TextEditingController(text: '');
    ventanasDer = '';
    espejoCofreDerchecked = false;
    controllerespejoCofreDer = TextEditingController(text: '');
    espejoCofreDer = '';
    conchaEspejosDerchecked = false;
    controllerconchaEspejosDer = TextEditingController(text: '');
    conchaEspejosDer = '';
    costadoDerCabinachecked = false;
    controllercostadoDerCabina = TextEditingController(text: '');
    costadoDerCabina = '';
    aleronesDerchecked = false;
    controlleraleronesDer = TextEditingController(text: '');
    aleronesDer = '';
    copeteCostadoDerchecked = false;
    controllercopeteCostadoDer = TextEditingController(text: '');
    copeteCostadoDer = '';
    estribosDerchecked = false;
    controllerestribosDer = TextEditingController(text: '');
    estribosDer = '';
    notifyListeners();
  }

  XFile? _imagenLateralDer;
  XFile? get imagenLateralDer => _imagenLateralDer;
  set imagenLateralDer(XFile? value) {
    _imagenLateralDer = value;
    notifyListeners();
  }

  bool _defensaLateralDerchecked = false;
  bool get defensaLateralDerchecked => _defensaLateralDerchecked;
  set defensaLateralDerchecked(bool value) {
    _defensaLateralDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerDefensaLateralDer =
      TextEditingController();
  TextEditingController get controllerDefensaLateralDer =>
      _controllerDefensaLateralDer;
  set controllerDefensaLateralDer(TextEditingController value) {
    _controllerDefensaLateralDer.text = value.text;
    notifyListeners();
  }

  String _defensaLateralDer = '';
  String get defensaLateralDer => _defensaLateralDer;
  set defensaLateralDer(String value) {
    _defensaLateralDer = value;
    notifyListeners();
  }

  bool? _llantaPos1checked = false;
  bool? get llantaPos1checked => _llantaPos1checked;
  set llantaPos1checked(bool? value) {
    _llantaPos1checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos1 = TextEditingController();
  TextEditingController get controllerllantaPos1 => _controllerllantaPos1;
  set controllerllantaPos1(TextEditingController value) {
    _controllerllantaPos1.text = value.text;
    notifyListeners();
  }

  String _llantaPos1 = '';
  String get llantaPos1 => _llantaPos1;
  set llantaPos1(String value) {
    _llantaPos1 = value;
    notifyListeners();
  }

  bool? _puertaDerchecked = false;
  bool? get puertaDerchecked => _puertaDerchecked;
  set puertaDerchecked(bool? value) {
    _puertaDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerPuertaDer = TextEditingController();
  TextEditingController get controllerPuertaDer => _controllerPuertaDer;
  set controllerPuertaDer(TextEditingController value) {
    _controllerPuertaDer.text = value.text;
    notifyListeners();
  }

  String _puertaDer = '';
  String get puertaDer => _puertaDer;
  set puertaDer(String value) {
    _puertaDer = value;
    notifyListeners();
  }

  bool _cofreLateralDerchecked = false;
  bool get cofreLateralDerchecked => _cofreLateralDerchecked;
  set cofreLateralDerchecked(bool value) {
    _cofreLateralDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllercofreLateralDer =
      TextEditingController();
  TextEditingController get controllercofreLateralDer =>
      _controllercofreLateralDer;
  set controllercofreLateralDer(TextEditingController value) {
    _controllercofreLateralDer.text = value.text;
    notifyListeners();
  }

  String _cofreLateralDer = '';
  String get cofreLateralDer => _cofreLateralDer;
  set cofreLateralDer(String value) {
    _cofreLateralDer = value;
    notifyListeners();
  }

  bool _faldonesDerchecked = false;
  bool get faldonesDerchecked => _faldonesDerchecked;
  set faldonesDerchecked(bool value) {
    _faldonesDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerfaldonesDer = TextEditingController();
  TextEditingController get controllerfaldonesDer => _controllerfaldonesDer;
  set controllerfaldonesDer(TextEditingController value) {
    _controllerfaldonesDer.text = value.text;
    notifyListeners();
  }

  String _faldonesDer = '';
  String get faldonesDer => _faldonesDer;
  set faldonesDer(String value) {
    _faldonesDer = value;
    notifyListeners();
  }

  bool _ventanasDerchecked = false;
  bool get ventanasDerchecked => _ventanasDerchecked;
  set ventanasDerchecked(bool value) {
    _ventanasDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerventanasDer = TextEditingController();
  TextEditingController get controllerventanasDer => _controllerventanasDer;
  set controllerventanasDer(TextEditingController value) {
    _controllerventanasDer.text = value.text;
    notifyListeners();
  }

  String _ventanasDer = '';
  String get ventanasDer => _ventanasDer;
  set ventanasDer(String value) {
    _ventanasDer = value;
    notifyListeners();
  }

  bool _espejoCofreDerchecked = false;
  bool get espejoCofreDerchecked => _espejoCofreDerchecked;
  set espejoCofreDerchecked(bool value) {
    _espejoCofreDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerespejoCofreDer =
      TextEditingController();
  TextEditingController get controllerespejoCofreDer =>
      _controllerespejoCofreDer;
  set controllerespejoCofreDer(TextEditingController value) {
    _controllerespejoCofreDer.text = value.text;
    notifyListeners();
  }

  String _espejoCofreDer = '';
  String get espejoCofreDer => _espejoCofreDer;
  set espejoCofreDer(String value) {
    _espejoCofreDer = value;
    notifyListeners();
  }

  bool _conchaEspejosDerchecked = false;
  bool get conchaEspejosDerchecked => _conchaEspejosDerchecked;
  set conchaEspejosDerchecked(bool value) {
    _conchaEspejosDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerconchaEspejosDer =
      TextEditingController();
  TextEditingController get controllerconchaEspejosDer =>
      _controllerconchaEspejosDer;
  set controllerconchaEspejosDer(TextEditingController value) {
    _controllerconchaEspejosDer.text = value.text;
    notifyListeners();
  }

  String _conchaEspejosDer = '';
  String get conchaEspejosDer => _conchaEspejosDer;
  set conchaEspejosDer(String value) {
    _conchaEspejosDer = value;
    notifyListeners();
  }

  bool _costadoDerCabinachecked = false;
  bool get costadoDerCabinachecked => _costadoDerCabinachecked;
  set costadoDerCabinachecked(bool value) {
    _costadoDerCabinachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllercostadoDerCabina =
      TextEditingController();
  TextEditingController get controllercostadoDerCabina =>
      _controllercostadoDerCabina;
  set controllercostadoDerCabina(TextEditingController value) {
    _controllercostadoDerCabina.text = value.text;
    notifyListeners();
  }

  String _costadoDerCabina = '';
  String get costadoDerCabina => _costadoDerCabina;
  set costadoDerCabina(String value) {
    _costadoDerCabina = value;
    notifyListeners();
  }

  bool _aleronesDerchecked = false;
  bool get aleronesDerchecked => _aleronesDerchecked;
  set aleronesDerchecked(bool value) {
    _aleronesDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controlleraleronesDer = TextEditingController();
  TextEditingController get controlleraleronesDer => _controlleraleronesDer;
  set controlleraleronesDer(TextEditingController value) {
    _controlleraleronesDer.text = value.text;
    notifyListeners();
  }

  String _aleronesDer = '';
  String get aleronesDer => _aleronesDer;
  set aleronesDer(String value) {
    _aleronesDer = value;
    notifyListeners();
  }

  bool _copeteCostadoDerchecked = false;
  bool get copeteCostadoDerchecked => _copeteCostadoDerchecked;
  set copeteCostadoDerchecked(bool value) {
    _copeteCostadoDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllercopeteCostadoDer =
      TextEditingController();
  TextEditingController get controllercopeteCostadoDer =>
      _controllercopeteCostadoDer;
  set controllercopeteCostadoDer(TextEditingController value) {
    _controllercopeteCostadoDer.text = value.text;
    notifyListeners();
  }

  String _copeteCostadoDer = '';
  String get copeteCostadoDer => _copeteCostadoDer;
  set copeteCostadoDer(String value) {
    _copeteCostadoDer = value;
    notifyListeners();
  }

  bool _estribosDerchecked = false;
  bool get estribosDerchecked => _estribosDerchecked;
  set estribosDerchecked(bool value) {
    _estribosDerchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerestribosDer = TextEditingController();
  TextEditingController get controllerestribosDer => _controllerestribosDer;
  set controllerestribosDer(TextEditingController value) {
    _controllerestribosDer.text = value.text;
    notifyListeners();
  }

  String _estribosDer = '';
  String get estribosDer => _estribosDer;
  set estribosDer(String value) {
    _estribosDer = value;
    notifyListeners();
  }
}
