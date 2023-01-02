import 'package:ecommerceapp/controller/orderhistory_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/orderhistory/orderhistorycard.dart';

class OrderHistory extends GetView<OrderHistoryControllerImp> {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Center(
              child: Text("Order History",
                  style: Theme.of(context).textTheme.headline1),
            ),
            GetBuilder<OrderHistoryControllerImp>(builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.items.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OrderHistoryCard(
                        cartItemModel:
                            ItemsModel.fromJson(controller.items[index]),
                      );
                    }),
              );
            })
          ],
        ),
      ),
    );
  }
}
