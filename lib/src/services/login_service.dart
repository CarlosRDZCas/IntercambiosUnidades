import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class LoginService {
  static Future<Login> logIn(String user, String pass) async {
    try {
      const String baseUrl = "192.168.1.161:7025";
      final url = Uri.https(baseUrl, '/Login', {'User': user, 'pass': pass});
      final resp = await http.get(url);
      List usuariomap = json.decode(resp.body);
      if (usuariomap.isNotEmpty) {
        return Login.fromMap(usuariomap[0]);
      } else {
        return Login(
            mensaje: "Usuario o contraseña incorrectos",
            id: 0,
            menutwt: null,
            sucursal: null,
            esRo: null,
            empresa: null,
            correo: "",
            usuario: null,
            clave: null,
            activo: null,
            nombre: null,
            puesto: null,
            idusuario: null,
            acceso: null,
            rutafile: null,
            mainpage: null);
      }
    } catch (e) {
      return Login(
          mensaje: "Error de conexión",
          id: 0,
          menutwt: null,
          sucursal: null,
          esRo: null,
          empresa: null,
          correo: "",
          usuario: null,
          clave: null,
          activo: null,
          nombre: null,
          puesto: null,
          idusuario: null,
          acceso: null,
          rutafile: null,
          mainpage: null);
    }
  }
}
