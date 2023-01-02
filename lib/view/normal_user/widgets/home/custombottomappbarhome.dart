import 'package:ecommerceapp/controller/mainhomescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custombottomappbar.dart';

class CustomBottomAppbarHome extends StatelessWidget {
  const CustomBottomAppbarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainHomeScreenControllerImp>(builder: (controller) {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.titleIcon.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomBottomAppbar(
                      title: controller.titleIcon[i],
                      icons: controller.iconBottom[i],
                      icons2: controller.iconBottomOutlined[i],
                      onTap: () {
                        controller.changePage(i);
                      },
                      active: controller.currentPage == i ? true : false,
                    );
            }),
          ],
        ),
      );
    });
  }
}
