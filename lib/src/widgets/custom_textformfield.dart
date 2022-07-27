import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intercambio_unidades/src/components/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: TextFormField(
        controller: controller,
        cursorColor: CustomColors.primary,
        decoration: InputDecoration(
          focusColor: CustomColors.primary,
          floatingLabelStyle:
              TextStyle(color: CustomColors.primary, fontWeight: FontWeight.bold),
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: CustomColors.primary,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
