import '../../../core/class/crud.dart';
import '../../../core/constant/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  postData() async {
    var response = await crud.postData(linkUrl: AppLinks.homeLink, data: {});
    return response.fold((l) => l, (r) => r);
  }

  itemsData() async {
    var response =
        await crud.postData(linkUrl: AppLinks.allItemsLink, data: {});
    return response.fold((l) => l, (r) => r);
  }
}
