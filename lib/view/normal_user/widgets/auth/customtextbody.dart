import 'package:flutter/material.dart';

class CustomTextBody extends StatelessWidget {
  final String body;
  const CustomTextBody({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      style: Theme.of(context).textTheme.bodyText2,
      textAlign: TextAlign.center,
    );
  }
}
