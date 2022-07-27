// To parse this JSON data, do
//
//     final tractores = tractoresFromMap(jsonString);

import 'dart:convert';

class Tractores {
  Tractores({
    this.motor,
    this.kilometros,
    this.marca,
    this.modelo,
    this.placas,
  });

  String? motor;
  double? kilometros;
  String? marca;
  String? modelo;
  String? placas;

  factory Tractores.fromJson(String str) => Tractores.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tractores.fromMap(Map<String, dynamic> json) => Tractores(
        motor: json["motor"].toString().trim(),
        kilometros: json["kilometros"],
        marca: json["Marca"].toString().trim(),
        modelo: json["Modelo"].toString().trim(),
        placas: json["placas"].toString().trim(),
      );

  Map<String, dynamic> toMap() => {
        "motor": motor,
        "kilometros": kilometros,
        "Marca": marca,
        "Modelo": modelo,
        "placas": placas,
      };
}
