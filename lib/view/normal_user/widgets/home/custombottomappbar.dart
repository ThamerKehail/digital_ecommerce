import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomAppbar extends StatelessWidget {
  final void Function() onTap;
  final IconData icons;
  final IconData icons2;
  final String title;
  bool active = false;
  CustomBottomAppbar({
    Key? key,
    required this.onTap,
    required this.icons,
    required this.title,
    required this.active,
    required this.icons2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            active == true ? icons : icons2,
            color: ColorApp.primaryColor,
          ),
          Text(
            title,
            style: TextStyle(
              color: active == true ? ColorApp.primaryColor : Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
