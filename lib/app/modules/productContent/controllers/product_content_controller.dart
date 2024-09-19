import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:xmeshop/app/services/http_client.dart';

import '../../../models/pcontent_model.dart';

class ProductContentController extends GetxController{

  final ScrollController scrollController = ScrollController();
  HttpClient httpClient = HttpClient();
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();
  //导航的透明度
  RxDouble opcity=0.0.obs;
  //是否显示tabs
  RxBool showTabs=false.obs;

  //详情数据
  var pcontent=PcontentItemModel().obs;
  //attr
  RxList<PcontentAttrModel> pcontentAttr = <PcontentAttrModel>[].obs;

  List tabsList=[
    {
      "id":1,
      "title":"商品",
    },
    { "id":2,
      "title":"详情"
    },
    {
      "id":3,
      "title":"推荐"
    }
  ];
  RxInt selectedTabsIndex=1.obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    getContentData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

//监听滚动条滚动事件
  void scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels <= 100) {
        opcity.value=scrollController.position.pixels/100;
        if(showTabs.value==true){
          showTabs.value=false;
        }
        update();
      } else{
        if(showTabs.value==false){
          showTabs.value=true;
          update();
        }
      }
    });
  }

  void changeSelectedTabsIndex(index){
    selectedTabsIndex.value=index;
    update();
  }

//获取详情数据
  getContentData() async {
    var response =
    await httpClient.get("/api/pcontent?id=${Get.arguments["id"]}");
    if (response != null) {
      if (kDebugMode) {
        print(response.data);
      }
      var tempData = PcontentModel.fromJson(response.data);
      pcontent.value = tempData.result!;
      pcontentAttr.value = pcontent.value.attr!;
      initAttr(pcontentAttr);
      update();
    }
  }

  //初始化attr
  initAttr(List<PcontentAttrModel> attr) {
    for (var i = 0; i < attr.length; i++) {
      for (var j = 0; j < attr[i].list!.length; j++) {
        if (j == 0) {
          attr[i].attrList!.add({"title": attr[i].list![j], "checked": true});
        } else {
          attr[i].attrList!.add({"title": attr[i].list![j], "checked": false});
        }
      }
    }
  }

  //cate  颜色    title 玫瑰红
  changeAttr(cate, title) {
    for (var i = 0; i < pcontentAttr.length; i++) {
      if (pcontentAttr[i].cate == cate) {
        for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
          pcontentAttr[i].attrList![j]["checked"] = false;
          if (pcontentAttr[i].attrList![j]["title"] == title) {
            pcontentAttr[i].attrList![j]["checked"] = true;
          }
        }
      }
    }
    update();
  }

/*
    [{cate: 颜色, list: [土豪金, 玫瑰红, 磨砂黑]}, {cate: 内存, list: [16G, 32G, 64G]}]


    [
      {
        cate: 颜色,
        list: [
          {
            title:土豪金,
            checked:true
          },
          {
            title:玫瑰红,
            checked:false
          },{
            title:磨砂黑,
            checked:false

          }
        ]
      },
      {cate: 内存,
      list: [
          {
             title:16G,
            checked:true
          },
           {
             title:32G,
            checked:false
          }
      ]}

    ]
  */

}