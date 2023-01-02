import 'package:ecommerceapp/controller/mainhomescreencontroller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/home/custombottomappbarhome.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeScreenControllerImp());
    return GetBuilder<MainHomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: controller.currentPage == 4
              ? ColorApp.primaryColor
              : ColorApp.thirdColor,
          onPressed: () {
            controller.changePage(4);
          },
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppbarHome(),
        body: controller.listPage.elementAt(controller.currentPage),
      );
    });
  }
}
