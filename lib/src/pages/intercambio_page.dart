import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:intercambio_unidades/src/components/components.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';

class IntercambioPage extends StatelessWidget {
  const IntercambioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intercambioProvider = Provider.of<IntercambioProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primary,
          elevation: 2,
          title: Center(
              child: Text(
                  'Intercambio de Unidad: ${intercambioProvider.intercambio?.carro ?? ''}')),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ExpansionPanelList(
                dividerColor: CustomColors.primary,
                expansionCallback: (int index, bool isExpanded) {
                  switch (index) {
                    case 0:
                      intercambioProvider.datosIsExpanded = !isExpanded;
                      break;
                    case 1:
                      intercambioProvider.detallesIsExpanded = !isExpanded;
                      break;
                    case 2:
                      intercambioProvider.imagenIsExpanded = !isExpanded;
                  }
                },
                children: [
                  ExpansionPanel(
                      isExpanded: intercambioProvider.datosIsExpanded!,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Center(
                            child:
                                Text('Datos de la unidad', style: textStyle()));
                      },
                      body: const DatosUnidad()),
                  ExpansionPanel(
                      isExpanded: intercambioProvider.detallesIsExpanded!,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Center(
                            child: Text('Detalles de la unidad',
                                style: textStyle()));
                      },
                      body: const DetallesBody()),
                  ExpansionPanel(
                      isExpanded: intercambioProvider.imagenIsExpanded!,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Center(
                            child: Text('Imagenes de la unidad',
                                style: textStyle()));
                      },
                      body: intercambioProvider.intercambio != null
                          ? const ImagenesBody()
                          : Container()),
                ],
              ),
            ],
          ),
        ));
  }

  TextStyle textStyle() =>
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
}

class DatosUnidad extends StatelessWidget {
  const DatosUnidad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final intercambioProvider = Provider.of<IntercambioProvider>(context);
    return width < 700
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Folio: ${intercambioProvider.intercambio?.folio ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          intercambioProvider.intercambio?.fechaGuard != null
                              ? 'Fecha:${'${intercambioProvider.intercambio?.fechaGuard.year}/${intercambioProvider.intercambio?.fechaGuard.month}/${intercambioProvider.intercambio?.fechaGuard.day} ${intercambioProvider.intercambio?.fechaGuard.hour}:${intercambioProvider.intercambio?.fechaGuard.minute}:${intercambioProvider.intercambio?.fechaGuard.second}'}'
                              : 'Fecha:',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Carro: ${intercambioProvider.intercambio?.carro ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Placa: ${intercambioProvider.intercambio?.placa ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Año: ${intercambioProvider.intercambio?.anio ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Motor: ${intercambioProvider.intercambio?.motor ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Marca: ${intercambioProvider.intercambio?.marca.trim() ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Kilometraje: ${intercambioProvider.intercambio?.km ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Modelo: ${intercambioProvider.intercambio?.modelo ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Color: ${intercambioProvider.intercambio?.color ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Nivel Aceite: ${intercambioProvider.intercambio?.nivelAceite ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'No Vin: ${intercambioProvider.intercambio?.noVin ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Combustible: ${intercambioProvider.intercambio?.combustible ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'Motor',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )),
                          Checkbox(
                            value: intercambioProvider.intercambio?.motorOk ??
                                false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Transmisión',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                          Checkbox(
                            value:
                                intercambioProvider.intercambio?.transmision ??
                                    false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Ejes',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Checkbox(
                            value:
                                intercambioProvider.intercambio?.ejes ?? false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Folio: ${intercambioProvider.intercambio?.folio ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          intercambioProvider.intercambio?.fechaGuard != null
                              ? 'Fecha:${'${intercambioProvider.intercambio?.fechaGuard.year}/${intercambioProvider.intercambio?.fechaGuard.month}/${intercambioProvider.intercambio?.fechaGuard.day} ${intercambioProvider.intercambio?.fechaGuard.hour}:${intercambioProvider.intercambio?.fechaGuard.minute}:${intercambioProvider.intercambio?.fechaGuard.second}'}'
                              : 'Fecha:',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Carro: ${intercambioProvider.intercambio?.carro ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Placa: ${intercambioProvider.intercambio?.placa ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Año: ${intercambioProvider.intercambio?.anio ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Motor: ${intercambioProvider.intercambio?.motor ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Marca: ${intercambioProvider.intercambio?.marca ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Kilometraje: ${intercambioProvider.intercambio?.km ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Estado del Motor', style: customTextStyle()),
                          Checkbox(
                            value: intercambioProvider.intercambio?.motorOk ??
                                false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Modelo: ${intercambioProvider.intercambio?.modelo ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'Color: ${intercambioProvider.intercambio?.color ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Estado de los Ejes', style: customTextStyle()),
                          Checkbox(
                            value:
                                intercambioProvider.intercambio?.ejes ?? false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Nivel Aceite: ${intercambioProvider.intercambio?.nivelAceite ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Text(
                          'No Vin: ${intercambioProvider.intercambio?.noVin ?? ''}',
                          style: customTextStyle()),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Estado de la Transmisión',
                              style: customTextStyle()),
                          Checkbox(
                            value:
                                intercambioProvider.intercambio?.transmision ??
                                    false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Combustible: ${intercambioProvider.intercambio?.combustible ?? ''}',
                          style: customTextStyle()),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  TextStyle customTextStyle() =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
}

class DetallesBody extends StatelessWidget {
  const DetallesBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Detalles de la unidad');
  }
}

class ImagenesBody extends StatelessWidget {
  const ImagenesBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intercambioProvider = Provider.of<IntercambioProvider>(context);
    return SingleChildScrollView(
      child: Swiper(
        itemWidth: MediaQuery.of(context).size.width * 0.68,
        itemHeight: MediaQuery.of(context).size.height * 0.68,
        itemCount: intercambioProvider.getImagenes().length,
        layout: SwiperLayout.STACK,
        indicatorLayout: PageIndicatorLayout.COLOR,
        itemBuilder: (BuildContext context, int index) {
          final imagenes = intercambioProvider.getImagenes();
          return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  imagenes[index].isNotEmpty
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/images/truck.jpg'),
                            image: NetworkImage(imagenes[index]),
                          ),
                        )
                      : Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Image.asset('assets/images/truck.jpg')),
                ],
              ));
        },
      ),
    );
  }

  String _getName(int index) {
    switch (index) {
      case 0:
        return 'Frontal';
      case 1:
        return 'Lateral Derecho';
      case 2:
        return 'Trasera Derecha';
      case 3:
        return 'Espalda';
      case 4:
        return 'Trasera Izqueirda';
      case 5:
        return 'Lateral Izquierdo';
      case 6:
        return 'Interior';
      case 7:
        return 'Controles';
      case 8:
        return 'Camarote';
      default:
        return 'Foto';
    }
  }
}
