import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
  postData({
    required String email,
    required String verifycode,
  }) async {
    var response = await crud.postData(linkUrl: AppLinks.verifyCodeLink, data: {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
