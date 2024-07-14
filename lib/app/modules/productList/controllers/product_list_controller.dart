import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/services/http_client.dart';

import '../../../models/plist_model.dart';

class ProductListController extends GetxController{

  RxInt page= 1.obs;
  int pageSize = 8;
  RxList<PListModelItem> pList=<PListModelItem> [].obs;   //注意，需要定义成响应式数据
  HttpClient httpClient = HttpClient();

  @override
  void onInit() {
    super.onInit();
    // print("get arguments............."+Get.arguments);
    getPListData();
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
      var response = await httpClient.get("/api/plist?cid=${Get.arguments["cid"]}&page=${page.value}&pageSize=$pageSize");
      // var response = await httpClient.get("/api/plist");
      if(response!=null) {
        var temp = PListModel.fromJson(response.data);
        pList.value = temp.result;
        update();
      }
    }catch(e){
      if (kDebugMode) {
        print("home controller exception.................$e");
      }
    }
  }

}