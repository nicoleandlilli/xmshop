import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/services/http_client.dart';

import '../../../models/plist_model.dart';

class ProductListController extends GetxController{

  int page= 1;
  int pageSize = 8;
  bool flag=true;
  RxBool hasData = true.obs;
  RxList<PListModelItem> pList=<PListModelItem> [].obs;   //注意，需要定义成响应式数据
  HttpClient httpClient = HttpClient();
  ScrollController scrollController=ScrollController();
  GlobalKey<ScaffoldState> scaffoldGlobalKey=GlobalKey<ScaffoldState>();


  @override
  void onInit() {
    super.onInit();
    getPListData();
    initScrollController();
  }

  //监听滚动条事件
  void initScrollController(){
    scrollController.addListener((){
      // scrollController.position.pixels     滚动条高度
      // scrollController.position.maxScrollExtent              页面高度

      if(scrollController.position.pixels>(scrollController.position.maxScrollExtent-20)){
        getPListData();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///获取热销甄选下的热门商品
  getPListData() async{
    try {
      if(flag&hasData.value) {
        flag=false;
        var response = await httpClient.get("/api/plist?cid=${Get
            .arguments["cid"]}&page=$page&pageSize=$pageSize");
        if (kDebugMode) {
          print(
              "................................................................................../api/plist?cid=${Get
                  .arguments["cid"]}&page=$page&pageSize=$pageSize");
        }
        if (response != null) {
          var temp = PListModel.fromJson(response.data);
          pList.addAll(temp.result);
          page++;
          update();
          if(temp.result!.length<pageSize){
            hasData.value=false;
          }
        }
        flag=true;

      }
    }catch(e){
      flag=true;
      if (kDebugMode) {
        print("home controller exception.................$e");
      }
    }
  }

}