import 'package:flutter/cupertino.dart';

class TrampasYAcumuladoresProvider extends ChangeNotifier {
  void clear() {
    trampaizquierdachecked = false;
    controllerTrampaIzquierda = TextEditingController(text: '');
    trampaIzquierda = '';
    trampaderechachecked = false;
    controllerTrampaDerecha = TextEditingController(text: '');
    trampaDerecha = '';
    acumuladoreschecked = false;
    controllerAcumuladores = TextEditingController(text: '');
    acumuladores = '';
    notifyListeners();
  }

  bool? _trampaizquierdachecked = false;
  bool? get trampaizquierdachecked => _trampaizquierdachecked;
  set trampaizquierdachecked(bool? value) {
    _trampaizquierdachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerTrampaIzquierda =
      TextEditingController();
  TextEditingController get controllerTrampaIzquierda =>
      _controllerTrampaIzquierda;
  set controllerTrampaIzquierda(TextEditingController value) {
    _controllerTrampaIzquierda.text = value.text;
    notifyListeners();
  }

  String _trampaIzquierda = '';
  String get trampaIzquierda => _trampaIzquierda;
  set trampaIzquierda(String value) {
    _trampaIzquierda = value;
    notifyListeners();
  }

  bool? _trampaderechachecked = false;
  bool? get trampaderechachecked => _trampaderechachecked;
  set trampaderechachecked(bool? value) {
    _trampaderechachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerTrampaDerecha =
      TextEditingController();
  TextEditingController get controllerTrampaDerecha => _controllerTrampaDerecha;
  set controllerTrampaDerecha(TextEditingController value) {
    _controllerTrampaDerecha.text = value.text;
    notifyListeners();
  }

  String _trampaDerecha = '';
  String get trampaDerecha => _trampaDerecha;
  set trampaDerecha(String value) {
    _trampaDerecha = value;
    notifyListeners();
  }

  bool? _acumuladoreschecked = false;
  bool? get acumuladoreschecked => _acumuladoreschecked;
  set acumuladoreschecked(bool? value) {
    _acumuladoreschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerAcumuladores = TextEditingController();
  TextEditingController get controllerAcumuladores => _controllerAcumuladores;
  set controllerAcumuladores(TextEditingController value) {
    _controllerAcumuladores.text = value.text;
    notifyListeners();
  }

  String _acumuladores = '';
  String get acumuladores => _acumuladores;
  set acumuladores(String value) {
    _acumuladores = value;
    notifyListeners();
  }
}
