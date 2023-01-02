import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/successsignup_controller.dart';
import '../../../../core/constant/color.dart';
import '../../widgets/auth/custom_buttom_auth.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "32".tr,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: ColorApp.grey,
              ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: ColorApp.primaryColor,
              ),
            ),
            Text("37".tr),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButtomAuth(
                    onPressed: () {
                      controller.goToLoginScreen();
                    },
                    text: "31".tr)),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
