class ItemsModel {
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? iteActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCat;
  int? catId;
  String? catName;
  String? catNameAr;
  String? catImage;
  String? catDatetime;
  int? favorite;
  int? qty;

  ItemsModel({
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
    this.catId,
    this.catName,
    this.catNameAr,
    this.catImage,
    this.catDatetime,
    this.favorite,
    this.qty,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    iteActive = json['item_active'];
    itemPrice = json['item_price'].toInt();
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catDatetime = json['cat_datetime'];
    favorite = json['favorite'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_desc'] = itemDesc;
    data['item_desc_ar'] = itemDescAr;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = iteActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_date'] = itemDate;
    data['item_cat'] = itemCat;
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['cat_name_ar'] = catNameAr;
    data['cat_image'] = catImage;
    data['cat_datetime'] = catDatetime;
    data['favorite'] = favorite;
    data['qty'] = qty;
    return data;
  }
}
