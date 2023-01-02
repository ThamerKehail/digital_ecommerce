import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  final ImageProvider img;
  final void Function() onTap;
  const CustomProfileImage({Key? key, required this.img, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  image: DecorationImage(image: img, fit: BoxFit.cover)),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfff3f4f6),
              ),
              child: Center(
                child: IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
