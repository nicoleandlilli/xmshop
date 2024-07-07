import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxBool flag=false.obs;

  final ScrollController scrollController = ScrollController();

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