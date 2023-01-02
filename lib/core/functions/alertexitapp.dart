import 'dart:io';

import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Alarm",
      middleText: "Are you sure to exit app?",
      actions: [
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: ColorApp.primaryColor),
          onPressed: () {
            exit(0);
          },
          child: const Text("Confirm"),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.primaryColor),
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel")),
      ]);
  return Future.value(true);
}
