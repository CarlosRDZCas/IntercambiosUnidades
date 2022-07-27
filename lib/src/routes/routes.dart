import 'package:flutter/cupertino.dart';
import 'package:intercambio_unidades/src/widgets/widgets.dart';

import '../pages/pages.dart';

getRoutes() {
  return (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
            builder: (_) => const LoginPage(), settings: settings);
      case 'Home':
        return CupertinoPageRoute(
            builder: (_) => const HomePage(), settings: settings);
      case 'Inspeccion':
        return CupertinoPageRoute(
            builder: (_) => const InspeccionPage(), settings: settings);
      case 'EditarImagen':
        return CupertinoPageRoute(
            builder: (_) => const EditarImagen(), settings: settings);
      case 'Intercambio':
        return CupertinoPageRoute(
            builder: (_) => const IntercambioPage(), settings: settings);
    }
  };
}
