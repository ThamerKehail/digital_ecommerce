import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  searchData({
    required String itemName,
  }) async {
    var response = await crud.postData(linkUrl: AppLinks.searchItemLink, data: {
      "itemName": itemName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
