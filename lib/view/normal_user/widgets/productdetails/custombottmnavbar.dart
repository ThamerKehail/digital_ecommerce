import 'package:ecommerceapp/controller/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String itemId;
  final double price;
  final int qty;
  const CustomBottomNavBar(
      {Key? key, required this.itemId, required this.price, required this.qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controllerCart) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 45,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: ColorApp.primaryColor2,
          onPressed: () {
            // controllerCart.setCart(itemId, '1');
            controllerCart.addToCart(
              itemId: itemId,
              price: price,
              qty: qty,
            );
          },
          child: Text(
            controllerCart.isCart[itemId] == '1' ? "Added" : "Add To Cart",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
