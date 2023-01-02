import 'dart:io';

import 'package:ecommerceapp/core/class/handlingdatarequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/alertexitapp.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/signup_controller.dart';
import '../../widgets/auth/custom_buttom_auth.dart';
import '../../widgets/auth/customtextbody.dart';
import '../../widgets/auth/customtextformfield.dart';
import '../../widgets/auth/customtextsignuporsignin.dart';
import '../../widgets/auth/customtexttitle.dart';
import '../../widgets/profile/customprofileimage.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "17".tr,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: ColorApp.grey,
              ),
        ),
      ),
      body: GetBuilder<SignupControllerImp>(builder: (controller) {
        return WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignupControllerImp>(builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: controller.formsState,
                    child: ListView(
                      children: [
                        CustomTextTitle(title: "10".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextBody(body: '24'.tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomProfileImage(
                          img: controller.file == null
                              ? const NetworkImage(
                                  'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg')
                              : FileImage(File(controller.file!.path))
                                  as ImageProvider,
                          onTap: () {
                            controller.chooseImage(context);
                          },
                        ),
                        CustomTextFormField(
                          hint: '23'.tr,
                          label: "20".tr,
                          iconData: Icons.person_outline,
                          myController: controller.username,
                          validator: (String? val) {
                            return validInput(val!, 3, 15, 'username');
                          },
                        ),
                        CustomTextFormField(
                          hint: '12'.tr,
                          label: "18".tr,
                          iconData: Icons.email_outlined,
                          myController: controller.email,
                          validator: (String? val) {
                            return validInput(val!, 3, 100, 'email');
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomTextFormField(
                          hint: '22'.tr,
                          label: "21".tr,
                          iconData: Icons.phone_android_outlined,
                          myController: controller.phone,
                          validator: (String? val) {
                            return validInput(val!, 10, 12, 'phone');
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        CustomTextFormField(
                          hint: '13'.tr,
                          label: "19".tr,
                          iconData: Icons.lock_outline,
                          myController: controller.password,
                          validator: (String? val) {
                            return validInput(val!, 6, 25, 'password');
                          },
                        ),
                        CustomButtomAuth(
                            onPressed: () {
                              controller.signup(context);
                            },
                            text: 'Sign Up'),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextSignupOrSignIn(
                            text: 'I already have account ?',
                            textToPage: "Login",
                            onTap: () {
                              controller.goToLogin();
                            })
                      ],
                    ),
                  ),
                ));
          }),
        );
      }),
    );
  }
}
