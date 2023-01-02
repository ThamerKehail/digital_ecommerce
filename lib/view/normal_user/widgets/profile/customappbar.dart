import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProfileAppbar extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const CustomProfileAppbar(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey,
              )),
          SizedBox(width: Get.width / 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'snas',
            ),
          ),
        ],
      ),
    );
  }
}
