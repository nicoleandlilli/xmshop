import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  //浮动导航开关
  RxBool flag=false.obs;
  //ScrollController
  final ScrollController scrollController = ScrollController();

  List swiperList=[
    {
      "url":"https://www.itying.com/images/focus/focus01.png"
    },
    {
      "url":"https://www.itying.com/images/focus/focus02.png"
    }
  ];

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if(scrollController.position.pixels>10){
        if(!flag.value) {
          flag.value = true;
          update();
          print("scrollController.position.pixels>10........................");
        }
      }

      if(scrollController.position.pixels<10){
        if(flag.value) {
          flag.value = false;
          update();
          print("scrollController.position.pixels<10...............");
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}