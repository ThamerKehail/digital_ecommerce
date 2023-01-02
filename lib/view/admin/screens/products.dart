import 'package:ecommerceapp/controller/admin/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/categoriesmodel.dart';
import '../widget/products/admincategorieslistcard.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primaryColor,
        elevation: 0.0,
        title: const Text("Home"),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
          child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                    color: ColorApp.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
              ),
              Positioned(
                top: 30,
                left: Get.width / 12,
                right: Get.width / 12,
                child: Container(
                  width: Get.width / .8,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 8), // Shadow position
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '15',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const Text(
                              "Total Items",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '150 ',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const Text(
                              "Total Price(JD)",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          GetBuilder<ProductsControllerImp>(builder: (controller) {
            return SizedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AdminCategoriesListCard(
                    categories:
                        CategoriesModel.fromJson(controller.categories[index]),
                    i: index,
                  );
                },
                itemCount: controller.categories.length,
              ),
            );
          }),
        ],
      )),
    );
  }
}
