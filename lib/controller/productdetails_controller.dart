import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/cart/cart.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
  increaseQty();
  decreaseQty();
  chooseColor(int index);
  getCartItem();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  List items = [];
  Map isCart = {};
  setFavorite(String id, String val) {
    isCart[id] = val;
    print(isCart);
    update();
  }

  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  List productColors = [
    {"name": "red", "id": 1, "active": 1},
    {"name": "yellow", "id": 2, "active": 0},
    {"name": "blue", "id": 3, "active": 0},
  ];
  int qty = 1;
  @override
  initialData() {
    itemsModel = Get.arguments['itemsModel'];

    getCartItem();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  decreaseQty() {
    if (qty > 1) {
      qty--;
    }

    update();
  }

  @override
  increaseQty() {
    qty++;

    update();
  }

  @override
  chooseColor(int index) {
    productColors.forEach((element) {
      element['active'] = 0;
    });
    productColors[index]['active'] = 1;
    update();
  }

  @override
  getCartItem() async {
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
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
}
