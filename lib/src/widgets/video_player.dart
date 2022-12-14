import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/providers.dart';

class CustomVideoPlayer extends StatelessWidget {
  final bool cons;
  const CustomVideoPlayer({Key? key, required this.cons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cons
            ? SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 250,
                child: AspectRatio(
                  aspectRatio: videoProvider.controllerCons!.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      VideoPlayer(videoProvider.controllerCons!),
                    ],
                  ),
                ),
              )
            : SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 250,
                child: AspectRatio(
                  aspectRatio: videoProvider.controller!.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      VideoPlayer(videoProvider.controller!),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
