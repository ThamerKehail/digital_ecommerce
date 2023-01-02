import 'package:ecommerceapp/controller/cart/cart_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/cart/customcartappbar.dart';
import '../../widgets/cart/customcarttabbar.dart';
import '../../widgets/cart/customcurrentorder.dart';

class CartScreen extends GetView<CartControllerImp> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<CartControllerImp>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomCartAppbar(
                    title: "Cart",
                    iconData: Icons.delete_forever_outlined,
                    onPressed: () {
                      controller.deleteCart();
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const CustomCartTabBar(
                                titleOne: 'Current Order',
                                titleTwo: 'Order History'),
                            Container(
                                height: Get.width / 0.2,
                                //height of TabBarView
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: const TabBarView(children: <Widget>[
                                  CustomCurrentOrder(),
                                  Center(
                                    child: Text('Display Tab 2',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]))
                          ])),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
