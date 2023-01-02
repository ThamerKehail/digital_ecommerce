import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/home.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/model/itemsmodel.dart';

abstract class HomeController extends GetxController {
  getData();
  getItemsData();
  goToItems(List categories, int selected, int catId);
  goToProductDetails(ItemsModel itemsModel);
  goToSearch(String searchText);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late String email;
  late String username;
  late String phone;
  late String id;
  late String lang;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    email = myServices.sharedPreferences.getString('email')!;
    username = myServices.sharedPreferences.getString('username')!;
    phone = myServices.sharedPreferences.getString('phone')!;
    id = myServices.sharedPreferences.getString('id')!;
    lang = myServices.sharedPreferences.getString('lang')!;
  }

  List categories = [];
  List items = [];
  List allItems = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());

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

  @override
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {'itemsModel': itemsModel});
  }

  @override
  goToItems(List categories, int selected, int catId) {
    Get.toNamed(AppRoutes.items, arguments: {
      'categories': categories,
      'selected': selected,
      'catId': catId,
    });
  }

  @override
  getItemsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.itemsData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response['items']);
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSearch(String searchText) {
    Get.toNamed(AppRoutes.search, arguments: {
      "searchText": searchText,
    });
  }
}
