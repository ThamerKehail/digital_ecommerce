import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/onboarding/customBottom.dart';
import '../widgets/onboarding/dotController.dart';
import '../widgets/onboarding/sliderCustom.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 4,
              child: SliderCustom(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    DotController(),
                    Spacer(
                      flex: 1,
                    ),
                    CustomBottom(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
