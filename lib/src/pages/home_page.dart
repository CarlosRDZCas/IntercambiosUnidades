import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intercambio_unidades/src/components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: SlideInLeft(
                  from: 200,
                  child: const Text('Intercambio de Unidades',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SlideInLeft(
                from: 200,
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: SvgPicture.asset(
                    'assets/images/home.svg',
                    semanticsLabel: 'Intercambio Unidades',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SlideInLeft(
                from: 275,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Inspeccion');
                  },
                  color: CustomColors.primary,
                  height: 45,
                  child: const Text('Realizar inspeccion'),
                ),
              ),
              const SizedBox(height: 20),
              SlideInLeft(
                from: 275,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: 45,
                    onPressed: () {
                      Navigator.pushNamed(context, 'Intercambio');
                    },
                    color: CustomColors.primary,
                    child: const Text('Ver intercambios')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
