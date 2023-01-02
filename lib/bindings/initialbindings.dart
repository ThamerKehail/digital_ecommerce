import 'package:ecommerceapp/controller/cart/cart_controller.dart';
import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:get/get.dart';

import '../controller/favorite_controller.dart';
import '../controller/items/items_controller.dart';
import '../controller/orderhistory_controller.dart';
import '../controller/search_controller.dart';
import '../core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => CartControllerImp(), fenix: true);
    Get.lazyPut(() => ProductDetailsControllerImp(), fenix: true);
    Get.lazyPut(() => OrderHistoryControllerImp(), fenix: true);
    Get.lazyPut(() => SearchControllerImp(), fenix: true);
    Get.lazyPut(() => ItemsControllerImp(), fenix: true);
  }
}
