import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class AdminHomeController extends GetxController {}

class AdminHomeControllerImp extends AdminHomeController {
  List homeCard = [
    {
      'icon': Icons.dashboard_customize_outlined,
      'title': "Dashboard",
      'onPress': () {
        print("Dashboard");
      },
    },
    {
      'icon': Icons.wallet_giftcard,
      'title': "Products",
      'onPress': () {
        Get.toNamed(AppRoutes.products);
      },
    },
    {
      'icon': Icons.person_outline,
      'title': "Customers",
      'onPress': () {
        print("Customers");
      },
    },
    {
      'icon': Icons.shopping_cart_outlined,
      'title': "Orders",
      'onPress': () {
        print("Orders");
      },
    },
  ];
}
