import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

import '../components/components.dart';
import '../components/snackbar.dart';
import '../models/models.dart';
import '../provider/providers.dart';
import '../services/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intercambioProvider = Provider.of<IntercambioProvider>(context);
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: IconButton(
            icon: const Icon(Icons.save, size: 35),
            onPressed: () async {
              intercambioProvider.isLoading = true;
              await _mergeData(context);
              intercambioProvider.isLoading = false;
            },
          ),
        ),
      ],
      backgroundColor: CustomColors.primary,
      title: const Text('Inspeccion'),
      bottom: const TabBar(
          indicatorWeight: 3.5,
          labelColor: Colors.white,
          indicatorColor: Colors.amber,
          isScrollable: true,
          tabs: [
            Tab(
              text: 'Datos',
            ),
            Tab(
              text: 'Frontal',
            ),
            Tab(
              text: 'Lateral Derecho',
            ),
            Tab(
              text: 'Trasera',
            ),
            Tab(
              text: 'Lateral Izquierdo',
            ),
            Tab(
              text: 'Trampas y Acumuladores',
            ),
            Tab(
              text: 'Interior',
            ),
            Tab(
              text: 'Video',
            ),
          ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 35);

  Future<void> _mergeData(BuildContext context) async {
    final datosProvider = Provider.of<TractorProvider>(context, listen: false);
    final frontalProvider =
        Provider.of<FrontalProvider>(context, listen: false);
    final lateralDerProvider =
        Provider.of<LateralDerechoProvider>(context, listen: false);
    final traseraProvider =
        Provider.of<TraseraProvider>(context, listen: false);
    final lateralIzqProvider =
        Provider.of<LateralIzquierdoProvider>(context, listen: false);
    final trampasProvider =
        Provider.of<TrampasYAcumuladoresProvider>(context, listen: false);
    final interiorProvider =
        Provider.of<InteriorProvider>(context, listen: false);
    final videoProvider = Provider.of<VideoProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final intercambioProvider =
        Provider.of<IntercambioProvider>(context, listen: false);
    if (datosProvider.carro.isEmpty) {
      ShowSnackBar(context, 'Ingrese los datos de la unidad', 3, Colors.red);
      return;
    }

    String dia = DateTime.now().day < 10
        ? '0${DateTime.now().day}'
        : '${DateTime.now().day}';
    String mes = DateTime.now().month < 10
        ? '0${DateTime.now().month}'
        : '${DateTime.now().month}';
    String anio = DateTime.now().year.toString();

    Intercambio intercambio = Intercambio(
      ac: interiorProvider.acchecked!,
      accom: interiorProvider.ac,
      acum: trampasProvider.acumuladoreschecked!,
      acumCom: trampasProvider.acumuladores,
      acumuladoresImg: '',
      aleronesDer: lateralDerProvider.aleronesDerchecked,
      aleronesDerCom: lateralDerProvider.aleronesDer,
      aleronesIzq: lateralIzqProvider.aleronesIzqchecked,
      aleronesIzqCom: lateralIzqProvider.aleronesIzq,
      anio: datosProvider.anio,
      bastidores: traseraProvider.bastidoreschecked!,
      bastidoresCom: traseraProvider.bastidores,
      bolsas: traseraProvider.bolsaschecked!,
      bolsasCom: traseraProvider.bolsas,
      carpeta: interiorProvider.carpetachecked!,
      carpetaCom: interiorProvider.carpeta,
      carro: int.parse(datosProvider.carro.isEmpty ? '0' : datosProvider.carro),
      chirriones: traseraProvider.chirrioneschecked!,
      chirrionesCom: traseraProvider.chirriones,
      cofLateDer: lateralDerProvider.cofreLateralDerchecked,
      cofLateDerCom: lateralDerProvider.cofreLateralDer,
      cofLateIzq: lateralIzqProvider.cofreLateralIzqchecked,
      cofLateIzqCom: lateralIzqProvider.cofreLateralIzq,
      cofreCentr: frontalProvider.cofreCentralchechecked!,
      cofreCentrCom: frontalProvider.cofreCentral,
      colch: interiorProvider.colchonchecked!,
      colchCom: interiorProvider.colchon,
      colchonImg: interiorProvider.imagenInterior3 != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(interiorProvider.imagenInterior3!.name)}'
          : '',
      color: datosProvider.color,
      combustible: datosProvider.combustible,
      conchasEspe: frontalProvider.conchaEspejoschechecked!,
      conchasEspeCom: frontalProvider.conchaEspejos,
      conchEspeDer: lateralDerProvider.conchaEspejosDerchecked,
      conchEspeDerCom: lateralDerProvider.conchaEspejosDer,
      conchEspIzq: lateralIzqProvider.conchaEspejosIzqchecked,
      conchEspIzqCom: lateralIzqProvider.conchaEspejosIzq,
      controles: interiorProvider.controleschecked!,
      controlesCom: interiorProvider.controles,
      copete: frontalProvider.copetechechecked!,
      copeteCom: frontalProvider.copete,
      copeteCostDer: lateralDerProvider.copeteCostadoDerchecked,
      copeteCostDerCom: lateralDerProvider.copeteCostadoDer,
      copeteCostIzq: lateralIzqProvider.copeteCostadoIzqchecked,
      copeteCostIzqCom: lateralIzqProvider.copeteCostadoIzq,
      costadoDerCab: lateralDerProvider.costadoDerCabinachecked,
      costadoDerCabCom: lateralDerProvider.costadoDerCabina,
      costadoIzqCab: lateralIzqProvider.costadoIzqCabinachecked,
      costadoIzqCabCom: lateralIzqProvider.costadoIzqCabina,
      defCom: frontalProvider.defensa,
      defensa: frontalProvider.defensachechecked!,
      defLateDer: lateralDerProvider.defensaLateralDerchecked,
      defLateDerCom: lateralDerProvider.defensaLateralDer,
      defLateIzq: lateralIzqProvider.defensaLateralIzqchecked,
      defLateIzqCom: lateralIzqProvider.defensaLateralIzq,
      ejes: datosProvider.ejeschecked,
      engomados: frontalProvider.engomadochecked!,
      eslpadaCabCom: traseraProvider.espaldaCabina,
      espaldaCab: traseraProvider.espaldaCabinachecked!,
      espCofreDer: lateralDerProvider.espejoCofreDerchecked,
      espCofreDerCom: lateralDerProvider.espejoCofreDer,
      espCofreIzq: lateralIzqProvider.espejoCofreIzqchecked,
      espCofreIzqCom: lateralIzqProvider.espejoCofreIzq,
      estereo: interiorProvider.estereochecked!,
      estereoCom: interiorProvider.estereo,
      estribosDer: lateralDerProvider.estribosDerchecked,
      estribosDerCom: lateralDerProvider.estribosDer,
      estribosIzq: lateralIzqProvider.estribosIzqchecked,
      estribosIzqCom: lateralIzqProvider.estribosIzq,
      faldonesDer: lateralDerProvider.faldonesDerchecked,
      faldonesDerCom: lateralDerProvider.faldonesDer,
      faldonesIzq: lateralIzqProvider.faldonesIzqchecked,
      faldonesIzqCom: lateralIzqProvider.faldonesIzq,
      faros: frontalProvider.faroschechecked!,
      farosCom: frontalProvider.faros,
      fechaGuard: DateTime.now(),
      firmaOp: '',
      firmaRep: '',
      folio: 0,
      frontalImg: frontalProvider.imagenFrontal != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(frontalProvider.imagenFrontal!.name)}'
          : '',
      guardafangos: traseraProvider.guardafangoschecked!,
      guardafangosCom: traseraProvider.guardafangos,
      iave: frontalProvider.iavechecked!,
      interiorImg: interiorProvider.imagenInterior != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(interiorProvider.imagenInterior!.name)}'
          : '',
      km: datosProvider.kilometraje,
      lateralDer1Img: lateralDerProvider.imagenLateralDer != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(lateralDerProvider.imagenLateralDer!.name)}'
          : '',
      lateralDer2Img: '',
      lateralIzq1Img: lateralIzqProvider.imagenLateralIzq != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(lateralIzqProvider.imagenLateralIzq!.name)}'
          : '',
      lateralIzq2Img: '',
      limpiezaUnidad: interiorProvider.limpiezaUnidadchecked!,
      limpiezaUnidadCom: interiorProvider.limpiezaUnidad,
      llantaPos10: traseraProvider.llantaPos10checked!,
      llantaPos10Com: traseraProvider.llantaPos10,
      llantaPos1: lateralDerProvider.llantaPos1checked!,
      llantaPos1Com: lateralDerProvider.llantaPos1,
      llantaPos2: lateralIzqProvider.llantaPos2checked!,
      llantaPos2Com: lateralIzqProvider.llantaPos2,
      llantaPos3: traseraProvider.llantaPos3checked!,
      llantaPos3Com: traseraProvider.llantaPos3,
      llantaPos4: traseraProvider.llantaPos4checked!,
      llantaPos4Com: traseraProvider.llantaPos4,
      llantaPos5: traseraProvider.llantaPos5checked!,
      llantaPos5Com: traseraProvider.llantaPos5,
      llantaPos6: traseraProvider.llantaPos6checked!,
      llantaPos6Com: traseraProvider.llantaPos6,
      llantaPos7: traseraProvider.llantaPos7checked!,
      llantaPos7Com: traseraProvider.llantaPos7,
      llantaPos8: traseraProvider.llantaPos8checked!,
      llantaPos8Com: traseraProvider.llantaPos8,
      llantaPos9: traseraProvider.llantaPos9checked!,
      llantaPos9Com: traseraProvider.llantaPos9,
      llavesEncend: interiorProvider.llavesEncendidochecked!,
      llavesEncendCom: interiorProvider.llavesEncendido,
      loderas: traseraProvider.loderaschecked!,
      loderasCom: traseraProvider.loderas,
      lucesTras: traseraProvider.lucesTraseraschecked!,
      lucesTrasCom: traseraProvider.lucesTraseras,
      mallaEscape: traseraProvider.mallaEscapechecked!,
      mallaEscapeCom: traseraProvider.mallaEscape,
      mangueServicio: traseraProvider.manguerasServiciochecked!,
      mangueServicioCom: traseraProvider.manguerasServicio,
      marca: datosProvider.marca,
      miembrosTransv: traseraProvider.miembrosTransversaleschecked!,
      miembrosTransvCom: traseraProvider.miembrosTransversales,
      modelo: datosProvider.modelo,
      motor: datosProvider.motor,
      motorOk: datosProvider.motorchecked,
      nivelAceite: datosProvider.nivelAceite.toString(),
      noVin: datosProvider.noVin,
      parabrisas: frontalProvider.parabrisaschechecked!,
      parabrisasCom: frontalProvider.parabrisas,
      parrilla: frontalProvider.parrillachecked!,
      parrillaCom: frontalProvider.parrilla,
      placa: datosProvider.placa,
      placaDel: frontalProvider.placaDelanterachecked!,
      placaTrasera: traseraProvider.placaTraserachecked!,
      plataformaTrabajo: traseraProvider.plataformaTrabajochecked!,
      plataformaTrabajoCom: traseraProvider.plataformaTrabajo,
      portaloderas: traseraProvider.portaloderaschecked,
      portaloderasCom: traseraProvider.portaloderas,
      puertaDer: lateralDerProvider.puertaDerchecked!,
      puertaDerCom: lateralDerProvider.puertaDer,
      puertaIzq: lateralIzqProvider.puertaIzqchecked!,
      puertaIzqCom: lateralIzqProvider.puertaIzq,
      quinta: traseraProvider.quintachecked!,
      quintaCom: traseraProvider.quinta,
      silenciador: traseraProvider.silenciadorchecked!,
      silenciadorCom: traseraProvider.silenciador,
      sucursal: 'Laredo',
      tableroImg: interiorProvider.imagenInterior2 != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(interiorProvider.imagenInterior2!.name)}'
          : '',
      tapiceria: interiorProvider.tapiceriachecked!,
      tapiceriaCom: interiorProvider.tapiceria,
      trampaDer: trampasProvider.trampaderechachecked!,
      trampaDerCom: trampasProvider.trampaDerecha,
      trampaDerImg: '',
      trampaIzq: trampasProvider.trampaizquierdachecked!,
      trampaIzqCom: trampasProvider.trampaIzquierda,
      trampasImg: '',
      transmision: datosProvider.transmisionchecked,
      trasera1Img: traseraProvider.imagenTrasera != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(traseraProvider.imagenTrasera!.name)}'
          : '',
      trasera2Img: traseraProvider.imagenTrasera2 != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(traseraProvider.imagenTrasera2!.name)}'
          : '',
      trasera3Img: traseraProvider.imagenTrasera3 != null
          ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(traseraProvider.imagenTrasera3!.name)}'
          : '',
      usuario: loginProvider.user,
      ventanasDer: lateralDerProvider.ventanasDerchecked,
      ventanasDerCom: lateralDerProvider.ventanasDer,
      ventanasIzq: lateralIzqProvider.ventanasIzqchecked,
      ventanasIzqCom: lateralIzqProvider.ventanasIzq,
      video: Platform.isWindows
          ? playerProvider.video != null
              ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(playerProvider.video!.name)}'
              : ''
          : videoProvider.video != null
              ? 'https://twt.com.mx/carros/${anio + mes + dia}/${datosProvider.carro}/${basename(videoProvider.video!.name)}'
              : '',
    );

    List<File> listImages = [];
    frontalProvider.imagenFrontal != null
        ? listImages.add(File(frontalProvider.imagenFrontal!.path))
        : null;
    lateralDerProvider.imagenLateralDer != null
        ? listImages.add(File(lateralDerProvider.imagenLateralDer!.path))
        : null;
    lateralIzqProvider.imagenLateralIzq != null
        ? listImages.add(File(lateralIzqProvider.imagenLateralIzq!.path))
        : null;
    traseraProvider.imagenTrasera != null
        ? listImages.add(File(traseraProvider.imagenTrasera!.path))
        : null;
    traseraProvider.imagenTrasera2 != null
        ? listImages.add(File(traseraProvider.imagenTrasera2!.path))
        : null;
    traseraProvider.imagenTrasera3 != null
        ? listImages.add(File(traseraProvider.imagenTrasera3!.path))
        : null;
    interiorProvider.imagenInterior != null
        ? listImages.add(File(interiorProvider.imagenInterior!.path))
        : null;
    interiorProvider.imagenInterior2 != null
        ? listImages.add(File(interiorProvider.imagenInterior2!.path))
        : null;
    interiorProvider.imagenInterior3 != null
        ? listImages.add(File(interiorProvider.imagenInterior3!.path))
        : null;
    Platform.isWindows
        ? playerProvider.video != null
            ? listImages.add(File(playerProvider.video!.path))
            : null
        : videoProvider.video != null
            ? listImages.add(File(videoProvider.video!.path))
            : null;
    try {
      await intercambioProvider.sendFTP(listImages, datosProvider.carro);
      if (await TractoresService.postData(intercambio.toJson())) {
        datosProvider.clear();
        frontalProvider.clear();
        lateralDerProvider.clear();
        lateralIzqProvider.clear();
        videoProvider.clear();
        playerProvider.clear();
        trampasProvider.clear();
        interiorProvider.clear();
        traseraProvider.clear();
        ShowSnackBar(
            context, "Intercambio realizado con exito", 4, Colors.green);
      } else {
        ShowSnackBar(
            context, "Error al realizar el intercambio", 4, Colors.red);
      }
    } catch (e) {
      ShowSnackBar(
          context,
          "Error al realizar el intercambio, verifique su conexion a internet",
          4,
          Colors.red);
    }
  }
}
