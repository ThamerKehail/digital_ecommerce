import 'package:flutter/material.dart';

import '../../../../core/constant/imageassets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesAssets.logo,
      height: 170,
    );
  }
}
