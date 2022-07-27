import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class FrontalProvider extends ChangeNotifier {
  XFile? _imagenFrontal;
  XFile? get imagenFrontal => _imagenFrontal;
  set imagenFrontal(XFile? value) {
    _imagenFrontal = value;
    notifyListeners();
  }

  bool? _placaDelanterachecked = false;
  bool? get placaDelanterachecked => _placaDelanterachecked;
  set placaDelanterachecked(bool? value) {
    _placaDelanterachecked = value;
    notifyListeners();
  }

  bool? _iavechecked = false;
  bool? get iavechecked => _iavechecked;
  set iavechecked(bool? value) {
    _iavechecked = value;
    notifyListeners();
  }

  bool? _engomadochecked = false;
  bool? get engomadochecked => _engomadochecked;
  set engomadochecked(bool? value) {
    _engomadochecked = value;
    notifyListeners();
  }

  bool? _parrillachecked = false;
  bool? get parrillachecked => _parrillachecked;
  set parrillachecked(bool? value) {
    _parrillachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerParrilla = TextEditingController();
  TextEditingController get controllerParrilla => _controllerParrilla;
  set controllerParrilla(TextEditingController value) {
    _controllerParrilla.text = value.text;
    notifyListeners();
  }

  String _parrilla = '';
  String get parrilla => _parrilla;
  set parrilla(String value) {
    _parrilla = value;

    notifyListeners();
  }

  bool? _copetechechecked = false;
  bool? get copetechechecked => _copetechechecked;
  set copetechechecked(bool? value) {
    _copetechechecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerCopete = TextEditingController();
  TextEditingController get controllerCopete => _controllerCopete;
  set controllerCopete(TextEditingController value) {
    _controllerCopete.text = value.text;
    notifyListeners();
  }

  String _copete = '';
  String get copete => _copete;
  set copete(String value) {
    _copete = value;

    notifyListeners();
  }

  bool? _faroschechecked = false;
  bool? get faroschechecked => _faroschechecked;
  set faroschechecked(bool? value) {
    _faroschechecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerfaros = TextEditingController();
  TextEditingController get controllerfaros => _controllerfaros;
  set controllerfaros(TextEditingController value) {
    _controllerfaros.text = value.text;
    notifyListeners();
  }

  String _faros = '';
  String get faros => _faros;
  set faros(String value) {
    _faros = value;

    notifyListeners();
  }

  bool? _defensachechecked = false;
  bool? get defensachechecked => _defensachechecked;
  set defensachechecked(bool? value) {
    _defensachechecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerdefensa = TextEditingController();
  TextEditingController get controllerdefensa => _controllerdefensa;
  set controllerdefensa(TextEditingController value) {
    _controllerdefensa.text = value.text;
    notifyListeners();
  }

  String _defensa = '';
  String get defensa => _defensa;
  set defensa(String value) {
    _defensa = value;

    notifyListeners();
  }

  bool? _cofreCentralchechecked = false;
  bool? get cofreCentralchechecked => _cofreCentralchechecked;
  set cofreCentralchechecked(bool? value) {
    _cofreCentralchechecked = value;
    notifyListeners();
  }

  final TextEditingController _controllercofreCentral = TextEditingController();
  TextEditingController get controllercofreCentral => _controllercofreCentral;
  set controllercofreCentral(TextEditingController value) {
    _controllercofreCentral.text = value.text;
    notifyListeners();
  }

  String _cofreCentral = '';
  String get cofreCentral => _cofreCentral;
  set cofreCentral(String value) {
    _cofreCentral = value;

    notifyListeners();
  }

  bool? _parabrisaschechecked = false;
  bool? get parabrisaschechecked => _parabrisaschechecked;
  set parabrisaschechecked(bool? value) {
    _parabrisaschechecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerparabrisas = TextEditingController();
  TextEditingController get controllerparabrisas => _controllerparabrisas;
  set controllerparabrisas(TextEditingController value) {
    _controllerparabrisas.text = value.text;
    notifyListeners();
  }

  String _parabrisas = '';
  String get parabrisas => _parabrisas;
  set parabrisas(String value) {
    _parabrisas = value;

    notifyListeners();
  }

  bool? _conchaEspejoschechecked = false;
  bool? get conchaEspejoschechecked => _conchaEspejoschechecked;
  set conchaEspejoschechecked(bool? value) {
    _conchaEspejoschechecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerconchaEspejos =
      TextEditingController();
  TextEditingController get controllerconchaEspejos => _controllerconchaEspejos;
  set controllerconchaEspejos(TextEditingController value) {
    _controllerconchaEspejos.text = value.text;
    notifyListeners();
  }

  String _conchaEspejos = '';
  String get conchaEspejos => _conchaEspejos;
  set conchaEspejos(String value) {
    _conchaEspejos = value;

    notifyListeners();
  }

  void clear() {
    _controllerParrilla.text = '';
    _controllerCopete.text = '';
    _controllerfaros.text = '';
    _controllerdefensa.text = '';
    _controllercofreCentral.text = '';
    _controllerparabrisas.text = '';
    _controllerconchaEspejos.text = '';
    imagenFrontal = null;
    placaDelanterachecked = false;
    iavechecked = false;
    engomadochecked = false;
    parrillachecked = false;
    parrilla = '';
    copetechechecked = false;
    copete = '';
    faroschechecked = false;
    faros = '';
    defensachechecked = false;
    defensa = '';
    cofreCentralchechecked = false;
    cofreCentral = '';
    parabrisaschechecked = false;
    parabrisas = '';
    conchaEspejoschechecked = false;
    conchaEspejos = '';
    notifyListeners();
  }
}
