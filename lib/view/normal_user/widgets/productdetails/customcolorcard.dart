import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class CustomColorCard extends StatelessWidget {
  final String color;
  final int active;
  final void Function() onTap;
  const CustomColorCard(
      {Key? key,
      required this.color,
      required this.active,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 5),
          height: 60,
          width: 90,
          decoration: BoxDecoration(
            color: active == 1 ? ColorApp.primaryColor4 : Colors.white,
            border: Border.all(
              color: ColorApp.primaryColor4,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            color,
            style: TextStyle(
              color: active == 1 ? Colors.white : ColorApp.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
