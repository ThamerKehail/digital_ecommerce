import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addData({
    required String itemId,
    required String userID,
  }) async {
    var response =
        await crud.postData(linkUrl: AppLinks.favoriteAddItemLink, data: {
      "item_id": itemId,
      "users_id": userID,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeData({
    required String itemId,
    required String userID,
  }) async {
    var response =
        await crud.postData(linkUrl: AppLinks.favoriteRemoveItemLink, data: {
      "item_id": itemId,
      "users_id": userID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
