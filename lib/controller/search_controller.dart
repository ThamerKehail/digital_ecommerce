import 'package:ecommerceapp/data/datasource/remote/items/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';

abstract class SearchController extends GetxController {
  getItem(String text);
  goToSearch(String searchText);
}

class SearchControllerImp extends SearchController {
  List items = [];
  late String searchText;
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? text;
  SearchData searchData = SearchData(Get.find());

  @override
  getItem(String text) async {
    print("Search Item..........");
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.searchData(itemName: text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
        print("*************************");
        print(items);
        print("**************************");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    print("=================");
    print("Search");
    print("=================");
    searchText = await Get.arguments['searchText'];
    await getItem(searchText);
    text = TextEditingController(text: searchText);
    super.onInit();
  }

  @override
  goToSearch(String searchText) {
    Get.toNamed(AppRoutes.search, arguments: {
      "searchText": searchText,
    });
  }
}
