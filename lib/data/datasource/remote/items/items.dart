import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  postData(String id, String userId) async {
    var response = await crud.postData(linkUrl: AppLinks.itemsLink, data: {
      'id': id,
      'usersid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
