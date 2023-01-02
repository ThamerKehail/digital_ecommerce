import 'package:ecommerceapp/controller/forgetpassword/reset_controller.dart';
import 'package:ecommerceapp/core/class/handlingdatarequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../widgets/auth/custom_buttom_auth.dart';
import '../../../widgets/auth/customtextbody.dart';
import '../../../widgets/auth/customtextformfield.dart';
import '../../../widgets/auth/customtexttitle.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Reset Password",
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: ColorApp.grey,
              ),
        ),
      ),
      body: GetBuilder<ResetCodeControllerImp>(builder: (controller) {
        return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  const CustomTextTitle(title: "Check Email"),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextBody(body: 'Please Enter New Password'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hint: 'Enter Your Password',
                    label: "Password",
                    iconData: Icons.lock_outline,
                    myController: controller.password,
                    validator: (String? val) {
                      return validInput(val!, 6, 25, 'password');
                    },
                  ),
                  CustomTextFormField(
                    hint: 'Re Enter Your Password',
                    label: "Password",
                    iconData: Icons.lock_outline,
                    myController: controller.rePassword,
                    validator: (String? val) {
                      if (controller.password.text !=
                          controller.rePassword.text) {
                        return "Please Enter the same password";
                      }
                      return null;
                    },
                  ),
                  CustomButtomAuth(
                      onPressed: () {
                        controller.resetPassword();
                      },
                      text: 'save'),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
