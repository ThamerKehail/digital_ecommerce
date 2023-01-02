import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../data/datasource/static/static.dart';

class SliderCustom extends GetView<OnBoardingControllerImp> {
  const SliderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              onBoardingList[index].image.toString(),
              fit: BoxFit.fill,
              height: Get.width / 1.2,
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              onBoardingList[index].title.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoardingList[index].body.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 2,
                  color: ColorApp.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
