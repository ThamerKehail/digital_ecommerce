import 'package:ecommerceapp/controller/cart/checkoutdetails_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/auth/custom_buttom_auth.dart';
import '../../widgets/cart/customcartappbar.dart';
import '../../widgets/checkout_details/custompaymentmethodcard.dart';
import '../../widgets/checkout_details/customtotalprice.dart';
import '../../widgets/checkout_details/list_items.dart';

class CheckoutDetails extends GetView<CheckoutDetailsControllerImp> {
  const CheckoutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutDetailsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            const CustomCartAppbar(
              title: "Checkout Details",
            ),
            ListItems(items: controller.cartItems),
            CustomTotalPrice(
                price: controller.totalPrice.toString(),
                delivery: '5',
                tax: (controller.totalPrice * 0.16).toString(),
                totalPrice:
                    '${controller.totalPrice + 5 + controller.totalPrice * 0.16}'),
            CustomPaymentMethodCard(
                onTap: () {},
                title: "***156",
                img: "assets/images/mastercard.svg"),
            CustomButtomAuth(
                onPressed: () {
                  controller.addOrder();
                },
                text: "Pay Now"),
          ],
        ),
      ),
    );
  }
}
