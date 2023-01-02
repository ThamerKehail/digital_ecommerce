import 'package:ecommerceapp/controller/profile/profile_controller.dart';
import 'package:ecommerceapp/core/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/routes.dart';
import '../../widgets/profile/customappbar.dart';
import '../../widgets/profile/customprofilecard.dart';
import '../../widgets/profile/customprofileimage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = Get.put(ProfileControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomProfileAppbar(
              title: "Profile",
              onTap: () {},
            ),
            CustomProfileImage(
              img: NetworkImage("${AppLinks.profileImage}/${controller.image}"),
              onTap: () {},
            ),
            Center(
                child: Text(
              controller.username ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
            Center(child: Text(controller.email ?? "")),
            const SizedBox(
              height: 30,
            ),
            ...List.generate(
                controller.profileList.length,
                (index) => CustomProfileCard(
                      icon: controller.profileList[index]['icon'],
                      name: controller.profileList[index]['name'],
                      onTap: () {
                        if (index == 0) {
                          Get.toNamed(AppRoutes.myAccount);
                        }
                        if (index == 4) {
                          controller.logout();
                        }
                        if (index == 2) {
                          controller.goToOrderHistory();
                        }
                      },
                    ))
          ],
        ),
      ),
    );
  }
}
