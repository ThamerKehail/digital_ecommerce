import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/alertexitapp.dart';
import '../widgets/customappbar.dart';
import '../widgets/home/customcardhome.dart';
import '../widgets/home/customofferitem.dart';
import '../widgets/home/customtitlehome.dart';
import '../widgets/home/cutomitemhome.dart';
import '../widgets/home/listcategory.dart';
import '../widgets/home/product_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      controller.items.forEach((element) {});
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppbar(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: ProductSearch(controller.items));
                  },
                  titleAppBar: "Find Product",
                  onPressedSearch: () {
                    // controller.goToSearch();
                  },
                  onPressedSearch2: (v) {
                    controller.goToSearch(v);
                  },
                ),
                CustomCardHome(
                  title: 'A summer Surprise',
                  subTitle: 'Cashback 20%',
                  lang: controller.lang,
                ),
                const CustomTitleHome(title: 'Categories'),
                const ListCategory(),
                const CustomTitleHome(title: 'Product For You'),
                const CustomItemHome(),
                const CustomTitleHome(title: 'Offers'),
                const CustomOffersItemHome(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
