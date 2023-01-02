import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class ViewFavoriteData {
  Crud crud;
  ViewFavoriteData(this.crud);
  postData({required String userId}) async {
    var response =
        await crud.postData(linkUrl: AppLinks.favoriteViewLink, data: {
      'usersid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
