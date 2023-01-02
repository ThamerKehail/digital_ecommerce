import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categorylistcard.dart';

class ListItemCategory extends GetView<ItemsControllerImp> {
  const ListItemCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoriesListCard(
            categories: CategoriesModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
        itemCount: controller.categories.length,
      ),
    );
  }
}
