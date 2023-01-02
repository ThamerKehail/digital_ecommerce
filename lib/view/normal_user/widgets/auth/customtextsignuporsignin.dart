import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class CustomTextSignupOrSignIn extends StatelessWidget {
  final String text;
  final String textToPage;
  final void Function() onTap;
  const CustomTextSignupOrSignIn(
      {super.key,
      required this.text,
      required this.textToPage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        InkWell(
          onTap: onTap,
          child: Text(
            textToPage,
            style: const TextStyle(
              color: ColorApp.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
