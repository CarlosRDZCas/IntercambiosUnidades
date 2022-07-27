import 'dart:convert';
import 'dart:io';

import 'package:ftpconnect/ftpconnect.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class TractoresService {
  static getData(String unidad) async {
    if (unidad.isEmpty) return null;
    const String baseUrl = "192.168.1.161:7025";
    final url = Uri.https(baseUrl, '/Tractores', {'Unidad': unidad});
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      List tractormap = json.decode(resp.body);
      if (tractormap.isNotEmpty) {
        return Tractores.fromMap(tractormap[0]);
      } else {
        return Tractores(
            motor: "", kilometros: 0, marca: "", modelo: "", placas: "");
      }
    } else {
      return Tractores(
          motor: "", kilometros: 0, marca: "", modelo: "", placas: "");
    }
  }

  static getIntercambio(String unidad) async {
    const String baseUrl = "192.168.1.161:7025";
    List<Intercambio> intercambios = [];
    final url = Uri.https(baseUrl, '/GetIntercambio', {'Unidad': unidad});
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      List intercambiosmap = json.decode(resp.body);
      if (intercambiosmap.isNotEmpty) {
        intercambios =
            intercambiosmap.map((i) => Intercambio.fromMap(i)).toList();
        return intercambios;
      } else {
        return intercambios;
      }
    } else {
      return intercambios;
    }
  }

  static Future<bool> postData(String body) async {
    const String baseUrl = "192.168.1.161:7025";
    final url = Uri.https(
      baseUrl,
      '/PostIntercambio',
    );
    final resp = await http
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

Future<bool> sendImageFTP(List<File> imagenes, String unidad) async {
  final FTPConnect ftpConnect = FTPConnect("twt.com.mx",
      user: "InterUnidad", pass: "Twoway2408", debug: true);

  Future<bool> _uploadStepByStep() async {
    String mes = DateTime.now().month < 10
        ? '0${DateTime.now().month.toString()}'
        : DateTime.now().month.toString();
    String dia = DateTime.now().day < 10
        ? '0${DateTime.now().day.toString()}'
        : DateTime.now().day.toString();

    String folder = DateTime.now().year.toString() + mes + dia;
    try {
      await ftpConnect.connect();
      await ftpConnect.createFolderIfNotExist(folder);
      await ftpConnect.changeDirectory(folder);
      await ftpConnect.createFolderIfNotExist(unidad);
      await ftpConnect.changeDirectory(unidad);
      for (var element in imagenes) {
        await ftpConnect.uploadFile(element);
      }
      await ftpConnect.disconnect();
      return true;
    } catch (e) {
      return false;
    }
  }

  return await _uploadStepByStep();
}
