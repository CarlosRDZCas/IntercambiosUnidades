import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

import 'package:intercambio_unidades/src/provider/providers.dart';

import 'package:intercambio_unidades/src/routes/routes.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await DartVLC.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => TractorProvider()),
        ChangeNotifierProvider(create: (_) => FrontalProvider()),
        ChangeNotifierProvider(create: (_) => LateralDerechoProvider()),
        ChangeNotifierProvider(create: (_) => LateralIzquierdoProvider()),
        ChangeNotifierProvider(create: (_) => TraseraProvider()),
        ChangeNotifierProvider(create: (_) => TrampasYAcumuladoresProvider()),
        ChangeNotifierProvider(create: (_) => InteriorProvider()),
        ChangeNotifierProvider(create: (_) => VideoProvider()),
        ChangeNotifierProvider(create: (_) => IntercambioProvider()),
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
        ChangeNotifierProvider(create: (_) => EditImageProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Intercambio Unidades',
        initialRoute: '/',
        onGenerateRoute: getRoutes(),
      ),
    );
  }
}
