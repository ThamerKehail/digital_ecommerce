import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/data/datasource/remote/home.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

abstract class ProductsController extends GetxController {
  getData();
  changeCat(int val, int catVal);
}

class ProductsControllerImp extends ProductsController {
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List allItems = [];
  int selectedCat = 1;
  int catId = 1;
  @override
  changeCat(int val, int catVal) {
    selectedCat = val;
    catId = catVal;
    // getItemData();
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.postData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response['items']);
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        allItems.addAll(response['allItems']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
