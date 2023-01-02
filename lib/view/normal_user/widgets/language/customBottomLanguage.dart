import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class CustomButtomLangouge extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButtomLangouge(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        width: double.infinity,
        child: MaterialButton(
          color: ColorApp.primaryColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
