import 'package:ecommerceapp/core/class/handlingdatarequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../widgets/auth/custom_buttom_auth.dart';
import '../../../widgets/auth/customtextbody.dart';
import '../../../widgets/auth/customtextformfield.dart';
import '../../../widgets/auth/customtexttitle.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "14".tr,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: ColorApp.grey,
              ),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) {
        return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextTitle(title: "27".tr),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextBody(body: '29'.tr),
                  const SizedBox(
                    height: 20,
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
                  CustomButtomAuth(
                      onPressed: () {
                        controller.checkEmail();
                      },
                      text: '30'.tr),
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
