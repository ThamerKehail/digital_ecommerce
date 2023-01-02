import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cart/cart.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/model/itemsmodel.dart';

abstract class OrderHistoryController extends GetxController {
  getAllItem();
  goToProductDetails(ItemsModel itemsModel);
}

class OrderHistoryControllerImp extends OrderHistoryController {
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  @override
  getAllItem() async {
    print("===========Order History===========");
    print(
        "===========${myServices.sharedPreferences.getString('id')}===========");
    items.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.orderHistoryData(
        userID: myServices.sharedPreferences.getString('id')!);
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
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {'itemsModel': itemsModel});
  }

  @override
  void onInit() {
    getAllItem();
    super.onInit();
  }
}
