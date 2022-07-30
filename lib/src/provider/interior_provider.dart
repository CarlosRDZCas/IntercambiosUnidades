import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class InteriorProvider extends ChangeNotifier {
  void clear() {
    imagenInterior = null;
    imagenInterior2 = null;
    imagenInterior3 = null;
    colchonchecked = false;
    llavesEncendidochecked = false;
    controleschecked = false;
    tapiceriachecked = false;
    estereochecked = false;
    limpiezaUnidadchecked = false;
    carpetachecked = false;
    acchecked = false;
    controllerColchon = TextEditingController(text: '');
    colchon = '';
    controllerLlavesEncendido = TextEditingController(text: '');
    llavesEncendido = '';
    controllerControles = TextEditingController(text: '');
    controles = '';
    controllerTapiceria = TextEditingController(text: '');
    tapiceria = '';
    controllerEstereo = TextEditingController(text: '');
    estereo = '';
    controllerLimpiezaUnidad = TextEditingController(text: '');
    limpiezaUnidad = '';
    controllerCarpeta = TextEditingController(text: '');
    carpeta = '';
    controllerAC = TextEditingController(text: '');
    ac = '';
    notifyListeners();
  }

  XFile? _imagenInterior;
  XFile? get imagenInterior => _imagenInterior;
  set imagenInterior(XFile? value) {
    _imagenInterior = value;
    notifyListeners();
  }

  XFile? _imagenInterior2;
  XFile? get imagenInterior2 => _imagenInterior2;
  set imagenInterior2(XFile? value) {
    _imagenInterior2 = value;
    notifyListeners();
  }

  XFile? _imagenInterior3;
  XFile? get imagenInterior3 => _imagenInterior3;
  set imagenInterior3(XFile? value) {
    _imagenInterior3 = value;
    notifyListeners();
  }

  bool? _colchonchecked = false;
  bool? get colchonchecked => _colchonchecked;
  set colchonchecked(bool? value) {
    _colchonchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerColchon = TextEditingController();
  TextEditingController get controllerColchon => _controllerColchon;
  set controllerColchon(TextEditingController value) {
    _controllerColchon.text = value.text;
    notifyListeners();
  }

  String _colchon = '';
  String get colchon => _colchon;
  set colchon(String value) {
    _colchon = value;
    notifyListeners();
  }

  bool? _llavesEncendidochecked = false;
  bool? get llavesEncendidochecked => _llavesEncendidochecked;
  set llavesEncendidochecked(bool? value) {
    _llavesEncendidochecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerLlavesEncendido =
      TextEditingController();
  TextEditingController get controllerLlavesEncendido =>
      _controllerLlavesEncendido;
  set controllerLlavesEncendido(TextEditingController value) {
    _controllerLlavesEncendido.text = value.text;
    notifyListeners();
  }

  String _llavesEncendido = '';
  String get llavesEncendido => _llavesEncendido;
  set llavesEncendido(String value) {
    _llavesEncendido = value;
    notifyListeners();
  }

  bool? _controleschecked = false;
  bool? get controleschecked => _controleschecked;
  set controleschecked(bool? value) {
    _controleschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerControles = TextEditingController();
  TextEditingController get controllerControles => _controllerControles;
  set controllerControles(TextEditingController value) {
    _controllerControles.text = value.text;
    notifyListeners();
  }

  String _controles = '';
  String get controles => _controles;
  set controles(String value) {
    _controles = value;
    notifyListeners();
  }

  bool? _tapiceriachecked = false;
  bool? get tapiceriachecked => _tapiceriachecked;
  set tapiceriachecked(bool? value) {
    _tapiceriachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerTapiceria = TextEditingController();
  TextEditingController get controllerTapiceria => _controllerTapiceria;
  set controllerTapiceria(TextEditingController value) {
    _controllerTapiceria.text = value.text;
    notifyListeners();
  }

  String _tapiceria = '';
  String get tapiceria => _tapiceria;
  set tapiceria(String value) {
    _tapiceria = value;
    notifyListeners();
  }

  bool? _estereochecked = false;
  bool? get estereochecked => _estereochecked;
  set estereochecked(bool? value) {
    _estereochecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerEstereo = TextEditingController();
  TextEditingController get controllerEstereo => _controllerEstereo;
  set controllerEstereo(TextEditingController value) {
    _controllerEstereo.text = value.text;
    notifyListeners();
  }

  String _estereo = '';
  String get estereo => _estereo;
  set estereo(String value) {
    _estereo = value;
    notifyListeners();
  }

  bool? _limpiezaUnidadchecked = false;
  bool? get limpiezaUnidadchecked => _limpiezaUnidadchecked;
  set limpiezaUnidadchecked(bool? value) {
    _limpiezaUnidadchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerLimpiezaUnidad =
      TextEditingController();
  TextEditingController get controllerLimpiezaUnidad =>
      _controllerLimpiezaUnidad;
  set controllerLimpiezaUnidad(TextEditingController value) {
    _controllerLimpiezaUnidad.text = value.text;
    notifyListeners();
  }

  String _limpiezaUnidad = '';
  String get limpiezaUnidad => _limpiezaUnidad;
  set limpiezaUnidad(String value) {
    _limpiezaUnidad = value;
    notifyListeners();
  }

  bool? _carpetachecked = false;
  bool? get carpetachecked => _carpetachecked;
  set carpetachecked(bool? value) {
    _carpetachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerCarpeta = TextEditingController();
  TextEditingController get controllerCarpeta => _controllerCarpeta;
  set controllerCarpeta(TextEditingController value) {
    _controllerCarpeta.text = value.text;
    notifyListeners();
  }

  String _carpeta = '';
  String get carpeta => _carpeta;
  set carpeta(String value) {
    _carpeta = value;
    notifyListeners();
  }

  bool? _acchecked = false;
  bool? get acchecked => _acchecked;
  set acchecked(bool? value) {
    _acchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerAC = TextEditingController();
  TextEditingController get controllerAC => _controllerAC;
  set controllerAC(TextEditingController value) {
    _controllerAC.text = value.text;
    notifyListeners();
  }

  String _ac = '';
  String get ac => _ac;
  set ac(String value) {
    _ac = value;
    notifyListeners();
  }
}
