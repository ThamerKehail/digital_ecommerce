class CartItemModel {
  int? cartId;
  int? cartUserid;
  int? id;
  int? itemsId;
  dynamic price;
  int? qty;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? iteActive;
  dynamic itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCat;
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  int? usersVerifyCode;
  int? usersApprove;
  String? usersCreate;
  String? usersPassword;

  CartItemModel(
      {this.cartId,
      this.cartUserid,
      this.id,
      this.itemsId,
      this.price,
      this.qty,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.iteActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCat,
      this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.usersVerifyCode,
      this.usersApprove,
      this.usersCreate,
      this.usersPassword});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    id = json['id'];
    itemsId = json['items_id'];
    price = json['price'].toDouble();
    qty = json['qty'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    iteActive = json['ite,_active'];
    itemPrice = json['item_price'].toDouble();
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifyCode = json['users_verifyCode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['id'] = this.id;
    data['items_id'] = this.itemsId;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_desc'] = this.itemDesc;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['ite,_active'] = this.iteActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_date'] = this.itemDate;
    data['item_cat'] = this.itemCat;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_verifyCode'] = this.usersVerifyCode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['users_password'] = this.usersPassword;
    return data;
  }
}
