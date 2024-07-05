import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:xmeshop/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(1080, 2400),//设计稿的宽度和高度px
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context , child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    ),

  );
}
