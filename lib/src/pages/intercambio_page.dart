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
    final intercambioProvider = Provider.of<IntercambioProvider>(context);

    return ExpansionPanelList(
      dividerColor: CustomColors.primary,
      expansionCallback: (int index, bool isExpanded) {
        switch (index) {
          case 0:
            intercambioProvider.frontalIsExpanded = !isExpanded;
            break;
          case 1:
            intercambioProvider.lateralDerIsExpanded = !isExpanded;
            break;
          case 2:
            intercambioProvider.lateralIzqIsExpanded = !isExpanded;
            break;
          case 3:
            intercambioProvider.traseraIsExpanded = !isExpanded;
            break;
          case 4:
            intercambioProvider.trampasyAcumIsExpanded = !isExpanded;
            break;
          case 5:
            intercambioProvider.interiorIsExpanded = !isExpanded;

            break;
        }
      },
      children: [
        _panelFrontal(intercambioProvider.count()[0],
            intercambioProvider.frontalIsExpanded!),
        _panelLateralDer(intercambioProvider.count()[1],
            intercambioProvider.lateralDerIsExpanded!),
        _panelLateralIzq(intercambioProvider.count()[2],
            intercambioProvider.lateralIzqIsExpanded!),
        _panelTrasera(intercambioProvider.count()[3],
            intercambioProvider.traseraIsExpanded!),
        _panelTrampasYAcum(intercambioProvider.count()[4],
            intercambioProvider.trampasyAcumIsExpanded!),
        _panelInterior(intercambioProvider.count()[5],
            intercambioProvider.interiorIsExpanded!),
      ],
    );
  }

  ExpansionPanel _panelInterior(int counter, bool isExpanded) {
    return ExpansionPanel(
        isExpanded: isExpanded,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Interior', style: textStyle()),
              const SizedBox(width: 3),
              counter > 0
                  ? Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(counter.toString(), style: textStyle2()),
                      ),
                    )
                  : Container(),
            ],
          );
        },
        body: const _PanelInteriorBody());
  }

  ExpansionPanel _panelTrampasYAcum(int counter, bool isExpanded) {
    return ExpansionPanel(
        isExpanded: isExpanded,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Trampas y Acumuladores', style: textStyle()),
              const SizedBox(width: 3),
              counter > 0
                  ? Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(counter.toString(), style: textStyle2()),
                      ),
                    )
                  : Container(),
            ],
          );
        },
        body: const _PanelTrampasYAcumBody());
  }

  ExpansionPanel _panelTrasera(int counter, bool isExpanded) {
    return ExpansionPanel(
        isExpanded: isExpanded,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Trasera', style: textStyle()),
              const SizedBox(width: 3),
              counter > 0
                  ? Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(counter.toString(), style: textStyle2()),
                      ),
                    )
                  : Container(),
            ],
          );
        },
        body: const _PanelTraseraBody());
  }

  ExpansionPanel _panelLateralIzq(int counter, bool isExpanded) {
    return ExpansionPanel(
        isExpanded: isExpanded,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lateral Izquierdo', style: textStyle()),
              const SizedBox(width: 3),
              counter > 0
                  ? Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(counter.toString(), style: textStyle2()),
                      ),
                    )
                  : Container(),
            ],
          );
        },
        body: const _PanelLateralIzqBody());
  }

  ExpansionPanel _panelLateralDer(int contador, bool isExpanded) {
    return ExpansionPanel(
        isExpanded: isExpanded,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lateral Derecho', style: textStyle()),
              const SizedBox(width: 3),
              contador > 0
                  ? Container(
                      padding: const EdgeInsets.all(1),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                          child:
                              Text(contador.toString(), style: textStyle2())),
                    )
                  : Container(),
            ],
          );
        },
        body: const _PanelLateralDerBody());
  }

  ExpansionPanel _panelFrontal(int contador, bool isExpanded) {
    return ExpansionPanel(
      isExpanded: isExpanded,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Frontal', style: textStyle()),
            const SizedBox(width: 3),
            contador > 0
                ? Container(
                    padding: const EdgeInsets.all(1),
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Center(
                        child: Text(contador.toString(), style: textStyle2())),
                  )
                : Container(),
          ],
        );
      },
      body: const _PanelFrontalBody(),
    );
  }

  TextStyle textStyle2() {
    return const TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600);
  }

  TextStyle textStyle() =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
}

class _PanelInteriorBody extends StatelessWidget {
  const _PanelInteriorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final interiorProvider = Provider.of<IntercambioProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: interiorProvider.intercambio?.colch ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: interiorProvider.intercambio?.colch ?? false,
                    onChanged: (value) {}),
                const Text('Colchon'),
              ]),
              subtitle: Text(interiorProvider.intercambio?.colchCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: interiorProvider.intercambio?.llavesEncend ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: interiorProvider.intercambio?.llavesEncend ?? false,
                    onChanged: (value) {}),
                const Text('Llaves de Encendido'),
              ]),
              subtitle:
                  Text(interiorProvider.intercambio?.llavesEncendCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: interiorProvider.intercambio?.controles ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: interiorProvider.intercambio?.controles ?? false,
                    onChanged: (value) {}),
                const Text('Controles'),
              ]),
              subtitle: Text(interiorProvider.intercambio?.controlesCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: interiorProvider.intercambio?.tapiceria ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: interiorProvider.intercambio?.tapiceria ?? false,
                    onChanged: (value) {}),
                const Text('Tapiceria'),
              ]),
              subtitle: Text(interiorProvider.intercambio?.tapiceriaCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: interiorProvider.intercambio?.estereo ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: interiorProvider.intercambio?.estereo ?? false,
                    onChanged: (value) {}),
                const Text('Estereo'),
              ]),
              subtitle: Text(interiorProvider.intercambio?.estereoCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: interiorProvider.intercambio?.limpiezaUnidad ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        interiorProvider.intercambio?.limpiezaUnidad ?? false,
                    onChanged: (value) {}),
                const Text('Limpieza de la Unidad'),
              ]),
              subtitle:
                  Text(interiorProvider.intercambio?.limpiezaUnidadCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: interiorProvider.intercambio?.carpeta ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: interiorProvider.intercambio?.carpeta ?? false,
                    onChanged: (value) {}),
                const Text('Carpeta'),
              ]),
              subtitle: Text(interiorProvider.intercambio?.carpetaCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: interiorProvider.intercambio?.ac ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: interiorProvider.intercambio?.ac ?? false,
                    onChanged: (value) {}),
                const Text('Aire Acondicionado'),
              ]),
              subtitle: Text(interiorProvider.intercambio?.accom ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}

class _PanelTrampasYAcumBody extends StatelessWidget {
  const _PanelTrampasYAcumBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trampasYAcumuladoresProvider =
        Provider.of<IntercambioProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: trampasYAcumuladoresProvider.intercambio?.trampaDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        trampasYAcumuladoresProvider.intercambio?.trampaDer ??
                            false,
                    onChanged: (value) {}),
                const Text('Trampa Derecha'),
              ]),
              subtitle: Text(
                  trampasYAcumuladoresProvider.intercambio?.trampaDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: trampasYAcumuladoresProvider.intercambio?.trampaIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        trampasYAcumuladoresProvider.intercambio?.trampaIzq ??
                            false,
                    onChanged: (value) {}),
                const Text('Trampa Izquierda'),
              ]),
              subtitle: Text(
                  trampasYAcumuladoresProvider.intercambio?.trampaIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: trampasYAcumuladoresProvider.intercambio?.acum ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        trampasYAcumuladoresProvider.intercambio?.acum ?? false,
                    onChanged: (value) {}),
                const Text('Acumuladores'),
              ]),
              subtitle:
                  Text(trampasYAcumuladoresProvider.intercambio?.acumCom ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}

class _PanelTraseraBody extends StatelessWidget {
  const _PanelTraseraBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final traseraProvider = Provider.of<IntercambioProvider>(context);
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.placaTrasera ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.placaTrasera ?? false,
                      onChanged: (value) {}),
                  const Text('Placa Trasera'),
                ]),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.quinta ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.quinta ?? false,
                      onChanged: (value) {}),
                  const Text('Quinta'),
                ]),
                subtitle: Text(traseraProvider.intercambio?.quintaCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.chirriones ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.chirriones ?? false,
                      onChanged: (value) {}),
                  const Text('Chirriones'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.chirrionesCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.guardafangos ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.guardafangos ?? false,
                      onChanged: (value) {}),
                  const Text('Guardafangos'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.guardafangosCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.portaloderas ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.portaloderas ?? false,
                      onChanged: (value) {}),
                  const Text('Portaloderas'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.portaloderasCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.loderas ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.loderas ?? false,
                      onChanged: (value) {}),
                  const Text('Loderas'),
                ]),
                subtitle: Text(traseraProvider.intercambio?.loderasCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.lucesTras ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.lucesTras ?? false,
                      onChanged: (value) {}),
                  const Text('Luces Traseras'),
                ]),
                subtitle: Text(traseraProvider.intercambio?.lucesTrasCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.silenciador ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.silenciador ?? false,
                      onChanged: (value) {}),
                  const Text('Silenciador'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.silenciadorCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.bastidores ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.bastidores ?? false,
                      onChanged: (value) {}),
                  const Text('Bastidores'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.bastidoresCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.bolsas ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.bolsas ?? false,
                      onChanged: (value) {}),
                  const Text('Bolsas'),
                ]),
                subtitle: Text(traseraProvider.intercambio?.bolsasCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.espaldaCab ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.espaldaCab ?? false,
                      onChanged: (value) {}),
                  const Text('Espalda Cabina'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.eslpadaCabCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.mallaEscape ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.mallaEscape ?? false,
                      onChanged: (value) {}),
                  const Text('Malla de Escape'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.mallaEscapeCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.plataformaTrabajo ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.plataformaTrabajo ??
                          false,
                      onChanged: (value) {}),
                  const Text('Plataforma de Trabajo'),
                ]),
                subtitle: Text(
                    traseraProvider.intercambio?.plataformaTrabajoCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.miembrosTransv ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value:
                          traseraProvider.intercambio?.miembrosTransv ?? false,
                      onChanged: (value) {}),
                  const Text('Miembros Transversales'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.miembrosTransvCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.mangueServicio ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value:
                          traseraProvider.intercambio?.mangueServicio ?? false,
                      onChanged: (value) {}),
                  const Text('Mangueras de Servicio'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.mangueServicioCom ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.llantaPos3 ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.llantaPos3 ?? false,
                      onChanged: (value) {}),
                  const Text('Llanta Posicion 3'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.llantaPos3Com ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.llantaPos4 ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.llantaPos4 ?? false,
                      onChanged: (value) {}),
                  const Text('Llanta Posicion 4'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.llantaPos4Com ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.llantaPos5 ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.llantaPos5 ?? false,
                      onChanged: (value) {}),
                  const Text('Llanta Posicion 5'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.llantaPos5Com ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.llantaPos6 ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.llantaPos6 ?? false,
                      onChanged: (value) {}),
                  const Text('Llanta Posicion 6'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.llantaPos6Com ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.llantaPos7 ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.llantaPos7 ?? false,
                      onChanged: (value) {}),
                  const Text('Llanta Posicion 7'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.llantaPos7Com ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.llantaPos8 ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.llantaPos8 ?? false,
                      onChanged: (value) {}),
                  const Text('Llanta Posicion 8'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.llantaPos8Com ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.llantaPos9 ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.llantaPos9 ?? false,
                      onChanged: (value) {}),
                  const Text('Llanta Posicion 9'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.llantaPos9Com ?? ''),
              ),
            ),
            Card(
              elevation: 0,
              color: traseraProvider.intercambio?.llantaPos10 ?? false
                  ? CustomColors.errorTransparent
                  : CustomColors.primaryTranspartent,
              child: ListTile(
                title: Row(children: [
                  Checkbox(
                      value: traseraProvider.intercambio?.llantaPos10 ?? false,
                      onChanged: (value) {}),
                  const Text('Llanta Posicion 10'),
                ]),
                subtitle:
                    Text(traseraProvider.intercambio?.llantaPos10Com ?? ''),
              ),
            ),
          ],
        ));
  }
}

class _PanelFrontalBody extends StatelessWidget {
  const _PanelFrontalBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final frontalProvider = Provider.of<IntercambioProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: MediaQuery.of(context).size.width > 600
          ? Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 0,
                        color: frontalProvider.intercambio?.placaDel ?? false
                            ? CustomColors.errorTransparent
                            : CustomColors.primaryTranspartent,
                        child: ListTile(
                          title: Row(children: [
                            Checkbox(
                                value: frontalProvider.intercambio?.placaDel ??
                                    false,
                                onChanged: (value) {}),
                            const Text('Placa Delantera'),
                          ]),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 0,
                        color: frontalProvider.intercambio?.iave ?? false
                            ? CustomColors.errorTransparent
                            : CustomColors.primaryTranspartent,
                        child: ListTile(
                          title: Row(children: [
                            Checkbox(
                                value:
                                    frontalProvider.intercambio?.iave ?? false,
                                onChanged: (value) {}),
                            const Text('IAVE'),
                          ]),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 0,
                        color: frontalProvider.intercambio?.engomados ?? false
                            ? CustomColors.errorTransparent
                            : CustomColors.primaryTranspartent,
                        child: ListTile(
                          title: Row(children: [
                            Checkbox(
                                value: frontalProvider.intercambio?.engomados ??
                                    false,
                                onChanged: (value) {}),
                            const Text('Engomado'),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.parrilla ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.parrilla ?? false,
                          onChanged: (value) {}),
                      const Text('Parrilla'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.parrillaCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.copete ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.copete ?? false,
                          onChanged: (value) {}),
                      const Text('Copete'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.copeteCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.faros ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.faros ?? false,
                          onChanged: (value) {}),
                      const Text('Faros'),
                    ]),
                    subtitle: Text(frontalProvider.intercambio?.farosCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.defensa ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.defensa ?? false,
                          onChanged: (value) {}),
                      const Text('Defensa'),
                    ]),
                    subtitle: Text(frontalProvider.intercambio?.defCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.cofreCentr ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value:
                              frontalProvider.intercambio?.cofreCentr ?? false,
                          onChanged: (value) {}),
                      const Text('Cofre Central'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.cofreCentrCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.parabrisas ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value:
                              frontalProvider.intercambio?.parabrisas ?? false,
                          onChanged: (value) {}),
                      const Text('Parabrisas'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.parabrisasCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.conchasEspe ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value:
                              frontalProvider.intercambio?.conchasEspe ?? false,
                          onChanged: (value) {}),
                      const Text('Concha de Espejos'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.conchasEspeCom ?? ''),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.placaDel ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.placaDel ?? false,
                          onChanged: (value) {}),
                      const Text('Placa Delantera'),
                    ]),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.iave ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.iave ?? false,
                          onChanged: (value) {}),
                      const Text('IAVE'),
                    ]),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.engomados ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value:
                              frontalProvider.intercambio?.engomados ?? false,
                          onChanged: (value) {}),
                      const Text('Engomado'),
                    ]),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.parrilla ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.parrilla ?? false,
                          onChanged: (value) {}),
                      const Text('Parrilla'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.parrillaCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.copete ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.copete ?? false,
                          onChanged: (value) {}),
                      const Text('Copete'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.copeteCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.copete ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.copete ?? false,
                          onChanged: (value) {}),
                      const Text('Copete'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.copeteCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.faros ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.faros ?? false,
                          onChanged: (value) {}),
                      const Text('Faros'),
                    ]),
                    subtitle: Text(frontalProvider.intercambio?.farosCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.defensa ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value: frontalProvider.intercambio?.defensa ?? false,
                          onChanged: (value) {}),
                      const Text('Defensa'),
                    ]),
                    subtitle: Text(frontalProvider.intercambio?.defCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.cofreCentr ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value:
                              frontalProvider.intercambio?.cofreCentr ?? false,
                          onChanged: (value) {}),
                      const Text('Cofre Central'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.cofreCentrCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.parabrisas ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value:
                              frontalProvider.intercambio?.parabrisas ?? false,
                          onChanged: (value) {}),
                      const Text('Parabrisas'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.parabrisasCom ?? ''),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: frontalProvider.intercambio?.conchasEspe ?? false
                      ? CustomColors.errorTransparent
                      : CustomColors.primaryTranspartent,
                  child: ListTile(
                    title: Row(children: [
                      Checkbox(
                          value:
                              frontalProvider.intercambio?.conchasEspe ?? false,
                          onChanged: (value) {}),
                      const Text('Concha de Espejos'),
                    ]),
                    subtitle:
                        Text(frontalProvider.intercambio?.conchasEspeCom ?? ''),
                  ),
                ),
              ],
            ),
    );
  }
}

class _PanelLateralDerBody extends StatelessWidget {
  const _PanelLateralDerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lateralDerechoProvider = Provider.of<IntercambioProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.defLateDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        lateralDerechoProvider.intercambio?.defLateDer ?? false,
                    onChanged: (value) {}),
                const Text('Defensa Lateral Derecha'),
              ]),
              subtitle:
                  Text(lateralDerechoProvider.intercambio?.defLateDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.llantaPos2 ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        lateralDerechoProvider.intercambio?.llantaPos2 ?? false,
                    onChanged: (value) {}),
                const Text('Llanta Posicion 1'),
              ]),
              subtitle:
                  Text(lateralDerechoProvider.intercambio?.llantaPos2Com ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.puertaDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        lateralDerechoProvider.intercambio?.puertaDer ?? false,
                    onChanged: (value) {}),
                const Text('Puerta Derecha'),
              ]),
              subtitle:
                  Text(lateralDerechoProvider.intercambio?.puertaDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.cofLateDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        lateralDerechoProvider.intercambio?.cofLateDer ?? false,
                    onChanged: (value) {}),
                const Text('Cofre Lateral Derecha'),
              ]),
              subtitle:
                  Text(lateralDerechoProvider.intercambio?.cofLateDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.faldonesDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralDerechoProvider.intercambio?.faldonesDer ??
                        false,
                    onChanged: (value) {}),
                const Text('Faldones Derechos'),
              ]),
              subtitle: Text(
                  lateralDerechoProvider.intercambio?.faldonesDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.ventanasDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralDerechoProvider.intercambio?.ventanasDer ??
                        false,
                    onChanged: (value) {}),
                const Text('Ventanas Derechas'),
              ]),
              subtitle: Text(
                  lateralDerechoProvider.intercambio?.ventanasDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.espCofreDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralDerechoProvider.intercambio?.espCofreDer ??
                        false,
                    onChanged: (value) {}),
                const Text('Espejo Cofre Derecho'),
              ]),
              subtitle: Text(
                  lateralDerechoProvider.intercambio?.espCofreDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.conchEspeDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralDerechoProvider.intercambio?.conchEspeDer ??
                        false,
                    onChanged: (value) {}),
                const Text('Concha Espejos Derecho'),
              ]),
              subtitle: Text(
                  lateralDerechoProvider.intercambio?.conchEspeDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.costadoDerCab ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralDerechoProvider.intercambio?.costadoDerCab ??
                        false,
                    onChanged: (value) {}),
                const Text('Costado Derecho Cabina'),
              ]),
              subtitle: Text(
                  lateralDerechoProvider.intercambio?.costadoDerCabCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.aleronesDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralDerechoProvider.intercambio?.aleronesDer ??
                        false,
                    onChanged: (value) {}),
                const Text('Alerones Derechos'),
              ]),
              subtitle: Text(
                  lateralDerechoProvider.intercambio?.aleronesDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.copeteCostDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralDerechoProvider.intercambio?.copeteCostDer ??
                        false,
                    onChanged: (value) {}),
                const Text('Copete Costado Derecho'),
              ]),
              subtitle: Text(
                  lateralDerechoProvider.intercambio?.copeteCostDerCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralDerechoProvider.intercambio?.estribosDer ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralDerechoProvider.intercambio?.estribosDer ??
                        false,
                    onChanged: (value) {}),
                const Text('Estribos Derechos'),
              ]),
              subtitle: Text(
                  lateralDerechoProvider.intercambio?.estribosDerCom ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}

class _PanelLateralIzqBody extends StatelessWidget {
  const _PanelLateralIzqBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lateralIzquierdoProvider = Provider.of<IntercambioProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.defLateIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.defLateIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Defensa Lateral Izquierda'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.defLateIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.llantaPos2 ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.llantaPos2 ??
                        false,
                    onChanged: (value) {}),
                const Text('Llanta Posicion 2'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.llantaPos2Com ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.puertaIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.puertaIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Puerta Izquierda'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.puertaIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.cofLateIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.cofLateIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Cofre Lateral Izquierda'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.cofLateIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.faldonesIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.faldonesIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Faldones Izquierdos'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.faldonesIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.ventanasIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.ventanasIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Ventanas Izquierdas'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.ventanasIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.espCofreIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.espCofreIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Espejo Cofre Izquierdo'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.espCofreIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.conchEspIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.conchEspIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Concha Espejos Izquierdo'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.conchEspIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.costadoIzqCab ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        lateralIzquierdoProvider.intercambio?.costadoIzqCab ??
                            false,
                    onChanged: (value) {}),
                const Text('Costado Izquierdo Cabina'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.costadoIzqCabCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.aleronesIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.aleronesIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Alerones Izquierdos'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.aleronesIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.copeteCostIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value:
                        lateralIzquierdoProvider.intercambio?.copeteCostIzq ??
                            false,
                    onChanged: (value) {}),
                const Text('Copete Costado Izquierdo'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.copeteCostIzqCom ?? ''),
            ),
          ),
          Card(
            elevation: 0,
            color: lateralIzquierdoProvider.intercambio?.estribosIzq ?? false
                ? CustomColors.errorTransparent
                : CustomColors.primaryTranspartent,
            child: ListTile(
              title: Row(children: [
                Checkbox(
                    value: lateralIzquierdoProvider.intercambio?.estribosIzq ??
                        false,
                    onChanged: (value) {}),
                const Text('Estribos Izquierdos'),
              ]),
              subtitle: Text(
                  lateralIzquierdoProvider.intercambio?.estribosIzqCom ?? ''),
            ),
          ),
        ],
      ),
    );
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
}
