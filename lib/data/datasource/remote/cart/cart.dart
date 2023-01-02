import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addData({
    required String userID,
  }) async {
    var response = await crud.postData(linkUrl: AppLinks.addToCartLink, data: {
      "user_id": userID,
    });
    return response.fold((l) => l, (r) => r);
  }

  addDetailsData({
    required String cartId,
    required String itemId,
    required String price,
    required String qty,
  }) async {
    var response =
        await crud.postData(linkUrl: AppLinks.addDetailsToCartLink, data: {
      "cart_id": cartId,
      "items_id": itemId,
      "price": price,
      "qty": qty,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userId) async {
    var response = await crud.postData(linkUrl: AppLinks.viewCartLink, data: {
      'usersid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String itemId) async {
    var response =
        await crud.postData(linkUrl: AppLinks.deleteItemCartLink, data: {
      'itemId': itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAllCart(String cartId) async {
    var response = await crud.postData(linkUrl: AppLinks.deleteCartLink, data: {
      'cartId': cartId,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateCart(String itemId, String qty) async {
    var response =
        await crud.postData(linkUrl: AppLinks.updateItemCartLink, data: {
      'itemId': itemId,
      'qty': qty,
    });
    return response.fold((l) => l, (r) => r);
  }

  cartAddressData({
    required String country,
    required String city,
    required String street,
    required String phone,
    required String note,
    required String cartId,
  }) async {
    var response =
        await crud.postData(linkUrl: AppLinks.cartAddressLink, data: {
      "country": country,
      "city": city,
      "street": street,
      "phone": phone,
      "note": note,
      "cartId": cartId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderData({
    required String userID,
    required String cartId,
  }) async {
    var response = await crud.postData(linkUrl: AppLinks.orderLink, data: {
      "userId": userID,
      "cartId": cartId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderHistoryData({
    required String userID,
  }) async {
    var response =
        await crud.postData(linkUrl: AppLinks.orderHistoryLink, data: {
      "usersid": userID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
