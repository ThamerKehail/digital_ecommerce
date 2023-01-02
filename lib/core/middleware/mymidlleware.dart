import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWere extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "2") {
      if (myServices.sharedPreferences.getString('isAdmin') == "1") {
        print(myServices.sharedPreferences.getString('isAdmin'));
        return const RouteSettings(
          name: AppRoutes.adminHome,
        );
      } else {
        return const RouteSettings(
          name: AppRoutes.home,
        );
      }
    }
    if (myServices.sharedPreferences.getString('step') == "1") {
      return const RouteSettings(
        name: AppRoutes.login,
      );
    }

    return null;
  }
}
