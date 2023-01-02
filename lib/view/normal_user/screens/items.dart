import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/favorite_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../widgets/customappbar.dart';
import '../widgets/items/customlistsitems.dart';
import '../widgets/items/listitemcategories.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomAppbar(
                    titleAppBar: 'Find Product',
                    onPressed: () {},
                    onPressedSearch: () {}),
                const ListItemCategory(),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.items.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.63),
                        itemBuilder: (context, index) {
                          controllerFav.isFavorite[controller.items[index]
                                      ['item_id']
                                  .toString()] =
                              controller.items[index]['favorite'].toString();
                          print(controllerFav.isFavorite);
                          return CustomListItems(
                            items: ItemsModel.fromJson(controller.items[index]),
                          );
                        }))
              ],
            ),
          );
        },
      ),
    );
  }
}
