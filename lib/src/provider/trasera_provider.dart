import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class TraseraProvider extends ChangeNotifier {
  void clear() {
    imagenTrasera = null;
    imagenTrasera2 = null;
    imagenTrasera3 = null;
    placaTraserachecked = false;
    quintachecked = false;
    controllerquinta = TextEditingController(text: '');
    quinta = '';
    chirrioneschecked = false;
    controllerchirriones = TextEditingController(text: '');
    chirriones = '';
    guardafangoschecked = false;
    controllerguardafangos = TextEditingController(text: '');
    guardafangos = '';
    portaloderaschecked = false;
    controllerportaloderas = TextEditingController(text: '');
    portaloderas = '';
    loderaschecked = false;
    controlleraloderas = TextEditingController(text: '');
    loderas = '';
    lucesTraseraschecked = false;
    controllerlucesTraseras = TextEditingController(text: '');
    lucesTraseras = '';
    silenciadorchecked = false;
    controllersilenciador = TextEditingController(text: '');
    silenciador = '';
    bastidoreschecked = false;
    controllerbastidores = TextEditingController(text: '');
    bastidores = '';
    bolsaschecked = false;
    controllerbolsas = TextEditingController(text: '');
    bolsas = '';
    espaldaCabinachecked = false;
    controllerespaldaCabina = TextEditingController(text: '');
    espaldaCabina = '';
    mallaEscapechecked = false;
    controllermallaEscape = TextEditingController(text: '');
    mallaEscape = '';
    plataformaTrabajochecked = false;
    controllerplataformaTrabajo = TextEditingController(text: '');
    plataformaTrabajo = '';
    miembrosTransversaleschecked = false;
    controllermiembrosTransversales = TextEditingController(text: '');
    miembrosTransversales = '';
    manguerasServiciochecked = false;
    controllermanguerasServicio = TextEditingController(text: '');
    manguerasServicio = '';
    llantaPos3checked = false;
    controllerllantaPos3 = TextEditingController(text: '');
    llantaPos3 = '';
    llantaPos4checked = false;
    controllerllantaPos4 = TextEditingController(text: '');
    llantaPos4 = '';
    llantaPos5checked = false;
    controllerllantaPos5 = TextEditingController(text: '');
    llantaPos5 = '';
    llantaPos6checked = false;
    controllerllantaPos6 = TextEditingController(text: '');
    llantaPos6 = '';
    llantaPos7checked = false;
    controllerllantaPos7 = TextEditingController(text: '');
    llantaPos7 = '';
    llantaPos8checked = false;
    controllerllantaPos8 = TextEditingController(text: '');
    llantaPos8 = '';
    llantaPos9checked = false;
    controllerllantaPos9 = TextEditingController(text: '');
    llantaPos9 = '';
    llantaPos10checked = false;
    controllerllantaPos10 = TextEditingController(text: '');
    llantaPos10 = '';
    notifyListeners();
  }

  XFile? _imagenTrasera;
  XFile? get imagenTrasera => _imagenTrasera;
  set imagenTrasera(XFile? value) {
    _imagenTrasera = value;
    notifyListeners();
  }

  XFile? _imagenTrasera2;
  XFile? get imagenTrasera2 => _imagenTrasera2;
  set imagenTrasera2(XFile? value) {
    _imagenTrasera2 = value;
    notifyListeners();
  }

  XFile? _imagenTrasera3;
  XFile? get imagenTrasera3 => _imagenTrasera3;
  set imagenTrasera3(XFile? value) {
    _imagenTrasera3 = value;
    notifyListeners();
  }

  bool? _placaTraserachecked = false;
  bool? get placaTraserachecked => _placaTraserachecked;
  set placaTraserachecked(bool? value) {
    _placaTraserachecked = value;
    notifyListeners();
  }

  bool? _quintachecked = false;
  bool? get quintachecked => _quintachecked;
  set quintachecked(bool? value) {
    _quintachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerquinta = TextEditingController();
  TextEditingController get controllerquinta => _controllerquinta;
  set controllerquinta(TextEditingController value) {
    _controllerquinta.text = value.text;
    notifyListeners();
  }

  String _quinta = '';
  String get quinta => _quinta;
  set quinta(String value) {
    _quinta = value;
    notifyListeners();
  }

  bool? _chirrioneschecked = false;
  bool? get chirrioneschecked => _chirrioneschecked;
  set chirrioneschecked(bool? value) {
    _chirrioneschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerchirriones = TextEditingController();
  TextEditingController get controllerchirriones => _controllerchirriones;
  set controllerchirriones(TextEditingController value) {
    _controllerchirriones.text = value.text;
    notifyListeners();
  }

  String _chirriones = '';
  String get chirriones => _chirriones;
  set chirriones(String value) {
    _chirriones = value;
    notifyListeners();
  }

  bool? _guardafangoschecked = false;
  bool? get guardafangoschecked => _guardafangoschecked;
  set guardafangoschecked(bool? value) {
    _guardafangoschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerguardafangos = TextEditingController();
  TextEditingController get controllerguardafangos => _controllerguardafangos;
  set controllerguardafangos(TextEditingController value) {
    _controllerguardafangos.text = value.text;
    notifyListeners();
  }

  String _guardafangos = '';
  String get guardafangos => _guardafangos;
  set guardafangos(String value) {
    _guardafangos = value;
    notifyListeners();
  }

  bool _portaloderaschecked = false;
  bool get portaloderaschecked => _portaloderaschecked;
  set portaloderaschecked(bool value) {
    _portaloderaschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerportaloderas = TextEditingController();
  TextEditingController get controllerportaloderas => _controllerportaloderas;
  set controllerportaloderas(TextEditingController value) {
    _controllerportaloderas.text = value.text;
    notifyListeners();
  }

  String _portaloderas = '';
  String get portaloderas => _portaloderas;
  set portaloderas(String value) {
    _portaloderas = value;
    notifyListeners();
  }

  bool? _loderaschecked = false;
  bool? get loderaschecked => _loderaschecked;
  set loderaschecked(bool? value) {
    _loderaschecked = value;
    notifyListeners();
  }

  final TextEditingController _controlleraloderas = TextEditingController();
  TextEditingController get controlleraloderas => _controlleraloderas;
  set controlleraloderas(TextEditingController value) {
    _controlleraloderas.text = value.text;
    notifyListeners();
  }

  String _loderas = '';
  String get loderas => _loderas;
  set loderas(String value) {
    _loderas = value;
    notifyListeners();
  }

  bool? _lucesTraseraschecked = false;
  bool? get lucesTraseraschecked => _lucesTraseraschecked;
  set lucesTraseraschecked(bool? value) {
    _lucesTraseraschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerlucesTraseras =
      TextEditingController();
  TextEditingController get controllerlucesTraseras => _controllerlucesTraseras;
  set controllerlucesTraseras(TextEditingController value) {
    _controllerlucesTraseras.text = value.text;
    notifyListeners();
  }

  String _lucesTraseras = '';
  String get lucesTraseras => _lucesTraseras;
  set lucesTraseras(String value) {
    _lucesTraseras = value;
    notifyListeners();
  }

  bool? _silenciadorchecked = false;
  bool? get silenciadorchecked => _silenciadorchecked;
  set silenciadorchecked(bool? value) {
    _silenciadorchecked = value;
    notifyListeners();
  }

  final TextEditingController _controllersilenciador = TextEditingController();
  TextEditingController get controllersilenciador => _controllersilenciador;
  set controllersilenciador(TextEditingController value) {
    _controllersilenciador.text = value.text;
    notifyListeners();
  }

  String _silenciador = '';
  String get silenciador => _silenciador;
  set silenciador(String value) {
    _silenciador = value;
    notifyListeners();
  }

  bool? _bastidoreschecked = false;
  bool? get bastidoreschecked => _bastidoreschecked;
  set bastidoreschecked(bool? value) {
    _bastidoreschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerbastidores = TextEditingController();
  TextEditingController get controllerbastidores => _controllerbastidores;
  set controllerbastidores(TextEditingController value) {
    _controllerbastidores.text = value.text;
    notifyListeners();
  }

  String _bastidores = '';
  String get bastidores => _bastidores;
  set bastidores(String value) {
    _bastidores = value;
    notifyListeners();
  }

  bool? _bolsaschecked = false;
  bool? get bolsaschecked => _bolsaschecked;
  set bolsaschecked(bool? value) {
    _bolsaschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerbolsas = TextEditingController();
  TextEditingController get controllerbolsas => _controllerbolsas;
  set controllerbolsas(TextEditingController value) {
    _controllerbolsas.text = value.text;
    notifyListeners();
  }

  String _bolsas = '';
  String get bolsas => _bolsas;
  set bolsas(String value) {
    _bolsas = value;
    notifyListeners();
  }

  bool? _espaldaCabinachecked = false;
  bool? get espaldaCabinachecked => _espaldaCabinachecked;
  set espaldaCabinachecked(bool? value) {
    _espaldaCabinachecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerespaldaCabina =
      TextEditingController();
  TextEditingController get controllerespaldaCabina => _controllerespaldaCabina;
  set controllerespaldaCabina(TextEditingController value) {
    _controllerespaldaCabina.text = value.text;
    notifyListeners();
  }

  String _espaldaCabina = '';
  String get espaldaCabina => _espaldaCabina;
  set espaldaCabina(String value) {
    _espaldaCabina = value;
    notifyListeners();
  }

  bool? _mallaEscapechecked = false;
  bool? get mallaEscapechecked => _mallaEscapechecked;
  set mallaEscapechecked(bool? value) {
    _mallaEscapechecked = value;
    notifyListeners();
  }

  final TextEditingController _controllermallaEscape = TextEditingController();
  TextEditingController get controllermallaEscape => _controllermallaEscape;
  set controllermallaEscape(TextEditingController value) {
    _controllermallaEscape.text = value.text;
    notifyListeners();
  }

  String _mallaEscape = '';
  String get mallaEscape => _mallaEscape;
  set mallaEscape(String value) {
    _mallaEscape = value;
    notifyListeners();
  }

  bool? _plataformaTrabajochecked = false;
  bool? get plataformaTrabajochecked => _plataformaTrabajochecked;
  set plataformaTrabajochecked(bool? value) {
    _plataformaTrabajochecked = value;
    notifyListeners();
  }

  final TextEditingController _controllerplataformaTrabajo =
      TextEditingController();
  TextEditingController get controllerplataformaTrabajo =>
      _controllerplataformaTrabajo;
  set controllerplataformaTrabajo(TextEditingController value) {
    _controllerplataformaTrabajo.text = value.text;
    notifyListeners();
  }

  String _plataformaTrabajo = '';
  String get plataformaTrabajo => _plataformaTrabajo;
  set plataformaTrabajo(String value) {
    _plataformaTrabajo = value;
    notifyListeners();
  }

  bool? _miembrosTransversaleschecked = false;
  bool? get miembrosTransversaleschecked => _miembrosTransversaleschecked;
  set miembrosTransversaleschecked(bool? value) {
    _miembrosTransversaleschecked = value;
    notifyListeners();
  }

  final TextEditingController _controllermiembrosTransversales =
      TextEditingController();
  TextEditingController get controllermiembrosTransversales =>
      _controllermiembrosTransversales;
  set controllermiembrosTransversales(TextEditingController value) {
    _controllermiembrosTransversales.text = value.text;
    notifyListeners();
  }

  String _miembrosTransversales = '';
  String get miembrosTransversales => _miembrosTransversales;
  set miembrosTransversales(String value) {
    _miembrosTransversales = value;
    notifyListeners();
  }

  bool? _manguerasServiciochecked = false;
  bool? get manguerasServiciochecked => _manguerasServiciochecked;
  set manguerasServiciochecked(bool? value) {
    _manguerasServiciochecked = value;
    notifyListeners();
  }

  final TextEditingController _controllermanguerasServicio =
      TextEditingController();
  TextEditingController get controllermanguerasServicio =>
      _controllermanguerasServicio;
  set controllermanguerasServicio(TextEditingController value) {
    _controllermanguerasServicio.text = value.text;
    notifyListeners();
  }

  String _manguerasServicio = '';
  String get manguerasServicio => _manguerasServicio;
  set manguerasServicio(String value) {
    _manguerasServicio = value;
    notifyListeners();
  }

  bool? _llantaPos3checked = false;
  bool? get llantaPos3checked => _llantaPos3checked;
  set llantaPos3checked(bool? value) {
    _llantaPos3checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos3 = TextEditingController();
  TextEditingController get controllerllantaPos3 => _controllerllantaPos3;
  set controllerllantaPos3(TextEditingController value) {
    _controllerllantaPos3.text = value.text;
    notifyListeners();
  }

  String _llantaPos3 = '';
  String get llantaPos3 => _llantaPos3;
  set llantaPos3(String value) {
    _llantaPos3 = value;
    notifyListeners();
  }

  bool? _llantaPos4checked = false;
  bool? get llantaPos4checked => _llantaPos4checked;
  set llantaPos4checked(bool? value) {
    _llantaPos4checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos4 = TextEditingController();
  TextEditingController get controllerllantaPos4 => _controllerllantaPos4;
  set controllerllantaPos4(TextEditingController value) {
    _controllerllantaPos4.text = value.text;
    notifyListeners();
  }

  String _llantaPos4 = '';
  String get llantaPos4 => _llantaPos4;
  set llantaPos4(String value) {
    _llantaPos4 = value;
    notifyListeners();
  }

  bool? _llantaPos5checked = false;
  bool? get llantaPos5checked => _llantaPos5checked;
  set llantaPos5checked(bool? value) {
    _llantaPos5checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos5 = TextEditingController();
  TextEditingController get controllerllantaPos5 => _controllerllantaPos5;
  set controllerllantaPos5(TextEditingController value) {
    _controllerllantaPos5.text = value.text;
    notifyListeners();
  }

  String _llantaPos5 = '';
  String get llantaPos5 => _llantaPos5;
  set llantaPos5(String value) {
    _llantaPos5 = value;
    notifyListeners();
  }

  bool? _llantaPos6checked = false;
  bool? get llantaPos6checked => _llantaPos6checked;
  set llantaPos6checked(bool? value) {
    _llantaPos6checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos6 = TextEditingController();
  TextEditingController get controllerllantaPos6 => _controllerllantaPos6;
  set controllerllantaPos6(TextEditingController value) {
    _controllerllantaPos6.text = value.text;
    notifyListeners();
  }

  String _llantaPos6 = '';
  String get llantaPos6 => _llantaPos6;
  set llantaPos6(String value) {
    _llantaPos6 = value;
    notifyListeners();
  }

  bool? _llantaPos7checked = false;
  bool? get llantaPos7checked => _llantaPos7checked;
  set llantaPos7checked(bool? value) {
    _llantaPos7checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos7 = TextEditingController();
  TextEditingController get controllerllantaPos7 => _controllerllantaPos7;
  set controllerllantaPos7(TextEditingController value) {
    _controllerllantaPos7.text = value.text;
    notifyListeners();
  }

  String _llantaPos7 = '';
  String get llantaPos7 => _llantaPos7;
  set llantaPos7(String value) {
    _llantaPos7 = value;
    notifyListeners();
  }

  bool? _llantaPos8checked = false;
  bool? get llantaPos8checked => _llantaPos8checked;
  set llantaPos8checked(bool? value) {
    _llantaPos8checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos8 = TextEditingController();
  TextEditingController get controllerllantaPos8 => _controllerllantaPos8;
  set controllerllantaPos8(TextEditingController value) {
    _controllerllantaPos8.text = value.text;
    notifyListeners();
  }

  String _llantaPos8 = '';
  String get llantaPos8 => _llantaPos8;
  set llantaPos8(String value) {
    _llantaPos8 = value;
    notifyListeners();
  }

  bool? _llantaPos9checked = false;
  bool? get llantaPos9checked => _llantaPos9checked;
  set llantaPos9checked(bool? value) {
    _llantaPos9checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos9 = TextEditingController();
  TextEditingController get controllerllantaPos9 => _controllerllantaPos9;
  set controllerllantaPos9(TextEditingController value) {
    _controllerllantaPos9.text = value.text;
    notifyListeners();
  }

  String _llantaPos9 = '';
  String get llantaPos9 => _llantaPos9;
  set llantaPos9(String value) {
    _llantaPos9 = value;
    notifyListeners();
  }

  bool? _llantaPos10checked = false;
  bool? get llantaPos10checked => _llantaPos10checked;
  set llantaPos10checked(bool? value) {
    _llantaPos10checked = value;
    notifyListeners();
  }

  final TextEditingController _controllerllantaPos10 = TextEditingController();
  TextEditingController get controllerllantaPos10 => _controllerllantaPos10;
  set controllerllantaPos10(TextEditingController value) {
    _controllerllantaPos10.text = value.text;
    notifyListeners();
  }

  String _llantaPos10 = '';
  String get llantaPos10 => _llantaPos10;
  set llantaPos10(String value) {
    _llantaPos10 = value;
    notifyListeners();
  }
}
