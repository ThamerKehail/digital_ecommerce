import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get.dart';

import '../../core/constant/paymentmethodeenum.dart';

abstract class PaymentMethodsController extends GetxController {
  changeMethods(SingingCharacter value);
  goToCheckoutDetails();
}

class PaymentMethodsControllerImp extends PaymentMethodsController {
  SingingCharacter character = SingingCharacter.mastercard;
  late List cartItems;
  late int totalPrice;
  @override
  void onInit() {
    cartItems = Get.arguments['items'];
    totalPrice = Get.arguments['totalPrice'];
    super.onInit();
  }

  @override
  changeMethods(SingingCharacter value) {
    character = value;
    print(character);
    update();
  }

  @override
  goToCheckoutDetails() {
    Get.toNamed(AppRoutes.checkoutDetails, arguments: {
      'items': cartItems,
      'totalPrice': totalPrice,
    });
  }
}
