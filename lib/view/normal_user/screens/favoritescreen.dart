import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/itemsmodel.dart';
import '../widgets/customappbar.dart';
import '../widgets/favorite/customfavoriteitemcard.dart';
import '../widgets/favorite/cutomtexttitlefavorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppbar(
                titleAppBar: 'Find Product',
                onPressed: () {},
                onPressedSearch: () {}),
            const CustomFavoriteTextTitle(title: "My Favorites"),
            GetBuilder<FavoriteController>(builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.63),
                      itemBuilder: (context, index) {
                        return CustomFavoriteItemCard(
                          items: ItemsModel.fromJson(controller.items[index]),
                        );
                      }));
            }),
          ],
        ),
      ),
    );
  }
}
