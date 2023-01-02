import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel items;

  const CustomListItems({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return InkWell(
        onTap: () => controller.goToProductDetails(items),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: '${items.itemId}',
                  child: CachedNetworkImage(
                      imageUrl: '${AppLinks.itemsImage}/${items.itemImage}'),
                ),
                Text(
                  items.itemName ?? "",
                  style: const TextStyle(
                    color: ColorApp.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  items.itemDesc ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${items.itemPrice} JD",
                      style: const TextStyle(
                          color: ColorApp.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sans'),
                    ),
                    GetBuilder<FavoriteController>(builder: (controller) {
                      return IconButton(
                          onPressed: () {
                            if (controller
                                    .isFavorite[items.itemId.toString()] ==
                                "1") {
                              controller.setFavorite(
                                  items.itemId.toString(), '0');
                              controller
                                  .removeFavorite(items.itemId.toString());
                            } else {
                              controller.setFavorite(
                                  items.itemId.toString(), '1');
                              controller.addFavorite(items.itemId.toString());
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[items.itemId.toString()] ==
                                    '1'
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: ColorApp.primaryColor,
                          ));
                    })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
