import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class SignupController extends GetxController {
  signup(BuildContext context);
  goToLogin();
  chooseImage(BuildContext context);
}

class SignupControllerImp extends SignupController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  File? file;
  GlobalKey<FormState> formsState = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data = [];
  @override
  signup(BuildContext context) async {
    if (file == null) {
      return AwesomeDialog(
          context: context,
          title: "Important",
          body: const Text("Please Add Photo to complete register"))
        ..show();
    }
    if (formsState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        email: email.text,
        username: username.text,
        phone: phone.text,
        password: password.text,
        file: file!,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifyCodeSignUp, arguments: {
            'email': email.text,
          });
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Phone Number Or Email Already Exists",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();

    super.dispose();
  }

  @override
  chooseImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 100,
              child: Column(
                children: [
                  InkWell(
                      onTap: () async {
                        XFile? xfile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        file = File(xfile!.path);
                        update();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: const Text("Choose Image from gallery"),
                      )),
                  InkWell(
                      onTap: () async {
                        XFile? xfile = await ImagePicker()
                            .pickImage(source: ImageSource.camera);
                        file = File(xfile!.path);
                        update();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: const Text("Choose Image from Camera"),
                      )),
                ],
              ),
            ));
  }
}
