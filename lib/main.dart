import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmeshop/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  //配置透明的状态栏
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(
    ScreenUtilInit(
      designSize: const Size(1080, 2400),//设计稿的宽度和高度px
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Application",
          //配置主题
          theme: ThemeData(
            primarySwatch: Colors.grey
          ),
          initialRoute: AppPages.initial,
          //配置ios动画
          defaultTransition: Transition.rightToLeft,
          getPages: AppPages.routes,
        );
      },
    ),

  );
}
