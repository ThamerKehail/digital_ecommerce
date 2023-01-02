import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData({
    required String email,
    required String password,
  }) async {
    var response =
        await crud.postData(linkUrl: AppLinks.resetPasswordLink, data: {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
