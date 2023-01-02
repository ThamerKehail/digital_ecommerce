import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/linkapi.dart';
import '../../../../data/model/itemsmodel.dart';

class ItemCard extends GetView<HomeControllerImp> {
  final ItemsModel items;
  const ItemCard({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(items);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CachedNetworkImage(
              imageUrl: '${AppLinks.itemsImage}/${items.itemImage}',
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorApp.black.withOpacity(0.3),
            ),
            height: 120,
            width: 200,
          ),
          Positioned(
              left: 10,
              child: Text(
                "${items.itemName}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ))
        ],
      ),
    );
  }
}
