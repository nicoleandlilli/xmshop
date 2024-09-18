import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductContentController extends GetxController{

  final ScrollController scrollController = ScrollController();

  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();
  //导航的透明度
  RxDouble opcity=0.0.obs;
  //是否显示tabs
  RxBool showTabs=false.obs;
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

}