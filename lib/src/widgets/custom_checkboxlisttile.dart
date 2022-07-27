import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final String title;
  final bool? value;
  final Function(bool?)? onChanged;
  const CustomCheckboxListTile({
    Key? key,
    required this.title,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: CheckboxListTile(
        activeColor: CustomColors.primary,
        value: value,
        onChanged: onChanged,
        title: Text(title),
      ),
    );
  }
}
