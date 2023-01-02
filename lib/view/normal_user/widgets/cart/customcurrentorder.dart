import 'package:ecommerceapp/controller/cart/cart_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/data/model/cartitemmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'customcartitem.dart';
import 'customcarttotal.dart';

class CustomCurrentOrder extends StatelessWidget {
  const CustomCurrentOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      print(controller.statusRequest);
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              CustomCartTotal(
                  price: controller.totalPrice.toString(),
                  onTap: () {
                    controller.goToDeliverLocation();
                  }),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) => CustomCartItem(
                    itemsModel: CartItemModel.fromJson(controller.items[index]),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
