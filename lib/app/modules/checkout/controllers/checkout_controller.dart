import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../services/http_client.dart';
import '../../../services/signServices.dart';
import '../../../services/storage.dart';
import '../../../services/userServices.dart';

class CheckoutController extends GetxController {
  RxList checkoutList = [].obs;
  HttpsClient httpsClient = HttpsClient();
  RxList<AddressItemModel> addressList=<AddressItemModel>[].obs;

  @override
  void onInit() {
    getCheckoutData();
    getDefaultAddress();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCheckoutData() async {
    List tempList = await Storage.getData("checkoutList");
    checkoutList.value = tempList;
    update();
  }

  getDefaultAddress() async {
    List userList = await UserServices.getUserInfo();
    UserModel userInfo = UserModel.fromJson(userList[0]);

    Map tempJson = {"uid": userInfo.sId};
    String sign = SignServices.getSign({
      ...tempJson,
      "salt": userInfo.salt //私钥
    });
    var response =
    await httpsClient.get("/api/oneAddressList?uid=${userInfo.sId}&sign=$sign");
    if (kDebugMode) {
      print(response);
    }

    if(response!=null){
      var tempAddressList= AddressModel.fromJson(response.data);
      addressList.value=tempAddressList.result!;
      update();
    }
  }
}
