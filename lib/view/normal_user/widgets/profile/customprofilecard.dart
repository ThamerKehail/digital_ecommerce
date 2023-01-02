import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final Widget icon;
  final Widget name;
  final void Function() onTap;
  const CustomProfileCard(
      {Key? key, required this.icon, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xfff3f4f6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(
                    width: 20,
                  ),
                  name,
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
