import 'package:ecommerceapp/controller/forgetpassword/verify_controller.dart';
import 'package:ecommerceapp/core/class/handlingdatarequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../widgets/auth/customtextbody.dart';
import '../../../widgets/auth/customtexttitle.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Verification Code",
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: ColorApp.grey,
              ),
        ),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(builder: (controller) {
        return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                const CustomTextTitle(title: "Check Code"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextBody(
                    body: 'Please Enter The Digital Code Sent To'),
                const SizedBox(
                  height: 20,
                ),
                OtpTextField(
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,

                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.checkCode(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
