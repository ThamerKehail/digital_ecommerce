import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/language/customBottomLanguage.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1".tr,
                style: Theme.of(context).textTheme.headline1,
              ),
              CustomButtomLangouge(
                text: "Ar",
                onPressed: () {
                  controller.changeLanguage('ar');
                  Get.offNamed(AppRoutes.onBoarding);
                },
              ),
              CustomButtomLangouge(
                text: "En",
                onPressed: () {
                  controller.changeLanguage('en');
                  Get.offNamed(AppRoutes.onBoarding);
                },
              ),
            ],
          )),
    );
  }
}
