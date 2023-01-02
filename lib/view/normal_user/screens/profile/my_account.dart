import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/profile/myaccount_controller.dart';
import '../../../../core/constant/linkapi.dart';
import '../../../../core/functions/validinput.dart';
import '../../widgets/auth/custom_buttom_auth.dart';
import '../../widgets/auth/customtextformfield.dart';
import '../../widgets/profile/customappbar.dart';
import '../../widgets/profile/customprofileimage.dart';

class MyAccount extends GetView<MyAccountControllerImp> {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyAccountControllerImp());
    return Scaffold(
      body: GetBuilder<MyAccountControllerImp>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CustomProfileAppbar(
                  title: "My Account",
                  onTap: () {
                    Get.back();
                  }),
              CustomProfileImage(
                img: controller.file == null
                    ? NetworkImage(
                        "${AppLinks.profileImage}/${controller.image}")
                    : FileImage(File(controller.file!.path)) as ImageProvider,
                onTap: () {
                  controller.chooseImage(context);
                },
              ),
              CustomTextFormField(
                hint: controller.usernameController.text,
                label: "User Name",
                iconData: Icons.person_outline,
                myController: controller.usernameController,
                validator: (String? val) {
                  return validInput(val!, 5, 100, 'email');
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hint: controller.emailController.text,
                label: "Email",
                iconData: Icons.email_outlined,
                myController: controller.emailController,
                validator: (String? val) {
                  return validInput(val!, 5, 100, 'email');
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hint: controller.phoneController.text,
                label: "Phone",
                iconData: Icons.phone_outlined,
                myController: controller.phoneController,
                validator: (String? val) {
                  return validInput(val!, 5, 100, 'email');
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomButtomAuth(
                  onPressed: () {
                    controller.updateProfile();
                  },
                  text: "Update"),
            ],
          ),
        );
      }),
    );
  }
}
