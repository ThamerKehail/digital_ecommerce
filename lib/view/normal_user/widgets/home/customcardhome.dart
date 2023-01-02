import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String subTitle;
  final String lang;
  const CustomCardHome(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.lang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorApp.primaryColor,
            ),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: lang == "en" ? -20 : null,
            left: lang == "ar" ? -20 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(160),
                color: ColorApp.primaryColor2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
