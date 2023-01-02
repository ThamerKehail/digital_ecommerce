import 'package:ecommerceapp/controller/cart/cart_controller.dart';
import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/auth/customtexttitle.dart';
import '../widgets/productdetails/customappbarproductdetails.dart';
import '../widgets/productdetails/custombottmnavbar.dart';
import '../widgets/productdetails/customcolorcard.dart';
import '../widgets/productdetails/cutombodytext.dart';
import '../widgets/productdetails/priceandcount.dart';

class ProductDetailsScreen extends GetView<ProductDetailsControllerImp> {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    CartControllerImp controllerCart = CartControllerImp();
    return Scaffold(
      bottomNavigationBar:
          GetBuilder<ProductDetailsControllerImp>(builder: (context) {
        return CustomBottomNavBar(
          itemId: controller.itemsModel.itemId.toString(),
          price: controller.itemsModel.itemPrice!.toDouble(),
          qty: context.qty,
        );
      }),
      body: ListView(
        children: [
          CustomAppbarProductDetails(
            itemsModel: controller.itemsModel,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextTitle(title: "${controller.itemsModel.itemName}"),
                GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
                  return PriceAndCount(
                      price:
                          '${controller.itemsModel.itemPrice! * controller.qty}',
                      add: () {
                        controller.increaseQty();
                      },
                      q: controller.qty.toString(),
                      remove: () {
                        controller.decreaseQty();
                      });
                }),
                CustomBodyText(
                  body: "${controller.itemsModel.itemDesc}",
                ),
                const CustomTextTitle(title: "Color"),
                GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
                  return Row(
                    children: [
                      ...List.generate(
                        controller.productColors.length,
                        (index) => CustomColorCard(
                          color: controller.productColors[index]['name'],
                          active: controller.productColors[index]['active'],
                          onTap: () {
                            controller.chooseColor(index);
                          },
                        ),
                      ),
                    ],
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
