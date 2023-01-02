import 'package:ecommerceapp/core/localization/changelocal.dart';
import 'package:ecommerceapp/core/localization/translation.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initialbindings.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: myTranslation(),
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
