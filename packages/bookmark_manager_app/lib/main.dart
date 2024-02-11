import 'package:bookmark_manager/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: InitialBinding(),
      title: "Application",
      initialRoute: AppPages.INITIAL(),
      getPages: AppPages.routes,
    ),
  );
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(), permanent: true);
  }
}
