import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

import '../components/components.dart';
import '../provider/providers.dart';

class EditarImagen extends StatelessWidget {
  const EditarImagen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editImageProvider = Provider.of<EditImageProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          RepaintBoundary(
            key: editImageProvider.genKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(editImageProvider.image!),
                  fit: BoxFit.fill,
                ),
              ),
              child: GestureDetector(
                onPanUpdate: (DragUpdateDetails details) {
                  RenderBox? object = context.findRenderObject() as RenderBox?;
                  Offset localPosition =
                      object!.globalToLocal(details.globalPosition);
                  editImageProvider.points = List.from(editImageProvider.points)
                    ..add(localPosition);
                },
                onPanEnd: (DragEndDetails details) =>
                    editImageProvider.points.add(null),
                child: CustomPaint(
                  painter: Signature(points: editImageProvider.points),
                  size: Size.infinite,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          FloatingActionButton(
            backgroundColor: CustomColors.primary,
            heroTag: 'btnSalir',
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              editImageProvider.points = [];
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'btnLimpiar',
            backgroundColor: CustomColors.primary,
            child: const FaIcon(
                FontAwesomeIcons.arrowRotateLeft), //const Icon(Icons.clea),
            onPressed: () => editImageProvider.points = [],
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
              backgroundColor: CustomColors.primary,
              heroTag: 'btnConfirmar',
              child: const Icon(Icons.check),
              onPressed: () {
                takePicture(context);
              }),
        ],
      ),
    );
  }
}

Future<void> takePicture(context) async {
  String dia = DateTime.now().day < 10
      ? '0${DateTime.now().day}'
      : '${DateTime.now().day}';
  String mes = DateTime.now().month < 10
      ? '0${DateTime.now().month}'
      : '${DateTime.now().month}';
  String anio = DateTime.now().year.toString();
  String hora = DateTime.now().hour < 10
      ? '0${DateTime.now().hour}'
      : '${DateTime.now().hour}';
  String minuto = DateTime.now().minute < 10
      ? '0${DateTime.now().minute}'
      : '${DateTime.now().minute}';
  String segundo = DateTime.now().second < 10
      ? '0${DateTime.now().second}'
      : '${DateTime.now().second}';
  final editImageProvider =
      Provider.of<EditImageProvider>(context, listen: false);
  RenderRepaintBoundary? boundary = editImageProvider.genKey.currentContext
      ?.findRenderObject() as RenderRepaintBoundary?;
  ui.Image image = await boundary!.toImage();
  final directory = (await getApplicationDocumentsDirectory()).path;
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();

  if (await Directory('$directory\\EditImages').exists()) {
    File imgFile;
    if (editImageProvider.image!.path.contains('_edit')) {
      imgFile = File(
          '$directory\\EditImages/${basename(editImageProvider.image!.path.substring(0, editImageProvider.image!.path.length - 24))}_${anio + mes + dia + hora + minuto + segundo}_edit.png');
    } else {
      imgFile = File(
          '$directory\\EditImages/${basename(editImageProvider.image!.path.substring(0, editImageProvider.image!.path.length - 4))}_${anio + mes + dia + hora + minuto + segundo}_edit.png');
    }
    imgFile.writeAsBytes(pngBytes);

    Navigator.pop(context, imgFile.path);
  } else {
    await Directory('$directory\\EditImages').create(recursive: true);
    File imgFile = File(
        '$directory\\EditImages/${basename(editImageProvider.image!.path.substring(0, editImageProvider.image!.path.length - 4))}_${anio + mes + dia + hora + minuto + segundo}_edit.png');
    imgFile.writeAsBytes(pngBytes);
    Navigator.pop(context, imgFile.path);
  }
}

class Signature extends CustomPainter {
  List<Offset?> points;
  Signature({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}
