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
  String sort = "";
  RxBool hasData = true.obs;
  RxList<PListModelItem> pList=<PListModelItem> [].obs;   //注意，需要定义成响应式数据
  HttpClient httpClient = HttpClient();
  ScrollController scrollController=ScrollController();
  GlobalKey<ScaffoldState> scaffoldGlobalKey=GlobalKey<ScaffoldState>();

  /*二级导航数据*/
  List subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":
      -1, // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];

  //二级导航选中判断
  RxInt selectHeaderId = 1.obs;
  //主要解决的问题是排序箭头无法更新
  RxInt subHeaderListSort=0.obs;


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

  //二级导航改变的时候触发的方法
  void subHeaderChange(id) {
    if (id == 4) {
      selectHeaderId.value = id;
      scaffoldGlobalKey.currentState!.openEndDrawer();
      //弹出侧边栏
    } else {
      selectHeaderId.value = id;

      //改变排序  sort=price_-1     sort=price_1
      sort =
      "${subHeaderList[id - 1]["fileds"]}_${subHeaderList[id - 1]["sort"]}";
      //改变状态
      subHeaderList[id - 1]["sort"]=subHeaderList[id - 1]["sort"]*-1;
      // //作用更新状态
      subHeaderListSort.value=subHeaderList[id - 1]["sort"];
      //重置page
      page = 1;
      //重置数据
      pList.value = [];
      //重置hasData
      hasData.value = true;
      //滚动条回到顶部
      scrollController.jumpTo(0);
      //重新请求接口
      getPListData();
    }
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
            .arguments["cid"]}&page=$page&pageSize=$pageSize&sort=$sort");
        if (kDebugMode) {
          print(
              "................................................................................../api/plist?cid=${Get
                  .arguments["cid"]}&page=$page&pageSize=$pageSize&sort=$sort");
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