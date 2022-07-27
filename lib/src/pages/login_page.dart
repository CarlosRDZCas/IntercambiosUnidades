import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intercambio_unidades/src/components/snackbar.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../provider/providers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: const [
            _LoginBG(),
            _FormCard(),
          ],
        ),
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  const _FormCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return SlideInLeft(
      child: Center(
        child: Form(
          key: loginProvider.frmKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(left: 20, right: 30, top: 0),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Bienvenido',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    TextFormField(
                      cursorColor: CustomColors.primary,
                      decoration: InputDecoration(
                        prefixIconColor: CustomColors.primary,
                        focusColor: CustomColors.primary,
                        fillColor: CustomColors.primary,
                        floatingLabelStyle: TextStyle(
                            color: CustomColors.primary,
                            fontWeight: FontWeight.bold),
                        labelText: "Usuario",
                        icon: Icon(
                          Icons.person,
                          color: CustomColors.primary,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.primary,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        loginProvider.user = value;
                      },
                      validator: (value) =>
                          value!.isEmpty ? "Ingrese el usuario" : null,
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      cursorColor: CustomColors.primary,
                      obscureText: true,
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                            color: CustomColors.primary,
                            fontWeight: FontWeight.bold),
                        labelText: "Contraseña",
                        icon: Icon(
                          Icons.lock,
                          color: CustomColors.primary,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.primary,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        loginProvider.password = value;
                      },
                      validator: (value) {
                        return (value != null && value.length >= 6)
                            ? null
                            : "La contraseña debe tener al menos 6 caracteres";
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColors.primary)),
                      onPressed: () async {
                        if (loginProvider.isValid() &&
                            await loginProvider.login()) {
                          Navigator.pushReplacementNamed(context, 'Home');
                        } else {
                          ShowSnackBar(
                              context,
                              'Usuario y/o contraseña incorrectos',
                              3,
                              Colors.red);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Flexible(
                            child: Text(
                              "Iniciar Sesion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  overflow: TextOverflow.clip),
                            ),
                          ),
                          const SizedBox(width: 10),
                          loginProvider.isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginBG extends StatelessWidget {
  const _LoginBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [CustomColors.primary, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          BounceInDown(
            child: Transform.translate(
              offset: const Offset(-12, 10),
              child: Image.asset("assets/images/splash.png", scale: 1.8),
            ),
          ),
        ],
      ),
    );
  }
}
