import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/services/http_client.dart';

class RegisterStepTwoController extends GetxController {
  final TextEditingController editingController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  // String tel = Get.arguments["tel"];
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

}


