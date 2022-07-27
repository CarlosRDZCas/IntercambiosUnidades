// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'dart:convert';

class Login {
    Login({
        required this.mensaje,
        required this.id,
        this.menutwt,
        this.sucursal,
        this.esRo,
        this.empresa,
        required this.correo,
        this.usuario,
        this.clave,
        this.activo,
        this.nombre,
        this.puesto,
        this.idusuario,
        this.acceso,
        this.rutafile,
        this.mainpage,
    });

    String mensaje;
    int id;
    String? menutwt;
    String? sucursal;
    String? esRo;
    String? empresa;
    String correo;
    String? usuario;
    int? clave;
    String? activo;
    String? nombre;
    String? puesto;
    int? idusuario;
    double? acceso;
    String? rutafile;
    String? mainpage;

    factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Login.fromMap(Map<String, dynamic> json) => Login(
        mensaje: json["Mensaje"],
        id: json["ID"],
        menutwt: json["menutwt"],
        sucursal: json["sucursal"],
        esRo: json["es_ro"],
        empresa: json["empresa"],
        correo: json["correo"],
        usuario: json["usuario"],
        clave: json["clave"],
        activo: json["activo"],
        nombre: json["nombre"],
        puesto: json["puesto"],
        idusuario: json["idusuario"],
        acceso: json["acceso"],
        rutafile: json["rutafile"],
        mainpage: json["mainpage"],
    );

    Map<String, dynamic> toMap() => {
        "Mensaje": mensaje,
        "ID": id,
        "menutwt": menutwt,
        "sucursal": sucursal,
        "es_ro": esRo,
        "empresa": empresa,
        "correo": correo,
        "usuario": usuario,
        "clave": clave,
        "activo": activo,
        "nombre": nombre,
        "puesto": puesto,
        "idusuario": idusuario,
        "acceso": acceso,
        "rutafile": rutafile,
        "mainpage": mainpage,
    };
}
