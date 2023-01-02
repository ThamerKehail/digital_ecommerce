import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/view/normal_user/widgets/home/itemcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/itemsmodel.dart';

class CustomItemHome extends GetView<HomeControllerImp> {
  const CustomItemHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.allItems.length,
        itemBuilder: (context, index) {
          return ItemCard(
            items: ItemsModel.fromJson(controller.allItems[index]),
          );
        },
      ),
    );
  }
}
