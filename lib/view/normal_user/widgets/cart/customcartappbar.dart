import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartAppbar extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final void Function()? onPressed;
  const CustomCartAppbar(
      {Key? key, required this.title, this.iconData, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            width: Get.width / 3.5,
          ),
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                iconData,
                color: Colors.grey,
                size: 35,
              )),
        ],
      ),
    );
  }
}
