import 'package:ecommerceapp/core/constant/apptheme.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLanguage(String lang) {
    // ignore: unused_local_variable
    Locale locale = Locale(lang);
    appTheme = lang == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    myServices.sharedPreferences.setString('lang', lang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String sharedLanguage =
        myServices.sharedPreferences.getString('lang') ?? '';
    if (sharedLanguage == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
    } else if (sharedLanguage == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
