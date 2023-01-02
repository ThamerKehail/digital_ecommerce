import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/constant/linkapi.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class CustomAppbarProductDetails extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomAppbarProductDetails({Key? key, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 110),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
                color: ColorApp.primaryColor2,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
          ),
          Positioned(
            top: 30.0,
            left: Get.width / 13,
            right: Get.width / 13,
            child: Hero(
              tag: '${itemsModel.itemId}',
              child: CachedNetworkImage(
                imageUrl: '${AppLinks.itemsImage}/${itemsModel.itemImage}',
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
