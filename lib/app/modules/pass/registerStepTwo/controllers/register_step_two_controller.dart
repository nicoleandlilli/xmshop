import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/services/http_client.dart';

class RegisterStepTwoController extends GetxController {
  final TextEditingController editingController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  String tel = Get.arguments["tel"];
  RxInt seconds = 10.obs;
  @override
  void onInit() {
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

  //验证验证码
  Future<bool> validateCode() async {
    var response = await httpsClient.post("/api/validateCode", data: {
      "tel": tel, //上一个页面穿过来的手机号
      "code": editingController.text
    });
    if (response != null) {
      if (response.data["success"]) {
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

}


