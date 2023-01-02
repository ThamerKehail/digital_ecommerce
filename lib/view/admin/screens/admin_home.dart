import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/admin_home_controller.dart';

class AdminHomeScreen extends GetView<AdminHomeControllerImp> {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primaryColor,
        elevation: 0.0,
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.shutterstock.com/mosaic_250/2780032/1194497215/stock-photo-portrait-of-smiling-african-american-student-looking-at-camera-sitting-in-caf-black-millennial-1194497215.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Container(
          padding: const EdgeInsets.all(15),
          color: ColorApp.primaryColor,
          child: ListView(
            children: [
              const Text(
                "Welcome Thamer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.homeCard.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: controller.homeCard[index]['onPress'],
                      child: Container(
                        width: 85,
                        decoration: BoxDecoration(
                          color: const Color(0xff7576d1).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                controller.homeCard[index]['icon'],
                                color: Colors.white,
                                size: 40,
                              ),
                              Text(
                                "${controller.homeCard[index]['title']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          )),
    );
  }
}
