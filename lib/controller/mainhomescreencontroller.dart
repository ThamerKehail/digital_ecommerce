import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/normal_user/screens/cart/cart.dart';
import '../view/normal_user/screens/favoritescreen.dart';
import '../view/normal_user/screens/home.dart';
import '../view/normal_user/screens/profile/profile.dart';

abstract class MainHomeScreenController extends GetxController {
  changePage(int index);
}

class MainHomeScreenControllerImp extends MainHomeScreenController {
  List<Widget> listPage = [
    const HomeScreen(),
    const Center(
      child: Text("Settings"),
    ),
    const FavoriteScreen(),
    const ProfileScreen(),
    const CartScreen(),
  ];
  int currentPage = 0;
  List titleIcon = [
    "Home",
    "Settings",
    "Favorite",
    "Profile",
  ];
  List iconBottom = [
    Icons.home,
    Icons.settings,
    Icons.favorite,
    Icons.person,
  ];
  List iconBottomOutlined = [
    Icons.home_outlined,
    Icons.settings_outlined,
    Icons.favorite_outline,
    Icons.person_outline,
  ];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
