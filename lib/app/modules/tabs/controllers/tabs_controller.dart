import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/cart/views/cart_view.dart';
import 'package:xmeshop/app/modules/category/views/category_view.dart';
import 'package:xmeshop/app/modules/give/views/give_view.dart';
import 'package:xmeshop/app/modules/home/views/home_view.dart';
import 'package:xmeshop/app/modules/user/views/user_view.dart';

class TabsController extends GetxController{

  //用于控制默认加载的tabs选项
  RxInt currentIndex = 0.obs;
  PageController pageController=Get.arguments!=null?PageController(initialPage:Get.arguments["initialPage"]): PageController(initialPage:0);

  final List<Widget> pages= [
    const HomeView(),
    const CategoryView(),
    const GiveView(),
    CartView(),
    const UserView(),
  ];

  @override
  void onInit() {
    if(Get.arguments!=null){
      currentIndex.value=Get.arguments["initialPage"];
      update();
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndex(index){
    currentIndex.value=index;
    update();
  }

}