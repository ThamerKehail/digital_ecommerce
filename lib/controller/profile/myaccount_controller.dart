import 'dart:io';

import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class MyAccountController extends GetxController {
  chooseImage(BuildContext context);
  updateProfile();
}

class MyAccountControllerImp extends MyAccountController {
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  ProfileData profileData = ProfileData(Get.find());
  String? image;

  File? file;
  @override
  void onInit() {
    emailController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    image = myServices.sharedPreferences.getString('userImage') ??
        "https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg";
    usernameController.text =
        myServices.sharedPreferences.getString('username')!;
    emailController.text = myServices.sharedPreferences.getString('email')!;
    phoneController.text = myServices.sharedPreferences.getString('phone')!;

    super.onInit();
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

  @override
  updateProfile() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await profileData.editProfileData(
      userID: myServices.sharedPreferences.getString('id')!,
      username: usernameController.text,
      email: emailController.text,
      phone: phoneController.text,
      image: '',
      file: file,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "Success") {
        myServices.sharedPreferences.setString('phone', phoneController.text);
        myServices.sharedPreferences.setString('email', emailController.text);
        myServices.sharedPreferences
            .setString('userImage', response['user_image']);
        myServices.sharedPreferences
            .setString('username', usernameController.text);
        Get.offAllNamed(AppRoutes.home);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
}
