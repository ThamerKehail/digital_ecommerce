import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/services/services.dart';

abstract class ProfileController extends GetxController {
  logout();
  goToOrderHistory();
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();
  String? username;
  String? email;
  String? image;
  @override
  void onInit() {
    username = myServices.sharedPreferences.getString('username') ?? "UserName";
    email = myServices.sharedPreferences.getString('email') ?? "Email";
    image = myServices.sharedPreferences.getString('userImage') ??
        "https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg";
    super.onInit();
  }

  @override
  logout() {
    myServices.sharedPreferences.setString('step', '1');
    Get.toNamed(AppRoutes.login);
  }

  List profileList = [
    {
      'icon': const Icon(
        Icons.person_outline,
        color: ColorApp.primaryColor,
        size: 30,
      ),
      'name': const Text(
        "My Account",
        style: TextStyle(
          height: 1.1,
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'sans',
          fontWeight: FontWeight.bold,
        ),
      ),
    },
    {
      'icon': const Icon(
        Icons.notifications_active_outlined,
        color: ColorApp.primaryColor,
        size: 30,
      ),
      'name': const Text(
        "Notifications",
        style: TextStyle(
          height: 1.1,
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'sans',
          fontWeight: FontWeight.bold,
        ),
      ),
    },
    {
      'icon': const Icon(
        Icons.shopping_cart_outlined,
        color: ColorApp.primaryColor,
        size: 30,
      ),
      'name': const Text(
        "Orders History",
        style: TextStyle(
          height: 1.1,
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'sans',
          fontWeight: FontWeight.bold,
        ),
      ),
    },
    {
      'icon': const Icon(
        Icons.help_outline,
        color: ColorApp.primaryColor,
        size: 30,
      ),
      'name': const Text(
        "Help Center",
        style: TextStyle(
          height: 1.1,
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'sans',
          fontWeight: FontWeight.bold,
        ),
      ),
    },
    {
      'icon': const Icon(
        Icons.logout,
        color: ColorApp.primaryColor,
        size: 30,
      ),
      'name': const Text(
        "Log Out",
        style: TextStyle(
          height: 1.1,
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'sans',
          fontWeight: FontWeight.bold,
        ),
      ),
    },
  ];

  @override
  goToOrderHistory() {
    Get.toNamed(AppRoutes.orderHistory);
  }
}
