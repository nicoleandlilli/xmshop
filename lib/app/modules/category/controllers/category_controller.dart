import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:xmeshop/app/models/category_model.dart';

class CategoryController extends GetxController{

  RxInt selectIndex = 0.obs;
  RxList<CategoryModelItem> leftCategoryList = <CategoryModelItem>[].obs;
  RxList<CategoryModelItem> rightCategoryList = <CategoryModelItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(index){
    selectIndex.value=index;
    getRightCategoryData(leftCategoryList[selectIndex.value].id);
    update();
  }

  ///获取分类界面分类广告左侧的分类
  getLeftCategoryData() async{
    try {
      var response = await Dio().get("https://miapp.itying.com/api/pcate");
      if (kDebugMode) {
        print(response);
      }
      var categories = CategoryModel.fromJson(response.data);
      leftCategoryList.value = categories.result;
      getRightCategoryData(leftCategoryList[0].id);
      update();
    }catch(e){
      if (kDebugMode) {
        print("category controller exception.................$e");
      }
    }
  }

  ///获取分类界面分类广告右侧的分类
  getRightCategoryData(String pid) async{
    try {
      var response = await Dio().get("https://miapp.itying.com/api/pcate?pid=$pid");
      print(response);
      var categories = CategoryModel.fromJson(response.data);
      rightCategoryList.value = categories.result;
      update();
    }catch(e){
      if (kDebugMode) {
        print("category controller exception.................$e");
      }
    }
  }

}