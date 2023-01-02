import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLoginScreen();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToLoginScreen() {
    Get.offNamed(AppRoutes.login);
  }
}
