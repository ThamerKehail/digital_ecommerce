import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/cart/cart.dart';

abstract class CartController extends GetxController {
  goToDeliverLocation();
  setCart(
    String id,
    String val,
  );
  addToCart({required String itemId, required double price, required int qty});
  addDetailsToCart(
      {required String itemId, required double price, required int qty});
  deleteItemCart({
    required String itemId,
  });
  updateItemCart({
    required String itemId,
    required String qty,
  });
  getAllItem();
  deleteCart();
}

class CartControllerImp extends CartController {
  Map isCart = {};
  List items = [];
  int totalPrice = 0;
  int totalQty = 0;

  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  @override
  setCart(
    String id,
    String val,
  ) {
    isCart[id] = val;

    update();
  }

  @override
  addToCart(
      {required String itemId, required double price, required int qty}) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addData(
      userID: myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        myServices.sharedPreferences
            .setString('cartId', response['last_id'].toString());

        print(response['last_id']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      await addDetailsToCart(
        itemId: itemId,
        price: price,
        qty: qty,
      );
    }
    // await addDetailsToCart(
    //   itemId: itemId,
    //   price: price,
    //   qty: qty,
    // );
    update();
  }

  @override
  addDetailsToCart(
      {required String itemId, required double price, required int qty}) async {
    print("===============CARTID=========================");
    print(myServices.sharedPreferences.getString('cartId'));
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addDetailsData(
      cartId: myServices.sharedPreferences.getString('cartId')!,
      itemId: itemId,
      price: price.toString(),
      qty: qty.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "Notification",
          messageText: const Text(
            "The product has been added from your cartDetails",
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        );

        print(response['data']);
      } else if (response['status'] == "Update") {
        Get.rawSnackbar(
          title: "Notification",
          messageText: const Text(
            "The product has been updated ",
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  deleteItemCart({
    required String itemId,
  }) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(itemId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "Success") {
        Get.rawSnackbar(
          title: "Notification",
          messageText: const Text(
            "The product has been deleted from your cartDetails",
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
  updateItemCart({
    required String itemId,
    required String qty,
  }) async {
    if (int.parse(qty) > 0) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await cartData.updateCart(itemId, qty);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "Success") {
          getAllItem();
          print(response['data']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {
      deleteItemCart(itemId: itemId);
    }
  }

  @override
  getAllItem() async {
    totalPrice = 0;
    items.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response['data']);

        items.addAll(response['data']);
        items.forEach((element) {
          int x = element['price'] * element['qty'];
          totalPrice += x;
        });

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
  void onInit() {
    getAllItem();
    super.onInit();
  }

  @override
  goToDeliverLocation() {
    Get.toNamed(AppRoutes.deliverLocation,
        arguments: {'items': items, 'totalPrice': totalPrice});
  }
}
