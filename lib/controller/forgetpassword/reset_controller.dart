import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class ForgetPasswordController extends GetxController {
  resetPassword();
}

class ResetCodeControllerImp extends ForgetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  late String email;
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  resetPassword() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(
        email: email,
        password: password.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(
            AppRoutes.successReset,
          );
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email Not Found",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
