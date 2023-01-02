import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constant/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData({
    required String email,
    required String password,
  }) async {
    var response = await crud.postData(linkUrl: AppLinks.loginLink, data: {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
