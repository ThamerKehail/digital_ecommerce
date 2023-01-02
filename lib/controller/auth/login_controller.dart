import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForget();
  changeShowPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formsState = GlobalKey<FormState>();
  bool showPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  @override
  login() async {
    if (formsState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email: email.text,
        password: password.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString('email', response['data']['users_email']);
          myServices.sharedPreferences
              .setString('username', response['data']['user_name']);
          myServices.sharedPreferences
              .setString('id', response['data']['users_id'].toString());
          myServices.sharedPreferences
              .setString('phone', response['data']['users_phone']);
          myServices.sharedPreferences.setString('step', '2');
          myServices.sharedPreferences
              .setString('isAdmin', response['data']['users_admin'].toString());
          myServices.sharedPreferences
              .setString('userImage', response['data']['users_image']);

          response['data']['users_admin'].toString() == '1'
              ? Get.offNamed(AppRoutes.adminHome)
              : Get.offNamed(
                  AppRoutes.home,
                );
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: " Email Or Password Not Correct",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("=========");
      print(value);
      print("=========");
      String? token = value;
    });

    email = TextEditingController();
    password = TextEditingController();
    showPassword = true;

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForget() {
    Get.toNamed(AppRoutes.forget);
  }

  @override
  changeShowPassword() {
    showPassword = !showPassword;
    update();
  }
}
