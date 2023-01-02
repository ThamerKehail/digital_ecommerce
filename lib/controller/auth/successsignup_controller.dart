import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLoginScreen();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLoginScreen() {
    Get.offNamed(AppRoutes.login);
  }
}
