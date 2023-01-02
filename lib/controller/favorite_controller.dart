import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favorite/favorite.dart';
import 'package:ecommerceapp/data/datasource/remote/favorite/viewfavorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  List items = [];
  setFavorite(String id, String val) {
    isFavorite[id] = val;
    print(isFavorite);
    update();
  }

  MyServices myServices = Get.find();
  ViewFavoriteData viewFavoriteData = ViewFavoriteData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  FavoriteData favoriteData = FavoriteData(Get.find());

  addFavorite(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addData(
      userID: myServices.sharedPreferences.getString('id')!,
      itemId: itemId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "Notification",
          messageText: const Text(
            "The product has been added from your favorite",
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        );
        print(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  removeFavorite(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeData(
      userID: myServices.sharedPreferences.getString('id')!,
      itemId: itemId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "Notification",
          messageText: const Text(
            "The product has been removed from your favorite",
            style: TextStyle(color: Color(0xffffffff)),
          ),
        );
        print(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    getFavoriteItem();

    update();
  }

  getFavoriteItem() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewFavoriteData.postData(
        userId: myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response['data']);

        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    print(':on init favorite');
    getFavoriteItem();
    super.onInit();
  }
}
