import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/cart/cart.dart';

abstract class CheckoutController extends GetxController {
  addAddress();
}

class CheckoutControllerImp extends CheckoutController {
  late TextEditingController country;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController phone;
  late TextEditingController note;
  GlobalKey<FormState> formsState = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  late List cartItems;
  late int totalPrice;

  @override
  void onInit() {
    country = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    phone = TextEditingController();
    note = TextEditingController();
    cartItems = Get.arguments['items'];
    totalPrice = Get.arguments['totalPrice'];
    super.onInit();
  }

  @override
  addAddress() async {
    print(myServices.sharedPreferences.getString('cartId')!);

    if (formsState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await cartData.cartAddressData(
        country: country.text,
        city: city.text,
        street: street.text,
        phone: phone.text,
        note: note.text,
        cartId: myServices.sharedPreferences.getString('cartId')!,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoutes.paymentMethods, arguments: {
            'items': cartItems,
            'totalPrice': totalPrice,
          });

          print(response['last_id']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
  }
}
