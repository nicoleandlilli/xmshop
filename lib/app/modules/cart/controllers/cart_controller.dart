import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../services/cardServices.dart';

class CartController extends GetxController{

  RxList cartList=[].obs;

  @override
  void onInit() {
    if (kDebugMode) {
      print("cart init");
    }
    super.onInit();
    getCartListData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCartListData() async {
    var tempList =await CardServices.getCartList();
    cartList.value=tempList;
    update();
  }
}