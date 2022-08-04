import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intercambio_unidades/src/components/snackbar.dart';

import 'package:intercambio_unidades/src/components/take_photo.dart';

import 'package:intercambio_unidades/src/widgets/dart_vlc.dart';

import 'package:provider/provider.dart';

import '../components/colors.dart';
import '../provider/providers.dart';

import '../widgets/widgets.dart';

class InspeccionPage extends StatelessWidget {
  const InspeccionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intercambioProvider = Provider.of<IntercambioProvider>(context);
    return SafeArea(
      child: DefaultTabController(
        length: 8,
        child: Scaffold(
            appBar: const CustomAppBar(),
            body: Stack(
              children: [
                intercambioProvider.isLoading!
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: CustomColors.primary,
                            ),
                            const SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Flash(
                                duration: const Duration(seconds: 5),
                                infinite: true,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Espere un momento mientras se procesan las imagenes y el intercambio',
                                    style: TextStyle(
                                        color: CustomColors.primary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const TabBarView(
                        physics: BouncingScrollPhysics(),
                        children: [
                            TabDatos(),
                            TabFrontal(),
                            TabLateralDerecho(),
                            TabTrasera(),
                            TabLateralIzquierdo(),
                            TabTrampasYAcumuladores(),
                            TabInterior(),
                            TabVideo(),
                          ]),
              ],
            )),
      ),
    );
  }
}

class TabVideo extends StatelessWidget {
  const TabVideo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Platform.isWindows) {
      final playerProvider = Provider.of<VideoProvider>(context);
      return Padding(
        padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 8),
        child: Form(
          child: Column(
            children: [
              GestureDetector(
                child: playerProvider.video == null
                    ? SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 150,
                        child: FadeInLeft(
                          child: Image.asset(
                            'assets/images/takevideo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : const CustomVideoPlayer(cons: false),
                onTap: () {
                  showModal(
                    context,
                    true,
                    tomarVideo: () async {
                      Navigator.pop(context);
                      playerProvider.video =
                          await Camara.takePhoto(isVideo: true);
                    },
                    pickFile: () async {
                      Navigator.pop(context);
                      playerProvider.video =
                          await Camara.takePhotoFromGallery(isVideo: true);
                    },
                    eliminar: () {
                      Navigator.pop(context);
                      playerProvider.video = null;
                    },
                  );
                },
              ),
              const Controls(),
            ],
          ),
        ),
      );
    } else {
      final playerProvider = Provider.of<PlayerProvider>(context);
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: CustomColors.primary,
          onPressed: () {
            showModal(
              context,
              true,
              tomarVideo: () async {
                Navigator.pop(context);
                playerProvider.video = await Camara.takePhoto(isVideo: true);
              },
              pickFile: () async {
                Navigator.pop(context);
                playerProvider.video =
                    await Camara.takePhotoFromGallery(isVideo: true);
              },
              eliminar: () {
                Navigator.pop(context);
                playerProvider.video = null;
              },
            );
          },
          child: const Icon(Icons.settings_rounded),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 8),
          child: Form(
            child: Column(
              children: [
                playerProvider.video == null
                    ? FadeInLeft(
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height - 150,
                          child: Image.asset(
                            'assets/images/takevideo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : const DartVLC(cons: false),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class TabInterior extends StatelessWidget {
  const TabInterior({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final interiorProvider = Provider.of<InteriorProvider>(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModal(context, false, tomarFoto: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior =
                              await Camara.takePhoto(isVideo: false);
                        }, pickFile: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior =
                              await Camara.takePhotoFromGallery(isVideo: false);
                        }, eliminar: () {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior = null;
                        }, editarFoto: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior == null
                              ? ShowSnackBar(
                                  context,
                                  'Agrege una foto antes de editar',
                                  3,
                                  Colors.red)
                              : interiorProvider.imagenInterior =
                                  await imageEdit(context,
                                      interiorProvider.imagenInterior!.path);
                        }, limpiarFoto: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height - 150,
                        width: double.infinity,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: interiorProvider.imagenInterior == null
                            ? FadeInDown(
                                child: Image.asset(
                                'assets/images/interior.png',
                                fit: BoxFit.fill,
                              ))
                            : FadeInDown(
                                child: Image.file(
                                    File(
                                      interiorProvider.imagenInterior!.path,
                                    ),
                                    fit: BoxFit.fill),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModal(context, false, tomarFoto: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior2 =
                              await Camara.takePhoto(isVideo: false);
                        }, pickFile: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior2 =
                              await Camara.takePhotoFromGallery(isVideo: false);
                        }, eliminar: () {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior2 = null;
                        }, editarFoto: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior2 == null
                              ? ShowSnackBar(
                                  context,
                                  'Agrege una foto antes de editar',
                                  3,
                                  Colors.red)
                              : interiorProvider.imagenInterior2 =
                                  await imageEdit(context,
                                      interiorProvider.imagenInterior2!.path);
                        }, limpiarFoto: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height - 150,
                        width: double.infinity,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: interiorProvider.imagenInterior2 == null
                            ? FadeInDown(
                                child: Image.asset('assets/images/control.jpg',
                                    fit: BoxFit.fill))
                            : FadeInDown(
                                child: Image.file(
                                    File(
                                        interiorProvider.imagenInterior2!.path),
                                    fit: BoxFit.fill),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModal(context, false, tomarFoto: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior3 =
                              await Camara.takePhoto(isVideo: false);
                        }, pickFile: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior3 =
                              await Camara.takePhotoFromGallery(isVideo: false);
                        }, eliminar: () {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior3 = null;
                        }, editarFoto: () async {
                          Navigator.pop(context);
                          interiorProvider.imagenInterior3 == null
                              ? ShowSnackBar(
                                  context,
                                  'Agrege una foto antes de editar',
                                  3,
                                  Colors.red)
                              : interiorProvider.imagenInterior3 =
                                  await imageEdit(context,
                                      interiorProvider.imagenInterior3!.path);
                        }, limpiarFoto: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 150,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: interiorProvider.imagenInterior3 == null
                            ? FadeInDown(
                                child: Image.asset('assets/images/camarote.jpg',
                                    fit: BoxFit.fill),
                              )
                            : FadeInDown(
                                child: Image.file(
                                  File(interiorProvider.imagenInterior3!.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              CustomCheckboxListTile(
                  title: 'Colchon',
                  value: interiorProvider.colchonchecked,
                  onChanged: (value) {
                    interiorProvider.colchonchecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Colchon',
                  controller: interiorProvider.controllerColchon,
                  onChanged: (value) {
                    interiorProvider.colchon = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llaves de Encendido',
                  value: interiorProvider.llavesEncendidochecked,
                  onChanged: (value) {
                    interiorProvider.llavesEncendidochecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llaves de Encedido',
                  controller: interiorProvider.controllerLlavesEncendido,
                  onChanged: (value) {
                    interiorProvider.llavesEncendido = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Controles',
                  value: interiorProvider.controleschecked,
                  onChanged: (value) {
                    interiorProvider.controleschecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Controles',
                  controller: interiorProvider.controllerControles,
                  onChanged: (value) {
                    interiorProvider.controles = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Tapiceria',
                  value: interiorProvider.tapiceriachecked,
                  onChanged: (value) {
                    interiorProvider.tapiceriachecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Tapiceria',
                  controller: interiorProvider.controllerTapiceria,
                  onChanged: (value) {
                    interiorProvider.tapiceria = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Estereo',
                  value: interiorProvider.estereochecked,
                  onChanged: (value) {
                    interiorProvider.estereochecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Estereo',
                  controller: interiorProvider.controllerEstereo,
                  onChanged: (value) {
                    interiorProvider.estereo = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Limpieza de Unidad',
                  value: interiorProvider.limpiezaUnidadchecked,
                  onChanged: (value) {
                    interiorProvider.limpiezaUnidadchecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Limpieza de Unidad',
                  controller: interiorProvider.controllerLimpiezaUnidad,
                  onChanged: (value) {
                    interiorProvider.limpiezaUnidad = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Carpeta',
                  value: interiorProvider.carpetachecked,
                  onChanged: (value) {
                    interiorProvider.carpetachecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Carpeta',
                  controller: interiorProvider.controllerCarpeta,
                  onChanged: (value) {
                    interiorProvider.carpeta = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'A/C',
                  value: interiorProvider.acchecked,
                  onChanged: (value) {
                    interiorProvider.acchecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario A/C',
                  controller: interiorProvider.controllerAC,
                  onChanged: (value) {
                    interiorProvider.ac = value;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TabTrampasYAcumuladores extends StatelessWidget {
  const TabTrampasYAcumuladores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trampasyacumProvider =
        Provider.of<TrampasYAcumuladoresProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              CustomCheckboxListTile(
                  title: 'Trampa Izquierda',
                  value: trampasyacumProvider.trampaizquierdachecked,
                  onChanged: (value) {
                    trampasyacumProvider.trampaizquierdachecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Trampa Izquierda',
                  controller: trampasyacumProvider.controllerTrampaIzquierda,
                  onChanged: (value) {
                    trampasyacumProvider.trampaIzquierda = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Trampa Derecha',
                  value: trampasyacumProvider.trampaderechachecked,
                  onChanged: (value) {
                    trampasyacumProvider.trampaderechachecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Trampa Derecha',
                  controller: trampasyacumProvider.controllerTrampaDerecha,
                  onChanged: (value) {
                    trampasyacumProvider.trampaDerecha = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Acumuladores',
                  value: trampasyacumProvider.acumuladoreschecked,
                  onChanged: (value) {
                    trampasyacumProvider.acumuladoreschecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Acumuladores',
                  controller: trampasyacumProvider.controllerAcumuladores,
                  onChanged: (value) {
                    trampasyacumProvider.acumuladores = value;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TabTrasera extends StatelessWidget {
  const TabTrasera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final traseraProvider = Provider.of<TraseraProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModal(context, false, tomarFoto: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera =
                              await Camara.takePhoto(isVideo: false);
                        }, pickFile: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera =
                              await Camara.takePhotoFromGallery(isVideo: false);
                        }, eliminar: () {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera = null;
                        }, editarFoto: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera == null
                              ? ShowSnackBar(
                                  context,
                                  'Agrege una foto antes de editar',
                                  3,
                                  Colors.red)
                              : traseraProvider.imagenTrasera = await imageEdit(
                                  context, traseraProvider.imagenTrasera!.path);
                        }, limpiarFoto: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height - 150,
                        width: double.infinity,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: traseraProvider.imagenTrasera == null
                            ? FadeInDown(
                                child: Image.asset('assets/images/trasera.png',
                                    fit: BoxFit.fill))
                            : FadeInDown(
                                child: Image.file(
                                    File(traseraProvider.imagenTrasera!.path),
                                    fit: BoxFit.fill),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModal(context, false, tomarFoto: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera2 =
                              await Camara.takePhoto(isVideo: false);
                        }, pickFile: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera2 =
                              await Camara.takePhotoFromGallery(isVideo: false);
                        }, eliminar: () {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera2 = null;
                        }, editarFoto: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera2 == null
                              ? ShowSnackBar(
                                  context,
                                  'Agrege una foto antes de editar',
                                  3,
                                  Colors.red)
                              : traseraProvider.imagenTrasera2 =
                                  await imageEdit(context,
                                      traseraProvider.imagenTrasera2!.path);
                        }, limpiarFoto: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height - 150,
                        width: double.infinity,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: traseraProvider.imagenTrasera2 == null
                            ? FadeInDown(
                                child: Image.asset('assets/images/trasder.png',
                                    fit: BoxFit.fill))
                            : FadeInDown(
                                child: Image.file(
                                    File(traseraProvider.imagenTrasera2!.path),
                                    fit: BoxFit.fill),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModal(context, false, tomarFoto: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera3 =
                              await Camara.takePhoto(isVideo: false);
                        }, pickFile: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera3 =
                              await Camara.takePhotoFromGallery(isVideo: false);
                        }, eliminar: () {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera3 = null;
                        }, editarFoto: () async {
                          Navigator.pop(context);
                          traseraProvider.imagenTrasera3 == null
                              ? ShowSnackBar(
                                  context,
                                  'Agrege una foto antes de editar',
                                  3,
                                  Colors.red)
                              : traseraProvider.imagenTrasera3 =
                                  await imageEdit(context,
                                      traseraProvider.imagenTrasera3!.path);
                        }, limpiarFoto: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height - 150,
                        padding: const EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        child: traseraProvider.imagenTrasera3 == null
                            ? FadeInDown(
                                child: Image.asset('assets/images/trasizq.png',
                                    fit: BoxFit.fill),
                              )
                            : FadeInDown(
                                child: Image.file(
                                    File(traseraProvider.imagenTrasera3!.path),
                                    fit: BoxFit.fill),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              CustomCheckboxListTile(
                  title: 'Placa Trasera',
                  value: traseraProvider.placaTraserachecked,
                  onChanged: (value) {
                    traseraProvider.placaTraserachecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Quinta Rueda',
                  value: traseraProvider.quintachecked,
                  onChanged: (value) {
                    traseraProvider.quintachecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Comentario Quinta Rueda',
                controller: traseraProvider.controllerquinta,
                onChanged: (value) {
                  traseraProvider.quinta = value;
                },
              ),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Chirriones',
                  value: traseraProvider.chirrioneschecked,
                  onChanged: (value) {
                    traseraProvider.chirrioneschecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Chirriones',
                  controller: traseraProvider.controllerchirriones,
                  onChanged: (value) {
                    traseraProvider.chirriones = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Guardafangos',
                  value: traseraProvider.guardafangoschecked,
                  onChanged: (value) {
                    traseraProvider.guardafangoschecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Guardafangos',
                  controller: traseraProvider.controllerguardafangos,
                  onChanged: (value) {
                    traseraProvider.guardafangos = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Portaloderas',
                  value: traseraProvider.portaloderaschecked,
                  onChanged: (value) {
                    traseraProvider.portaloderaschecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Portaloderas',
                  controller: traseraProvider.controllerportaloderas,
                  onChanged: (value) {
                    traseraProvider.portaloderas = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Loderas',
                  value: traseraProvider.loderaschecked,
                  onChanged: (value) {
                    traseraProvider.loderaschecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Loderas',
                  controller: traseraProvider.controlleraloderas,
                  onChanged: (value) {
                    traseraProvider.loderas = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Luces Traseras',
                  value: traseraProvider.lucesTraseraschecked,
                  onChanged: (value) {
                    traseraProvider.lucesTraseraschecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Luces Traseras',
                  controller: traseraProvider.controllerlucesTraseras,
                  onChanged: (value) {
                    traseraProvider.lucesTraseras = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Silenciador',
                  value: traseraProvider.silenciadorchecked,
                  onChanged: (value) {
                    traseraProvider.silenciadorchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Silenciador',
                  controller: traseraProvider.controllersilenciador,
                  onChanged: (value) {
                    traseraProvider.silenciador = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Bastidores',
                  value: traseraProvider.bastidoreschecked,
                  onChanged: (value) {
                    traseraProvider.bastidoreschecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Bastidores',
                  controller: traseraProvider.controllerbastidores,
                  onChanged: (value) {
                    traseraProvider.bastidores = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Bolsas',
                  value: traseraProvider.bolsaschecked,
                  onChanged: (value) {
                    traseraProvider.bolsaschecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Bolsas',
                  controller: traseraProvider.controllerbolsas,
                  onChanged: (value) {
                    traseraProvider.bolsas = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Espalda Cabina',
                  value: traseraProvider.espaldaCabinachecked,
                  onChanged: (value) {
                    traseraProvider.espaldaCabinachecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Espalda Cabina',
                  controller: traseraProvider.controllerespaldaCabina,
                  onChanged: (value) {
                    traseraProvider.espaldaCabina = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Malla de Escape',
                  value: traseraProvider.mallaEscapechecked,
                  onChanged: (value) {
                    traseraProvider.mallaEscapechecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Malla de Escape',
                  controller: traseraProvider.controllermallaEscape,
                  onChanged: (value) {
                    traseraProvider.mallaEscape = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Plataforma de Trabajo',
                  value: traseraProvider.plataformaTrabajochecked,
                  onChanged: (value) {
                    traseraProvider.plataformaTrabajochecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Plataforma de Trabajo',
                  controller: traseraProvider.controllerplataformaTrabajo,
                  onChanged: (value) {
                    traseraProvider.plataformaTrabajo = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Miembros Transversales',
                  value: traseraProvider.miembrosTransversaleschecked,
                  onChanged: (value) {
                    traseraProvider.miembrosTransversaleschecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Miembros Transversales',
                  controller: traseraProvider.controllermiembrosTransversales,
                  onChanged: (value) {
                    traseraProvider.miembrosTransversales = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Mangueras de Servicio',
                  value: traseraProvider.manguerasServiciochecked,
                  onChanged: (value) {
                    traseraProvider.manguerasServiciochecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Mangueras de Servicio',
                  controller: traseraProvider.controllermanguerasServicio,
                  onChanged: (value) {
                    traseraProvider.manguerasServicio = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 3',
                  value: traseraProvider.llantaPos3checked,
                  onChanged: (value) {
                    traseraProvider.llantaPos3checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 3',
                  controller: traseraProvider.controllerllantaPos3,
                  onChanged: (value) {
                    traseraProvider.llantaPos3 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 4',
                  value: traseraProvider.llantaPos4checked,
                  onChanged: (value) {
                    traseraProvider.llantaPos4checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 4',
                  controller: traseraProvider.controllerllantaPos4,
                  onChanged: (value) {
                    traseraProvider.llantaPos4 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 5',
                  value: traseraProvider.llantaPos5checked,
                  onChanged: (value) {
                    traseraProvider.llantaPos5checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 5',
                  controller: traseraProvider.controllerllantaPos5,
                  onChanged: (value) {
                    traseraProvider.llantaPos5 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 6',
                  value: traseraProvider.llantaPos6checked,
                  onChanged: (value) {
                    traseraProvider.llantaPos6checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 6',
                  controller: traseraProvider.controllerllantaPos6,
                  onChanged: (value) {
                    traseraProvider.llantaPos6 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 7',
                  value: traseraProvider.llantaPos7checked,
                  onChanged: (value) {
                    traseraProvider.llantaPos7checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 7',
                  controller: traseraProvider.controllerllantaPos7,
                  onChanged: (value) {
                    traseraProvider.llantaPos7 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 8',
                  value: traseraProvider.llantaPos8checked,
                  onChanged: (value) {
                    traseraProvider.llantaPos8checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 8',
                  controller: traseraProvider.controllerllantaPos8,
                  onChanged: (value) {
                    traseraProvider.llantaPos8 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 9',
                  value: traseraProvider.llantaPos9checked,
                  onChanged: (value) {
                    traseraProvider.llantaPos9checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 9',
                  controller: traseraProvider.controllerllantaPos9,
                  onChanged: (value) {
                    traseraProvider.llantaPos9 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 10',
                  value: traseraProvider.llantaPos10checked,
                  onChanged: (value) {
                    traseraProvider.llantaPos10checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 10',
                  controller: traseraProvider.controllerllantaPos10,
                  onChanged: (value) {
                    traseraProvider.llantaPos10 = value;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TabLateralIzquierdo extends StatelessWidget {
  const TabLateralIzquierdo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tractorLateralIzq = Provider.of<LateralIzquierdoProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showModal(context, false, tomarFoto: () async {
                    Navigator.pop(context);
                    tractorLateralIzq.imagenLateralIzq =
                        await Camara.takePhoto(isVideo: false);
                  }, pickFile: () async {
                    Navigator.pop(context);
                    tractorLateralIzq.imagenLateralIzq =
                        await Camara.takePhotoFromGallery(isVideo: false);
                  }, eliminar: () {
                    Navigator.pop(context);
                    tractorLateralIzq.imagenLateralIzq = null;
                  }, editarFoto: () async {
                    Navigator.pop(context);
                    tractorLateralIzq.imagenLateralIzq == null
                        ? ShowSnackBar(context,
                            'Agrege una foto antes de editar', 3, Colors.red)
                        : tractorLateralIzq.imagenLateralIzq = await imageEdit(
                            context, tractorLateralIzq.imagenLateralIzq!.path);
                  }, limpiarFoto: () {
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 150,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: tractorLateralIzq.imagenLateralIzq == null
                      ? FadeInDown(
                          child: Image.asset(
                          'assets/images/lateralizq.png',
                          fit: BoxFit.fill,
                        ))
                      : FadeInDown(
                          child: Image.file(
                            File(tractorLateralIzq.imagenLateralIzq!.path),
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              ),
              CustomCheckboxListTile(
                  title: 'Defensa Lateral Izquierdo',
                  value: tractorLateralIzq.defensaLateralIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.defensaLateralIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Defensa Lateral Izquierdo',
                controller: tractorLateralIzq.controllerDefensaLateralIzq,
                onChanged: (value) {
                  tractorLateralIzq.defensaLateralIzq = value;
                },
              ),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 2',
                  value: tractorLateralIzq.llantaPos2checked,
                  onChanged: (value) {
                    tractorLateralIzq.llantaPos2checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 2',
                  controller: tractorLateralIzq.controllerllantaPos2,
                  onChanged: (value) {
                    tractorLateralIzq.llantaPos2 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Puerta Izquierda',
                  value: tractorLateralIzq.puertaIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.puertaIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Puerta Izquierda',
                  controller: tractorLateralIzq.controllerPuertaIzq,
                  onChanged: (value) {
                    tractorLateralIzq.puertaIzq = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Cofre Lateral Izquierdo',
                  value: tractorLateralIzq.cofreLateralIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.cofreLateralIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Cofre Lateral Izquierdo',
                  controller: tractorLateralIzq.controllercofreLateralIzq,
                  onChanged: (value) {
                    tractorLateralIzq.cofreLateralIzq = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Faldones',
                  value: tractorLateralIzq.faldonesIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.faldonesIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Faldones',
                  controller: tractorLateralIzq.controllerfaldonesIzq,
                  onChanged: (value) {
                    tractorLateralIzq.faldonesIzq = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Ventanas',
                  value: tractorLateralIzq.ventanasIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.ventanasIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Ventanas',
                  controller: tractorLateralIzq.controllerventanasIzq,
                  onChanged: (value) {
                    tractorLateralIzq.ventanasIzq = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Espejo Izquierdo de Cofre',
                  value: tractorLateralIzq.espejoCofreIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.espejoCofreIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Comentario Espejo Izquierdo de Cofre',
                controller: tractorLateralIzq.controllerespejoCofreIzq,
                onChanged: (value) {
                  tractorLateralIzq.espejoCofreIzq = value;
                },
              ),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Concha de Espejos',
                  value: tractorLateralIzq.conchaEspejosIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.conchaEspejosIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Concha de Espejos',
                  controller: tractorLateralIzq.controllerconchaEspejosIzq,
                  onChanged: (value) {
                    tractorLateralIzq.conchaEspejosIzq = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Costado Izquierdo de Cabina',
                  value: tractorLateralIzq.costadoIzqCabinachecked,
                  onChanged: (value) {
                    tractorLateralIzq.costadoIzqCabinachecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Costado Izquierdo de Cabina',
                  controller: tractorLateralIzq.controllercostadoIzqCabina,
                  onChanged: (value) {
                    tractorLateralIzq.costadoIzqCabina = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Alerones Izquierdos',
                  value: tractorLateralIzq.aleronesIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.aleronesIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Alerones Izquierdos',
                  controller: tractorLateralIzq.controlleraleronesIzq,
                  onChanged: (value) {
                    tractorLateralIzq.aleronesIzq = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Copete Costado Izquierdo',
                  value: tractorLateralIzq.copeteCostadoIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.copeteCostadoIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Copete Costado Izquierdo',
                  controller: tractorLateralIzq.controllercopeteCostadoIzq,
                  onChanged: (value) {
                    tractorLateralIzq.copeteCostadoIzq = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Estribos',
                  value: tractorLateralIzq.estribosIzqchecked,
                  onChanged: (value) {
                    tractorLateralIzq.estribosIzqchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Estribos',
                  controller: tractorLateralIzq.controllerestribosIzq,
                  onChanged: (value) {
                    tractorLateralIzq.estribosIzq = value;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TabLateralDerecho extends StatelessWidget {
  const TabLateralDerecho({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tractorLateralDer = Provider.of<LateralDerechoProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showModal(context, false, tomarFoto: () async {
                    Navigator.pop(context);
                    tractorLateralDer.imagenLateralDer =
                        await Camara.takePhoto(isVideo: false);
                  }, pickFile: () async {
                    Navigator.pop(context);
                    tractorLateralDer.imagenLateralDer =
                        await Camara.takePhotoFromGallery(isVideo: false);
                  }, eliminar: () {
                    Navigator.pop(context);
                    tractorLateralDer.imagenLateralDer = null;
                  }, editarFoto: () async {
                    Navigator.pop(context);
                    tractorLateralDer.imagenLateralDer == null
                        ? ShowSnackBar(context,
                            'Agrege una foto antes de editar', 3, Colors.red)
                        : tractorLateralDer.imagenLateralDer = await imageEdit(
                            context, tractorLateralDer.imagenLateralDer!.path);
                  }, limpiarFoto: () {
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 150,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: tractorLateralDer.imagenLateralDer == null
                      ? FadeInDown(
                          child: Image.asset(
                          'assets/images/lateralder.png',
                          fit: BoxFit.fill,
                        ))
                      : FadeInDown(
                          child: Image.file(
                            File(tractorLateralDer.imagenLateralDer!.path),
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              ),
              CustomCheckboxListTile(
                  title: 'Defensa Lateral Derecho',
                  value: tractorLateralDer.defensaLateralDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.defensaLateralDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Defensa Lateral Derecho',
                controller: tractorLateralDer.controllerDefensaLateralDer,
                onChanged: (value) {
                  tractorLateralDer.defensaLateralDer = value;
                },
              ),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Llanta Posicion 1',
                  value: tractorLateralDer.llantaPos1checked,
                  onChanged: (value) {
                    tractorLateralDer.llantaPos1checked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Llanta Posicion 1',
                  controller: tractorLateralDer.controllerllantaPos1,
                  onChanged: (value) {
                    tractorLateralDer.llantaPos1 = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Puerta Derecha',
                  value: tractorLateralDer.puertaDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.puertaDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Puerta Derecha',
                  controller: tractorLateralDer.controllerPuertaDer,
                  onChanged: (value) {
                    tractorLateralDer.puertaDer = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Cofre Lateral Derecho',
                  value: tractorLateralDer.cofreLateralDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.cofreLateralDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Cofre Lateral Derecho',
                  controller: tractorLateralDer.controllercofreLateralDer,
                  onChanged: (value) {
                    tractorLateralDer.cofreLateralDer = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Faldones',
                  value: tractorLateralDer.faldonesDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.faldonesDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Faldones',
                  controller: tractorLateralDer.controllerfaldonesDer,
                  onChanged: (value) {
                    tractorLateralDer.faldonesDer = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Ventanas',
                  value: tractorLateralDer.ventanasDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.ventanasDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Ventanas',
                  controller: tractorLateralDer.controllerventanasDer,
                  onChanged: (value) {
                    tractorLateralDer.ventanasDer = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Espejo Derecho de Cofre',
                  value: tractorLateralDer.espejoCofreDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.espejoCofreDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Comentario Espejo Derecho de Cofre',
                controller: tractorLateralDer.controllerespejoCofreDer,
                onChanged: (value) {
                  tractorLateralDer.espejoCofreDer = value;
                },
              ),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Concha de Espejos',
                  value: tractorLateralDer.conchaEspejosDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.conchaEspejosDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Concha de Espejos',
                  controller: tractorLateralDer.controllerconchaEspejosDer,
                  onChanged: (value) {
                    tractorLateralDer.conchaEspejosDer = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Costado Derecho de Cabina',
                  value: tractorLateralDer.costadoDerCabinachecked,
                  onChanged: (value) {
                    tractorLateralDer.costadoDerCabinachecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Costado Derecho de Cabina',
                  controller: tractorLateralDer.controllercostadoDerCabina,
                  onChanged: (value) {
                    tractorLateralDer.costadoDerCabina = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Alerones Derechos',
                  value: tractorLateralDer.aleronesDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.aleronesDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Alerones Derechos',
                  controller: tractorLateralDer.controlleraleronesDer,
                  onChanged: (value) {
                    tractorLateralDer.aleronesDer = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Copete Costado Derecho',
                  value: tractorLateralDer.copeteCostadoDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.copeteCostadoDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Copete Costado Derecho',
                  controller: tractorLateralDer.controllercopeteCostadoDer,
                  onChanged: (value) {
                    tractorLateralDer.copeteCostadoDer = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Estribos',
                  value: tractorLateralDer.estribosDerchecked,
                  onChanged: (value) {
                    tractorLateralDer.estribosDerchecked = value!;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Estribos',
                  controller: tractorLateralDer.controllerestribosDer,
                  onChanged: (value) {
                    tractorLateralDer.estribosDer = value;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TabFrontal extends StatelessWidget {
  const TabFrontal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tractorFrontal = Provider.of<FrontalProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showModal(context, false, tomarFoto: () async {
                    Navigator.pop(context);
                    tractorFrontal.imagenFrontal =
                        await Camara.takePhoto(isVideo: false);
                  }, pickFile: () async {
                    Navigator.pop(context);
                    tractorFrontal.imagenFrontal =
                        await Camara.takePhotoFromGallery(isVideo: false);
                  }, eliminar: () {
                    Navigator.pop(context);
                    tractorFrontal.imagenFrontal = null;
                  }, editarFoto: () async {
                    Navigator.pop(context);
                    tractorFrontal.imagenFrontal == null
                        ? ShowSnackBar(context,
                            'Agrege una foto antes de editar', 3, Colors.red)
                        : tractorFrontal.imagenFrontal = await imageEdit(
                            context, tractorFrontal.imagenFrontal!.path);
                  }, limpiarFoto: () {
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 150,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: tractorFrontal.imagenFrontal == null
                      ? FadeInDown(
                          child: Image.asset(
                          'assets/images/frontal.png',
                          fit: BoxFit.fill,
                        ))
                      : FadeInDown(
                          child: Image.file(
                          File(tractorFrontal.imagenFrontal!.path),
                          fit: BoxFit.fill,
                        )),
                ),
              ),
              CustomCheckboxListTile(
                title: 'Placa Delantera',
                value: tractorFrontal.placaDelanterachecked,
                onChanged: (value) {
                  tractorFrontal.placaDelanterachecked = value;
                },
              ),
              CustomCheckboxListTile(
                title: 'IAVE',
                value: tractorFrontal.iavechecked,
                onChanged: (value) {
                  tractorFrontal.iavechecked = value;
                },
              ),
              CustomCheckboxListTile(
                  title: 'Engomados',
                  value: tractorFrontal.engomadochecked,
                  onChanged: (value) {
                    tractorFrontal.engomadochecked = value;
                  }),
              CustomCheckboxListTile(
                  title: 'Parrilla',
                  value: tractorFrontal.parrillachecked,
                  onChanged: (value) {
                    tractorFrontal.parrillachecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Comentario Parrilla',
                controller: tractorFrontal.controllerParrilla,
                onChanged: (value) {
                  tractorFrontal.parrilla = value;
                },
              ),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Copete',
                  value: tractorFrontal.copetechechecked,
                  onChanged: (value) {
                    tractorFrontal.copetechechecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Copete',
                  controller: tractorFrontal.controllerCopete,
                  onChanged: (value) {
                    tractorFrontal.copete = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Faros',
                  value: tractorFrontal.faroschechecked,
                  onChanged: (value) {
                    tractorFrontal.faroschechecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Faros',
                  controller: tractorFrontal.controllerfaros,
                  onChanged: (value) {
                    tractorFrontal.faros = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Defensa',
                  value: tractorFrontal.defensachechecked,
                  onChanged: (value) {
                    tractorFrontal.defensachechecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Defensa',
                  controller: tractorFrontal.controllerdefensa,
                  onChanged: (value) {
                    tractorFrontal.defensa = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Cofre Central',
                  value: tractorFrontal.cofreCentralchechecked,
                  onChanged: (value) {
                    tractorFrontal.cofreCentralchechecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Cofre Central',
                  controller: tractorFrontal.controllercofreCentral,
                  onChanged: (value) {
                    tractorFrontal.cofreCentral = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Parabrisas',
                  value: tractorFrontal.parabrisaschechecked,
                  onChanged: (value) {
                    tractorFrontal.parabrisaschechecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Parabrisas',
                  controller: tractorFrontal.controllerparabrisas,
                  onChanged: (value) {
                    tractorFrontal.parabrisas = value;
                  }),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                  title: 'Concha de Espejos',
                  value: tractorFrontal.conchaEspejoschechecked,
                  onChanged: (value) {
                    tractorFrontal.conchaEspejoschechecked = value;
                  }),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Comentario Concha de Espejos',
                  controller: tractorFrontal.controllerconchaEspejos,
                  onChanged: (value) {
                    tractorFrontal.conchaEspejos = value;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TabDatos extends StatelessWidget {
  const TabDatos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tractorProvider = Provider.of<TractorProvider>(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextFormField(
                    labelText: 'Carro',
                    controller: tractorProvider.controllerCarro,
                    onChanged: (value) {
                      tractorProvider.carro = value;
                    },
                  )),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: CustomColors.primary,
                    ),
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {
                          tractorProvider.getDataTractor();
                        },
                        icon: const Icon(Icons.search)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Año',
                controller: tractorProvider.controllerAnio,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Marca',
                controller: tractorProvider.controllerMarca,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Modelo',
                controller: tractorProvider.controllerModelo,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Motor',
                controller: tractorProvider.controllerMotor,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'No. Vin.',
                controller: tractorProvider.controllerNoVin,
                onChanged: (value) {
                  tractorProvider.noVin = value;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Kilometraje',
                controller: tractorProvider.controllerKilometraje,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Placa',
                controller: tractorProvider.controllerPlaca,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Color',
                controller: tractorProvider.controllerColor,
                onChanged: (value) {
                  tractorProvider.color = value;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Nivel de Aceite',
                controller: tractorProvider.controllerNivelAceite,
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Combustible', style: TextStyle(fontSize: 15)),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: tractorProvider.combustible,
                focusColor: Colors.white,
                items: const [
                  DropdownMenuItem(value: '0', child: Text('0')),
                  DropdownMenuItem(value: '1/4', child: Text('1/4')),
                  DropdownMenuItem(value: '1/2', child: Text('1/2')),
                  DropdownMenuItem(value: '3/4', child: Text('3/4')),
                  DropdownMenuItem(value: 'Lleno', child: Text('Lleno')),
                ],
                onChanged: (value) {
                  tractorProvider.combustible = value.toString();
                },
                hint: const Text('Combustible'),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    borderSide: BorderSide(
                      color: CustomColors.primary,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Center(
                  child: Text(
                    'Checklist',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomCheckboxListTile(
                title: 'Motor',
                value: tractorProvider.motorchecked,
                onChanged: (value) {
                  tractorProvider.motorchecked = value!;
                },
              ),
              CustomCheckboxListTile(
                title: 'Transmision',
                value: tractorProvider.transmisionchecked,
                onChanged: (value) {
                  tractorProvider.transmisionchecked = value!;
                },
              ),
              CustomCheckboxListTile(
                title: 'Ejes',
                value: tractorProvider.ejeschecked,
                onChanged: (value) {
                  tractorProvider.ejeschecked = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    return videoProvider.isInitialized == true
        ? Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Duracion:  ${videoProvider.controller!.value.duration.toString().substring(2, 7)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Container(
                height: 89,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.fast_rewind_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          videoProvider.controller!.seekTo(Duration(
                              seconds: videoProvider
                                      .controller!.value.position.inSeconds -
                                  10));
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: videoProvider.isPlaying == true
                            ? Colors.blue
                            : CustomColors.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.play_arrow_rounded),
                        onPressed: () {
                          videoProvider.controller!.play();
                          videoProvider.isPlaying = true;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: videoProvider.isPlaying == false
                            ? Colors.red
                            : CustomColors.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.pause_rounded),
                        onPressed: () {
                          videoProvider.controller!.pause();
                          videoProvider.isPlaying = false;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.stop_rounded),
                        onPressed: () {
                          videoProvider.controller!
                              .seekTo(const Duration(seconds: 0));
                          videoProvider.controller!.pause();
                          videoProvider.isPlaying = false;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.fast_forward_rounded),
                        onPressed: () {
                          videoProvider.controller!.seekTo(Duration(
                              seconds: videoProvider
                                      .controller!.value.position.inSeconds +
                                  10));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}

void showModal(BuildContext context, bool isVideo,
    {Function()? tomarVideo,
    Function()? tomarFoto,
    Function()? pickFile,
    Function()? eliminar,
    Function()? editarFoto,
    Function()? limpiarFoto}) {
  isVideo == true
      ? showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  !Platform.isWindows
                      ? ListTile(
                          leading: Icon(Icons.video_camera_back_rounded,
                              color: Colors.black.withOpacity(0.55), size: 30),
                          title: Text('Tomar Video',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.55),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          onTap: tomarVideo,
                        )
                      : Container(),
                  ListTile(
                    leading: Icon(Icons.filter,
                        color: Colors.black.withOpacity(0.55), size: 30),
                    title: Text('Elegir de la galeria',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.55),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onTap: pickFile,
                  ),
                  ListTile(
                    leading: Icon(Icons.delete_forever_rounded,
                        color: Colors.black.withOpacity(0.55), size: 30),
                    title: Text('Eliminar video',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.55),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onTap: eliminar,
                  ),
                ],
              ),
            );
          },
        )
      : showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  !Platform.isWindows
                      ? ListTile(
                          leading: Icon(Icons.camera_alt_rounded,
                              color: Colors.black.withOpacity(0.55), size: 30),
                          title: Text('Tomar foto',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.55),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          onTap: tomarFoto,
                        )
                      : Container(),
                  ListTile(
                    leading: Icon(Icons.filter,
                        color: Colors.black.withOpacity(0.55), size: 30),
                    title: Text('Elegir de la galeria',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.55),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onTap: pickFile,
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.paintbrush,
                        color: Colors.black.withOpacity(0.55), size: 30),
                    title: Text('Editar foto',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.55),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onTap: editarFoto,
                  ),
                  ListTile(
                    leading: Icon(Icons.clear_rounded,
                        color: Colors.black.withOpacity(0.55), size: 30),
                    title: Text('Limpiar foto',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.55),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onTap: limpiarFoto,
                  ),
                  ListTile(
                    leading: Icon(Icons.delete_forever_rounded,
                        color: Colors.black.withOpacity(0.55), size: 30),
                    title: Text('Eliminar foto',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.55),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onTap: eliminar,
                  ),
                ],
              ),
            );
          },
        );
}

Future<XFile> imageEdit(BuildContext context, String path) async {
  final editImageProvider =
      Provider.of<EditImageProvider>(context, listen: false);
  editImageProvider.image = File(path);
  editImageProvider.points = [];
  String? file =
      await Navigator.pushNamed(context, 'EditarImagen') as String? ?? path;

  return XFile(file);
}
