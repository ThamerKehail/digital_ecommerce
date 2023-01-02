import 'package:ecommerceapp/controller/admin/products_controller.dart';
import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class AdminCategoriesListCard extends StatelessWidget {
  final CategoriesModel categories;
  final int i;
  const AdminCategoriesListCard(
      {Key? key, required this.categories, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsControllerImp>(builder: (controller) {
      return InkWell(
        onTap: () {
          controller.changeCat(i, categories.catId ?? 1);
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: ColorApp.primaryColor, width: 3)))
                  : null,
              child: Text(
                "${categories.catName}",
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
            )
          ],
        ),
      );
    });
  }
}
