import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constant/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postData({
    required String email,
    required String code,
  }) async {
    var response =
        await crud.postData(linkUrl: AppLinks.verifySignupLink, data: {
      "email": email,
      "verifycode": code,
    });
    return response.fold((l) => l, (r) => r);
  }
}
