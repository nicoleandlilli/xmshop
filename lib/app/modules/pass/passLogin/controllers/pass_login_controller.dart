import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../models/message.dart';
import '../../../../services/http_client.dart';
import '../../../../services/storage.dart';

class PassLoginController extends GetxController {
  TextEditingController telController=TextEditingController();
  TextEditingController passController=TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<MessageModel> doLogin() async{
    var response = await httpsClient.post("/api/doLogin",data:{
      "username":telController.text,
      "password":passController.text,
    });
    if (response != null) {
      if (kDebugMode) {
        print(response);
      }
      if(response.data["success"]){
        //保存用户信息
        Storage.setData("userinfo",response.data["userinfo"]);
        return MessageModel(message: "登录成功", success: true);
      }
      return MessageModel(message: response.data["message"], success: false);
    }else{
      return MessageModel(message:"网络异常", success: false);
    }
  }
}
