import 'package:ecommerceapp/controller/orderhistory_controller.dart';
import 'package:ecommerceapp/core/constant/linkapi.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryCard extends GetView<OrderHistoryControllerImp> {
  final ItemsModel cartItemModel;
  const OrderHistoryCard({Key? key, required this.cartItemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(cartItemModel);
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                '${AppLinks.itemsImage}/${cartItemModel.itemImage}',
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
                      cartItemModel.itemName ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${cartItemModel.itemPrice} JD',
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
              Text(
                'Qty : ${cartItemModel.qty}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
