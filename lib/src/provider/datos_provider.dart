import 'package:flutter/cupertino.dart';
import 'package:intercambio_unidades/src/services/services.dart';

import '../models/models.dart';

class TractorProvider extends ChangeNotifier {
  final TextEditingController _controllerCarro = TextEditingController();
  TextEditingController get controllerCarro => _controllerCarro;
  set controllerCarro(TextEditingController value) {
    _controllerCarro.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerNoVin = TextEditingController();
  TextEditingController get controllerNoVin => _controllerNoVin;
  set controllerNoVin(TextEditingController value) {
    _controllerNoVin.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerAnio = TextEditingController();
  TextEditingController get controllerAnio => _controllerAnio;
  set controllerAnio(TextEditingController value) {
    _controllerAnio.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerModelo = TextEditingController();
  TextEditingController get controllerModelo => _controllerModelo;
  set controllerModelo(TextEditingController value) {
    _controllerModelo.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerMarca = TextEditingController();
  TextEditingController get controllerMarca => _controllerMarca;
  set controllerMarca(TextEditingController value) {
    _controllerMarca.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerMotor = TextEditingController();
  TextEditingController get controllerMotor => _controllerMotor;
  set controllerMotor(TextEditingController value) {
    _controllerMotor.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerKilometraje = TextEditingController();
  TextEditingController get controllerKilometraje => _controllerKilometraje;
  set controllerKilometraje(TextEditingController value) {
    _controllerKilometraje.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerPlaca = TextEditingController();
  TextEditingController get controllerPlaca => _controllerPlaca;
  set controllerPlaca(TextEditingController value) {
    _controllerPlaca.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerColor = TextEditingController();
  TextEditingController get controllerColor => _controllerColor;
  set controllerColor(TextEditingController value) {
    _controllerColor.text = value.text;
    notifyListeners();
  }

  final TextEditingController _controllerNivelAceite = TextEditingController();
  TextEditingController get controllerNivelAceite => _controllerNivelAceite;
  set controllerNivelAceite(TextEditingController value) {
    _controllerNivelAceite.text = value.text;
    notifyListeners();
  }

  Tractores _tractor = Tractores();
  Tractores get tractor => _tractor;
  set tractor(Tractores value) {
    _tractor = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _carro = '';
  String get carro => _carro;
  set carro(String value) {
    _carro = value;

    notifyListeners();
  }

  int _anio = 0;
  int get anio => _anio;
  set anio(int value) {
    _anio = value;
    controllerAnio = TextEditingController(text: value.toString());
    notifyListeners();
  }

  String _marca = '';
  String get marca => _marca;
  set marca(String value) {
    _marca = value;
    controllerMarca = TextEditingController(text: value);
    notifyListeners();
  }

  String _modelo = '';
  String get modelo => _modelo;
  set modelo(String value) {
    _modelo = value;
    controllerModelo = TextEditingController(text: value);
    notifyListeners();
  }

  String _motor = '';
  String get motor => _motor;
  set motor(String value) {
    _motor = value;
    controllerMotor = TextEditingController(text: value);
    notifyListeners();
  }

  String _noVin = '';
  String get noVin => _noVin;
  set noVin(String value) {
    _noVin = value;
    notifyListeners();
  }

  double _kilometraje = 0;
  double get kilometraje => _kilometraje;
  set kilometraje(double value) {
    _kilometraje = value;
    controllerKilometraje = TextEditingController(text: value.toString());
    notifyListeners();
  }

  String _placa = '';
  String get placa => _placa;
  set placa(String value) {
    _placa = value;
    controllerPlaca = TextEditingController(text: value);
    notifyListeners();
  }

  String _color = '';
  String get color => _color;
  set color(String value) {
    _color = value;
    notifyListeners();
  }

  double _nivelAceite = 0;
  double get nivelAceite => _nivelAceite;
  set nivelAceite(double value) {
    _nivelAceite = value;
    controllerNivelAceite = TextEditingController(text: value.toString());
    notifyListeners();
  }

  String _combustible = '0';
  String get combustible => _combustible;
  set combustible(String value) {
    _combustible = value;
    notifyListeners();
  }

  bool _motorchecked = false;
  bool get motorchecked => _motorchecked;
  set motorchecked(bool value) {
    _motorchecked = value;
    notifyListeners();
  }

  bool _transmisionchecked = false;
  bool get transmisionchecked => _transmisionchecked;
  set transmisionchecked(bool value) {
    _transmisionchecked = value;
    notifyListeners();
  }

  bool _ejeschecked = false;
  bool get ejeschecked => _ejeschecked;
  set ejeschecked(bool value) {
    _ejeschecked = value;
    notifyListeners();
  }

  void getDataTractor() async {
    isLoading = true;
    tractor = await TractoresService.getData(carro);
    kilometraje = tractor.kilometros!;
    marca = tractor.marca!;
    modelo = tractor.modelo!;
    anio = tractor.modelo.toString() == ''
        ? 0
        : int.parse(tractor.modelo.toString());
    motor = tractor.motor!;
    placa = tractor.placas!;
    isLoading = false;
  }

  void clear() {
    isLoading = false;
    carro = '';
    placa = '';
    anio = 0;
    motor = '';
    modelo = '';
    color = '';
    kilometraje = 0;
    marca = '';
    nivelAceite = 0;
    noVin = '';
    controllerCarro = TextEditingController(text: '');
    controllerAnio = TextEditingController(text: '');
    controllerMarca = TextEditingController(text: '');
    controllerModelo = TextEditingController(text: '');
    controllerMotor = TextEditingController(text: '');
    controllerKilometraje = TextEditingController(text: '');
    controllerPlaca = TextEditingController(text: '');
    controllerColor = TextEditingController(text: '');
    controllerNivelAceite = TextEditingController(text: '');
    controllerNoVin = TextEditingController(text: '');
    combustible = '0';
    motorchecked = false;
    transmisionchecked = false;
    ejeschecked = false;
    notifyListeners();
  }
}
