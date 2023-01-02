import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/linkapi.dart';
import '../../../../data/model/cartitemmodel.dart';

class ItemsCard extends StatelessWidget {
  final CartItemModel itemsModel;
  const ItemsCard({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorApp.primaryColor,
                  image: DecorationImage(
                      image: NetworkImage(
                          '${AppLinks.itemsImage}/${itemsModel.itemImage}'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemsModel.itemName ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${itemsModel.price} JD",
                  style: const TextStyle(
                    color: ColorApp.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
              width: Get.width / 12,
            ),
          ],
        ),
      ),
    );
  }
}
