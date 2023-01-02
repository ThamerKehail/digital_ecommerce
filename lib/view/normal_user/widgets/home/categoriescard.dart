import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/linkapi.dart';
import '../../../../core/functions/translatedatabase.dart';

class CategoriesCard extends GetView<HomeControllerImp> {
  final CategoriesModel categories;
  final int i;
  const CategoriesCard({Key? key, required this.categories, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          controller.goToItems(controller.categories, i, categories.catId ?? 1),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorApp.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
                "${AppLinks.catImage}/${categories.catImage}",
                color: ColorApp.primaryColor),
          ),
          Text(
            "${translateDataBase(categories.catNameAr, categories.catName)}",
            style: const TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
