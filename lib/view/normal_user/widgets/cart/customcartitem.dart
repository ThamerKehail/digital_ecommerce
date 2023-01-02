import 'package:ecommerceapp/controller/cart/cart_controller.dart';
import 'package:ecommerceapp/core/constant/linkapi.dart';
import 'package:ecommerceapp/data/model/cartitemmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class CustomCartItem extends StatelessWidget {
  final CartItemModel itemsModel;

  const CustomCartItem({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Dismissible(
        onDismissed: (v) {
          controller.deleteItemCart(itemId: itemsModel.itemId.toString());
        },
        background: Container(
          color: ColorApp.primaryColor,
          child: const Center(
            child: Icon(Icons.delete),
          ),
        ),
        key: ValueKey<int>(itemsModel.itemId!),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  '${AppLinks.itemsImage}/${itemsModel.itemImage}',
                  width: 75,
                  height: 75,
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemsModel.itemName ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${itemsModel.itemPrice} JD',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffc1c1c1),
                        shape: BoxShape.circle,
                      ),
                      height: 25,
                      width: 25,
                      child: IconButton(
                          onPressed: () {
                            controller.updateItemCart(
                                itemId: itemsModel.itemId.toString(),
                                qty: (itemsModel.qty = (itemsModel.qty! + 1))
                                    .toString());
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 11,
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      itemsModel.qty.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffc1c1c1),
                        shape: BoxShape.circle,
                      ),
                      height: 25,
                      width: 25,
                      child: IconButton(
                          onPressed: () {
                            controller.updateItemCart(
                                itemId: itemsModel.itemId.toString(),
                                qty: (itemsModel.qty = (itemsModel.qty! - 1))
                                    .toString());
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 11,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
