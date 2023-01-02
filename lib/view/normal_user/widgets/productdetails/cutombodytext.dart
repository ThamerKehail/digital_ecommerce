import 'package:flutter/material.dart';

class CustomBodyText extends StatelessWidget {
  final String body;
  const CustomBodyText({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        body,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
