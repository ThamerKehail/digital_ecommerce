import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;
  late String email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  @override
  checkCode(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(
      email: email,
      verifycode: verifyCode,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoutes.resetPassword, arguments: {
          'email': email,
        });
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email Not Found",
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = Get.arguments['email'];
  }
}
