import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LateralIzquierdoProvider extends ChangeNotifier {
  void clear() {
    imagenLateralIzq = null;
    defensaLateralIzqchecked = false;
    controllerDefensaLateralIzq = TextEditingController(text: '');
    defensaLateralIzq = '';
    llantaPos2checked = false;
    controllerllantaPos2 = TextEditingController(text: '');
    llantaPos2 = '';
    puertaIzqchecked = false;
    controllerPuertaIzq = TextEditingController(text: '');
    puertaIzq = '';
    cofreLateralIzqchecked = false;
    controllercofreLateralIzq = TextEditingController(text: '');
    cofreLateralIzq = '';
    faldonesIzqchecked = false;
    controllerfaldonesIzq = TextEditingController(text: '');
    faldonesIzq = '';
    ventanasIzqchecked = false;
    controllerventanasIzq = TextEditingController(text: '');
    ventanasIzq = '';
    espejoCofreIzqchecked = false;
    controllerespejoCofreIzq = TextEditingController(text: '');
    espejoCofreIzq = '';
    conchaEspejosIzqchecked = false;
    controllerconchaEspejosIzq = TextEditingController(text: '');
    conchaEspejosIzq = '';
    costadoIzqCabinachecked = false;
    controllercostadoIzqCabina = TextEditingController(text: '');
    costadoIzqCabina = '';
    aleronesIzqchecked = false;
    controlleraleronesIzq = TextEditingController(text: '');
    aleronesIzq = '';
    copeteCostadoIzqchecked = false;
    controllercopeteCostadoIzq = TextEditingController(text: '');
    copeteCostadoIzq = '';
    estribosIzqchecked = false;
    controllerestribosIzq = TextEditingController(text: '');
    estribosIzq = '';
    notifyListeners();
  }

  XFile? _imagenLateralIzq;
  XFile? get imagenLateralIzq => _imagenLateralIzq;
  set imagenLateralIzq(XFile? value) {
    _imagenLateralIzq = value;
    notifyListeners();
  }

  bool _defensaLateralIzqchecked = false;
  bool get defensaLateralIzqchecked => _defensaLateralIzqchecked;
  set defensaLateralIzqchecked(bool value) {
    _defensaLateralIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerDefensaLateralIzq =
      TextEditingController();
  TextEditingController get controllerDefensaLateralIzq =>
      _controllerDefensaLateralIzq;
  set controllerDefensaLateralIzq(TextEditingController value) {
    _controllerDefensaLateralIzq.text = value.text;
    notifyListeners();
  }

  String _defensaLateralIzq = '';
  String get defensaLateralIzq => _defensaLateralIzq;
  set defensaLateralIzq(String value) {
    _defensaLateralIzq = value;
    notifyListeners();
  }

  bool? _llantaPos2checked = false;
  bool? get llantaPos2checked => _llantaPos2checked;
  set llantaPos2checked(bool? value) {
    _llantaPos2checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos2 = TextEditingController();
  TextEditingController get controllerllantaPos2 => _controllerllantaPos2;
  set controllerllantaPos2(TextEditingController value) {
    _controllerllantaPos2.text = value.text;
    notifyListeners();
  }

  String _llantaPos2 = '';
  String get llantaPos2 => _llantaPos2;
  set llantaPos2(String value) {
    _llantaPos2 = value;
    notifyListeners();
  }

  bool? _puertaIzqchecked = false;
  bool? get puertaIzqchecked => _puertaIzqchecked;
  set puertaIzqchecked(bool? value) {
    _puertaIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerPuertaIzq = TextEditingController();
  TextEditingController get controllerPuertaIzq => _controllerPuertaIzq;
  set controllerPuertaIzq(TextEditingController value) {
    _controllerPuertaIzq.text = value.text;
    notifyListeners();
  }

  String _puertaIzq = '';
  String get puertaIzq => _puertaIzq;
  set puertaIzq(String value) {
    _puertaIzq = value;
    notifyListeners();
  }

  bool _cofreLateralIzqchecked = false;
  bool get cofreLateralIzqchecked => _cofreLateralIzqchecked;
  set cofreLateralIzqchecked(bool value) {
    _cofreLateralIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllercofreLateralIzq =
      TextEditingController();
  TextEditingController get controllercofreLateralIzq =>
      _controllercofreLateralIzq;
  set controllercofreLateralIzq(TextEditingController value) {
    _controllercofreLateralIzq.text = value.text;
    notifyListeners();
  }

  String _cofreLateralIzq = '';
  String get cofreLateralIzq => _cofreLateralIzq;
  set cofreLateralIzq(String value) {
    _cofreLateralIzq = value;
    notifyListeners();
  }

  bool _faldonesIzqchecked = false;
  bool get faldonesIzqchecked => _faldonesIzqchecked;
  set faldonesIzqchecked(bool value) {
    _faldonesIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerfaldonesIzq = TextEditingController();
  TextEditingController get controllerfaldonesIzq => _controllerfaldonesIzq;
  set controllerfaldonesIzq(TextEditingController value) {
    _controllerfaldonesIzq.text = value.text;
    notifyListeners();
  }

  String _faldonesIzq = '';
  String get faldonesIzq => _faldonesIzq;
  set faldonesIzq(String value) {
    _faldonesIzq = value;
    notifyListeners();
  }

  bool _ventanasIzqchecked = false;
  bool get ventanasIzqchecked => _ventanasIzqchecked;
  set ventanasIzqchecked(bool value) {
    _ventanasIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerventanasIzq = TextEditingController();
  TextEditingController get controllerventanasIzq => _controllerventanasIzq;
  set controllerventanasIzq(TextEditingController value) {
    _controllerventanasIzq.text = value.text;
    notifyListeners();
  }

  String _ventanasIzq = '';
  String get ventanasIzq => _ventanasIzq;
  set ventanasIzq(String value) {
    _ventanasIzq = value;
    notifyListeners();
  }

  bool _espejoCofreIzqchecked = false;
  bool get espejoCofreIzqchecked => _espejoCofreIzqchecked;
  set espejoCofreIzqchecked(bool value) {
    _espejoCofreIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerespejoCofreIzq =
      TextEditingController();
  TextEditingController get controllerespejoCofreIzq =>
      _controllerespejoCofreIzq;
  set controllerespejoCofreIzq(TextEditingController value) {
    _controllerespejoCofreIzq.text = value.text;
    notifyListeners();
  }

  String _espejoCofreIzq = '';
  String get espejoCofreIzq => _espejoCofreIzq;
  set espejoCofreIzq(String value) {
    _espejoCofreIzq = value;
    notifyListeners();
  }

  bool _conchaEspejosIzqchecked = false;
  bool get conchaEspejosIzqchecked => _conchaEspejosIzqchecked;
  set conchaEspejosIzqchecked(bool value) {
    _conchaEspejosIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerconchaEspejosIzq =
      TextEditingController();
  TextEditingController get controllerconchaEspejosIzq =>
      _controllerconchaEspejosIzq;
  set controllerconchaEspejosIzq(TextEditingController value) {
    _controllerconchaEspejosIzq.text = value.text;
    notifyListeners();
  }

  String _conchaEspejosIzq = '';
  String get conchaEspejosIzq => _conchaEspejosIzq;
  set conchaEspejosIzq(String value) {
    _conchaEspejosIzq = value;
    notifyListeners();
  }

  bool _costadoIzqCabinachecked = false;
  bool get costadoIzqCabinachecked => _costadoIzqCabinachecked;
  set costadoIzqCabinachecked(bool value) {
    _costadoIzqCabinachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllercostadoIzqCabina =
      TextEditingController();
  TextEditingController get controllercostadoIzqCabina =>
      _controllercostadoIzqCabina;
  set controllercostadoIzqCabina(TextEditingController value) {
    _controllercostadoIzqCabina.text = value.text;
    notifyListeners();
  }

  String _costadoIzqCabina = '';
  String get costadoIzqCabina => _costadoIzqCabina;
  set costadoIzqCabina(String value) {
    _costadoIzqCabina = value;
    notifyListeners();
  }

  bool _aleronesIzqchecked = false;
  bool get aleronesIzqchecked => _aleronesIzqchecked;
  set aleronesIzqchecked(bool value) {
    _aleronesIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controlleraleronesIzq = TextEditingController();
  TextEditingController get controlleraleronesIzq => _controlleraleronesIzq;
  set controlleraleronesIzq(TextEditingController value) {
    _controlleraleronesIzq.text = value.text;
    notifyListeners();
  }

  String _aleronesIzq = '';
  String get aleronesIzq => _aleronesIzq;
  set aleronesIzq(String value) {
    _aleronesIzq = value;
    notifyListeners();
  }

  bool _copeteCostadoIzqchecked = false;
  bool get copeteCostadoIzqchecked => _copeteCostadoIzqchecked;
  set copeteCostadoIzqchecked(bool value) {
    _copeteCostadoIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllercopeteCostadoIzq =
      TextEditingController();
  TextEditingController get controllercopeteCostadoIzq =>
      _controllercopeteCostadoIzq;
  set controllercopeteCostadoIzq(TextEditingController value) {
    _controllercopeteCostadoIzq.text = value.text;
    notifyListeners();
  }

  String _copeteCostadoIzq = '';
  String get copeteCostadoIzq => _copeteCostadoIzq;
  set copeteCostadoIzq(String value) {
    _copeteCostadoIzq = value;
    notifyListeners();
  }

  bool _estribosIzqchecked = false;
  bool get estribosIzqchecked => _estribosIzqchecked;
  set estribosIzqchecked(bool value) {
    _estribosIzqchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerestribosIzq = TextEditingController();
  TextEditingController get controllerestribosIzq => _controllerestribosIzq;
  set controllerestribosIzq(TextEditingController value) {
    _controllerestribosIzq.text = value.text;
    notifyListeners();
  }

  String _estribosIzq = '';
  String get estribosIzq => _estribosIzq;
  set estribosIzq(String value) {
    _estribosIzq = value;
    notifyListeners();
  }
}
