import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCartTabBar extends StatelessWidget {
  final String titleOne;
  final String titleTwo;
  const CustomCartTabBar(
      {Key? key, required this.titleOne, required this.titleTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: ColorApp.primaryColor,
      labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      unselectedLabelColor: Colors.grey,
      indicatorColor: ColorApp.primaryColor,
      tabs: [
        Tab(text: titleOne),
        Tab(text: titleTwo),
      ],
    );
  }
}
