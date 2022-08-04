import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/player_provider.dart';

class DartVLC extends StatelessWidget {
  final bool cons;
  const DartVLC({Key? key, required this.cons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);
    return SizedBox(
        height: MediaQuery.of(context).size.height - 165,
        child: cons
            ? Video(
                player: playerProvider.controllerCons,
              )
            : Video(
                player: playerProvider.controller,
              ));
  }
}
