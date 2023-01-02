import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 22,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: ColorApp.black,
      ),
      bodyText1: TextStyle(
        height: 2,
        color: ColorApp.grey,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        height: 2,
        color: ColorApp.grey,
        fontSize: 14,
      ),
    ));

ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 22,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: ColorApp.black,
      ),
      bodyText1: TextStyle(
        height: 2,
        color: ColorApp.grey,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        height: 2,
        color: ColorApp.grey,
        fontSize: 14,
      ),
    ));
