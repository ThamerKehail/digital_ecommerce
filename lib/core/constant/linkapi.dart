class AppLinks {
  static const String baseUrl = "http://ecommerce.florajo.com";
  static const String catImage =
      "http://ecommerce.florajo.com//upload/categories";
  static const String itemsImage = "http://ecommerce.florajo.com/upload/items";
  static const String profileImage = "http://ecommerce.florajo.com/upload";
  //**************Auth************//

  static const String signUpLink = "$baseUrl/auth/signup.php";
  static const String verifySignupLink = "$baseUrl/auth/verifycode.php";
  static const String loginLink = "$baseUrl/auth/login.php";
//**************Forget Password************//
  static const String checkEmailLink = "$baseUrl/forgetpassword/checkemail.php";
  static const String verifyCodeLink = "$baseUrl/forgetpassword/verifycode.php";
  static const String resetPasswordLink =
      "$baseUrl/forgetpassword/resetpassword.php";
  //***************************Home*****************************//

  static const String homeLink = "$baseUrl/home.php";
  static const String allItemsLink = "$baseUrl/items/all_items.php";
  //***************************Items*****************************//

  static const String itemsLink = "$baseUrl/items/items.php";
  static const String searchItemLink = "$baseUrl/items/search.php";

//***************************Favorite*****************************//
  static const String favoriteAddItemLink = "$baseUrl/favorite/add.php";
  static const String favoriteRemoveItemLink = "$baseUrl/favorite/remove.php";
  static const String favoriteViewLink = "$baseUrl/favorite/view.php";
//***************************Cart*****************************//
  static const String addToCartLink = "$baseUrl/cart/add.php";
  static const String addDetailsToCartLink = "$baseUrl/cart/add_details.php";
  static const String viewCartLink = "$baseUrl/cart/view.php";
  static const String deleteItemCartLink = "$baseUrl/cart/delete.php";
  static const String updateItemCartLink = "$baseUrl/cart/update.php";
  static const String cartAddressLink = "$baseUrl/cart/address.php";
  static const String deleteCartLink = "$baseUrl/cart/delete_cart.php";
  static const String orderLink = "$baseUrl/cart/orders.php";
  static const String orderHistoryLink = "$baseUrl/cart/order_history.php";

  //***************************Profile*****************************//

  static const String editProfileLink = "$baseUrl/profile/update.php";
}
