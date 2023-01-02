import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/forgetpassword/successresetpassword_controller.dart';
import '../../../../../core/constant/color.dart';
import '../../../widgets/auth/custom_buttom_auth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Success",
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
            const Text("........"),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButtomAuth(
                    onPressed: () {
                      controller.goToLoginScreen();
                    },
                    text: "Go To Login")),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
