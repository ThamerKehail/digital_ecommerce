import 'package:ecommerceapp/core/middleware/mymidlleware.dart';
import 'package:ecommerceapp/view/admin/screens/admin_home.dart';
import 'package:ecommerceapp/view/admin/screens/products.dart';
import 'package:ecommerceapp/view/normal_user/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapp/view/normal_user/screens/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceapp/view/normal_user/screens/auth/forgetpassword/success.dart';
import 'package:ecommerceapp/view/normal_user/screens/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceapp/view/normal_user/screens/auth/login.dart';
import 'package:ecommerceapp/view/normal_user/screens/auth/signup.dart';
import 'package:ecommerceapp/view/normal_user/screens/auth/successsignup.dart';
import 'package:ecommerceapp/view/normal_user/screens/auth/verifycodesignup.dart';
import 'package:ecommerceapp/view/normal_user/screens/cart/checkout.dart';
import 'package:ecommerceapp/view/normal_user/screens/cart/checkout_details.dart';
import 'package:ecommerceapp/view/normal_user/screens/cart/deliver_location.dart';
import 'package:ecommerceapp/view/normal_user/screens/cart/paymentmethod.dart';
import 'package:ecommerceapp/view/normal_user/screens/items.dart';
import 'package:ecommerceapp/view/normal_user/screens/langouge.dart';
import 'package:ecommerceapp/view/normal_user/screens/mainhomescreen.dart';
import 'package:ecommerceapp/view/normal_user/screens/onboarding.dart';
import 'package:ecommerceapp/view/normal_user/screens/orderhistory.dart';
import 'package:ecommerceapp/view/normal_user/screens/productdetails.dart';
import 'package:ecommerceapp/view/normal_user/screens/profile/my_account.dart';
import 'package:ecommerceapp/view/normal_user/screens/search.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const Language(), middlewares: [
    MyMiddleWere(),
  ]),
  GetPage(
      name: AppRoutes.productDetails, page: () => const ProductDetailsScreen()),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.deliverLocation, page: () => const DeliverLocation()),
  GetPage(name: AppRoutes.signup, page: () => const SignUpScreen()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.forget, page: () => const ForgetPasswordScreen()),
  GetPage(name: AppRoutes.myAccount, page: () => const MyAccount()),
  GetPage(name: AppRoutes.search, page: () => const SearchScreen()),
  GetPage(name: AppRoutes.orderHistory, page: () => const OrderHistory()),
  GetPage(name: AppRoutes.checkout, page: () => const CheckoutScreen()),
  GetPage(name: AppRoutes.checkoutDetails, page: () => const CheckoutDetails()),
  GetPage(name: AppRoutes.products, page: () => const ProductsScreen()),
  GetPage(
      name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodeScreen()),
  GetPage(
      name: AppRoutes.paymentMethods, page: () => const PaymentMethodScreen()),
  GetPage(
      name: AppRoutes.successReset, page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoutes.successSignup, page: () => const SuccessSignUpScreen()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp,
      page: () => const VerifyCodeSignUpScreen()),
  GetPage(name: AppRoutes.home, page: () => const MainHomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.adminHome, page: () => const AdminHomeScreen()),
];
