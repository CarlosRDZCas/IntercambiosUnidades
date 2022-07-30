import 'package:flutter/material.dart';
import 'package:intercambio_unidades/src/models/intercambio_model.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar Unidad';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const _EmptyResponse();
    } else {
      final intercambiosProvider =
          Provider.of<IntercambioProvider>(context, listen: false);
      return FutureBuilder(
        future: intercambiosProvider.getIntercambios(query),
        builder:
            (BuildContext context, AsyncSnapshot<List<Intercambio>?> snapshot) {
          if (!snapshot.hasData) {
            return const _EmptyResponse();
          }
          final intercambios = snapshot.data;
          return ListView.builder(
            itemCount: intercambios?.length,
            itemBuilder: (BuildContext context, int index) {
              return _IntercambioItem(intercambio: intercambios![index]);
            },
          );
        },
      );
    }
  }
}

class _IntercambioItem extends StatelessWidget {
  final Intercambio intercambio;
  const _IntercambioItem({Key? key, required this.intercambio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intercambioProvider =
        Provider.of<IntercambioProvider>(context, listen: false);

    return ListTile(
      onTap: () {
        intercambioProvider.intercambio = intercambio;
        Navigator.pop(context);
      },
      title: Text(
          'Folio: ${intercambio.folio} Unidad: ${intercambio.carro} Placas: ${intercambio.placa.trim()} Fecha: ${intercambio.fechaGuard} '),
      leading: intercambio.frontalImg != ''
          ? FadeInImage(
              image: NetworkImage(intercambio.frontalImg),
              placeholder: const AssetImage('assets/images/truck.jpg'),
              width: 70,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/truck.jpg',
              width: 70,
              fit: BoxFit.fill,
            ),
    );
  }
}

class _EmptyResponse extends StatelessWidget {
  const _EmptyResponse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay resultados'),
    );
  }
}
