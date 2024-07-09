import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/models/focus_model.dart';

class HomeController extends GetxController{
  //浮动导航开关
  RxBool flag=false.obs;
  //ScrollController
  final ScrollController scrollController = ScrollController();

  RxList<FocusModelItem> swiperList=<FocusModelItem> [].obs;   //注意，需要定义成响应式数据

  @override
  void onInit() {
    super.onInit();
    addScrollControllerListener();
    getFocusData();
  }

  void addScrollControllerListener() {
    return scrollController.addListener(() {
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

  getFocusData() async{
    try {
      var response = await Dio().get("https://miapp.itying.com/api/focus");
      print(response);
      // swiperList.value = response.data["result"];
      var focus = FocusModel.fromJson(response.data);
      swiperList.value = focus.result;
      update();
    }catch(e){
      print("home controller exception.................$e");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}