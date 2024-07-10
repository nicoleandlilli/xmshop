import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/models/category_model.dart';
import 'package:xmeshop/app/models/focus_model.dart';
import 'package:xmeshop/app/models/plist_model.dart';
///自动生成对象的类：

/// https://autocode.icu/jsontodart
class HomeController extends GetxController{
  //浮动导航开关
  RxBool flag=false.obs;
  //ScrollController
  final ScrollController scrollController = ScrollController();

  RxList<FocusModelItem> swiperList=<FocusModelItem> [].obs;   //注意，需要定义成响应式数据
  RxList<CategoryModelItem> categoryList=<CategoryModelItem> [].obs;   //注意，需要定义成响应式数据
  RxList<FocusModelItem> bestSellingSwiperList=<FocusModelItem> [].obs;   //注意，需要定义成响应式数据
  RxList<PListModelItem> bestSellingPList=<PListModelItem> [].obs;   //注意，需要定义成响应式数据
  RxList<PListModelItem> popularProductList=<PListModelItem> [].obs;   //注意，需要定义成响应式数据

  @override
  void onInit() {
    super.onInit();
    addScrollControllerListener();
    getFocusData();
    getCategoryData();
    getBestSellingData();
    getBestSellingPlistData();
    getPopularProductListData();
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

  ///获取热销甄选下的热门商品
  getPopularProductListData() async{
    try {
      var response = await Dio().get("https://miapp.itying.com/api/plist?is_best=1");
      // var response = await Dio().get("https://miapp.itying.com/api/plist");
      print(response);
      // swiperList.value = response.data["result"];
      var focus = PListModel.fromJson(response.data);
      popularProductList.value = focus.result;
      update();
    }catch(e){
      print("home controller exception.................$e");
    }
  }


  ///获取热销甄选右侧的商品数据
  getBestSellingPlistData() async{
    try {
      var response = await Dio().get("https://miapp.itying.com/api/plist?is_hot=1\$pageSize=3");
      // var response = await Dio().get("https://miapp.itying.com/api/plist");
      print(response);
      // swiperList.value = response.data["result"];
      var focus = PListModel.fromJson(response.data);
      bestSellingPList.value = focus.result;
      update();
    }catch(e){
      print("home controller exception.................$e");
    }
  }


  ///获取热销甄选的轮播图
  getBestSellingData() async{
    try {
      var response = await Dio().get("https://miapp.itying.com/api/focus?position=2");
      print(response);
      // swiperList.value = response.data["result"];
      var focus = FocusModel.fromJson(response.data);
      bestSellingSwiperList.value = focus.result;
      update();
    }catch(e){
      print("home controller exception.................$e");
    }
  }


  ///获取分类广告轮播图中的数据
  getCategoryData() async{
    try {
      var response = await Dio().get("https://miapp.itying.com/api/bestCate");
      print(response);
      var categories = CategoryModel.fromJson(response.data);
      categoryList.value = categories.result;
      update();
    }catch(e){
      print("home controller exception.................$e");
    }
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