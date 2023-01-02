import 'dart:io';

import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constant/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postData({
    required String email,
    required String username,
    required String phone,
    required String password,
    required File file,
  }) async {
    var response = await crud.postRequestWithFile(
        AppLinks.signUpLink,
        {
          "username": username,
          "email": email,
          "phone": phone,
          "password": password,
          "file": password,
        },
        file);
    return response.fold((l) => l, (r) => r);
  }
}
