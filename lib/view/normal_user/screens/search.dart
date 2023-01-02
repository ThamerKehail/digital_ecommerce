import 'package:ecommerceapp/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../data/model/itemsmodel.dart';
import '../widgets/customappbar.dart';
import '../widgets/items/customlistsitems.dart';

class SearchScreen extends GetView<SearchControllerImp> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SearchControllerImp>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppbar(
              titleAppBar: "Find Your Product",
              onPressed: () {},
              onPressedSearch: () {},
              onPressedSearch2: (v) {
                controller.getItem(v);

                print(v);
              },
              controller: controller.text,
            ),
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
                      return CustomListItems(
                        items: ItemsModel.fromJson(controller.items[index]),
                      );
                    }))
          ],
        ),
      );
    }));
  }
}
