import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/items/items.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, int catVal);
  getItemData();
  goToProductDetails(ItemsModel itemsModel);
  changeFavorite();
}

class ItemsControllerImp extends ItemsController {
  late List categories;
  late int selectedCat;
  late int catId;
  late String id;
  bool active = false;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = (Get.find());
  List items = [];

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selected'];
    catId = Get.arguments['catId'];
    id = myServices.sharedPreferences.getString('id')!;
    getItemData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeCat(int val, int catVal) {
    selectedCat = val;
    catId = catVal;
    getItemData();
    update();
  }

  @override
  getItemData() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.postData(
      catId.toString(),
      id,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response['items']);

        items.addAll(response['data']);
        print(items);
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
  changeFavorite() {
    active = !active;
    update();
  }
}
