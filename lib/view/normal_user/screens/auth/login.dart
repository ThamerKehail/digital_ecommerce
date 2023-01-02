import 'package:ecommerceapp/core/class/handlingdatarequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/alertexitapp.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/login_controller.dart';
import '../../widgets/auth/custom_buttom_auth.dart';
import '../../widgets/auth/customtextbody.dart';
import '../../widgets/auth/customtextformfield.dart';
import '../../widgets/auth/customtextsignuporsignin.dart';
import '../../widgets/auth/customtexttitle.dart';
import '../../widgets/auth/logoauth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "9".tr,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: ColorApp.grey,
                ),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(builder: (controller) {
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
                        const LogoAuth(),
                        CustomTextTitle(title: "10".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextBody(body: '11'.tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          hint: '12'.tr,
                          label: "18".tr,
                          iconData: Icons.email_outlined,
                          myController: controller.email,
                          validator: (String? val) {
                            return validInput(val!, 5, 100, 'email');
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        GetBuilder<LoginControllerImp>(builder: (context) {
                          return CustomTextFormField(
                            hint: '13'.tr,
                            label: "19".tr,
                            max: 1,
                            iconData: controller.showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            myController: controller.password,
                            validator: (String? val) {
                              return validInput(val!, 5, 20, 'password');
                            },
                            onTapIcon: () {
                              controller.changeShowPassword();
                            },
                            obscureText: controller.showPassword ? true : false,
                          );
                        }),
                        InkWell(
                          onTap: () {
                            controller.goToForget();
                          },
                          child: Text(
                            "14".tr,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        CustomButtomAuth(
                            onPressed: () {
                              controller.login();
                            },
                            text: '15'.tr),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextSignupOrSignIn(
                            text: '16'.tr,
                            textToPage: '17'.tr,
                            onTap: () {
                              controller.goToSignUp();
                            })
                      ],
                    ),
                  ),
                ));
          }),
        ));
  }
}
