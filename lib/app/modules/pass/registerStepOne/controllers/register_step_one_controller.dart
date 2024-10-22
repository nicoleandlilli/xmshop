import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../services/http_client.dart';

class RegisterStepOneController extends GetxController {
  TextEditingController editingController=TextEditingController();
  HttpsClient httpsClient = HttpsClient();

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

  //发送验证码
  Future<bool> sendCode() async{
    var response = await httpsClient.post("/api/sendCode",data:{
      "tel":editingController.text
    });
    if (response != null) {
      if (kDebugMode) {
        print(response);
      }
      if(response.data["success"]){
        //测试：把验证码复制到剪切板上面，正式上线不需要这句话,这个为了方便测试
        Clipboard.setData(ClipboardData(text: response.data["code"]));
        return true;
      }
      return false;
    }else{
      return false;
    }
  }

}
