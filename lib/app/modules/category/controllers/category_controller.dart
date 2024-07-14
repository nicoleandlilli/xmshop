import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/models/category_model.dart';
import 'package:xmeshop/app/services/http_client.dart';

class CategoryController extends GetxController{

  RxInt selectIndex = 0.obs;
  RxList<CategoryModelItem> leftCategoryList = <CategoryModelItem>[].obs;
  RxList<CategoryModelItem> rightCategoryList = <CategoryModelItem>[].obs;
  HttpClient httpClient = HttpClient();

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
      var response = await httpClient.get("/api/pcate");
     if(response!=null) {
       var categories = CategoryModel.fromJson(response.data);
       leftCategoryList.value = categories.result;
       getRightCategoryData(leftCategoryList[0].id);
       update();
     }
    }catch(e){
      if (kDebugMode) {
        print("category controller exception.................$e");
      }
    }
  }

  ///获取分类界面分类广告右侧的分类
  getRightCategoryData(String pid) async{
    try {
      var response = await httpClient.get("/api/pcate?pid=$pid");
      if(response!=null) {
        var categories = CategoryModel.fromJson(response.data);
        rightCategoryList.value = categories.result;
        update();
      }
    }catch(e){
      if (kDebugMode) {
        print("category controller exception.................$e");
      }
    }
  }

}