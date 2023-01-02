import 'package:ecommerceapp/controller/cart/checkout_controller.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/cart/cart.dart';

abstract class CheckoutDetailsController extends GetxController {
  addOrder();
  deleteCart();
  getAllItem();
}

class CheckoutDetailsControllerImp extends CheckoutDetailsController {
  late List cartItems;
  late int totalPrice;
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  @override
  getAllItem() async {
    totalPrice = 0;

    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response['data']);

        print(
            "===================totalPrice==========================================");
        print(totalPrice);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  addOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.orderData(
      userID: myServices.sharedPreferences.getString('id')!,
      cartId: myServices.sharedPreferences.getString('cartId')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "Success") {
        Get.rawSnackbar(
          title: "Notification",
          messageText: const Text(
            "SuccessOrder",
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        );
        deleteCart();
        Get.offAllNamed(AppRoutes.home);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  deleteCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .deleteAllCart(myServices.sharedPreferences.getString('cartId')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "Success") {
        Get.rawSnackbar(
          title: "Notification",
          messageText: const Text(
            "Delete All Cart",
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        );
        getAllItem();

        print(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    cartItems = Get.arguments['items'];
    totalPrice = Get.arguments['totalPrice'];
    super.onInit();
  }
}
