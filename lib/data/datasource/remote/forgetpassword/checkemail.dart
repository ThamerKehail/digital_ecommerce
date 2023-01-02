import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postData({
    required String email,
  }) async {
    var response = await crud.postData(linkUrl: AppLinks.checkEmailLink, data: {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
