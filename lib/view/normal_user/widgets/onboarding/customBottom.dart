import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class CustomBottom extends GetView<OnBoardingControllerImp> {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      height: 45,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 2),
        onPressed: () {
          controller.next();
        },
        color: ColorApp.primaryColor,
        textColor: Colors.white,
        child: Text("8".tr),
      ),
    );
  }
}
