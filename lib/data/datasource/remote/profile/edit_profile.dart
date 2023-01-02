import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);
  editProfileData({
    required String userID,
    required String username,
    required String email,
    required String phone,
    required String image,
    File? file,
  }) async {
    if (file == null) {
      var response =
          await crud.postData(linkUrl: AppLinks.editProfileLink, data: {
        "userId": userID,
        "username": username,
        "email": email,
        "phone": phone,
        "image": image,
      });
      return response.fold((l) => l, (r) => r);
    } else {
      var response = await crud.postRequestWithFile(
        AppLinks.editProfileLink,
        {
          "userId": userID,
          "username": username,
          "email": email,
          "phone": phone,
          "image": image,
        },
        file,
      );
      return response.fold((l) => l, (r) => r);
    }
  }
}
