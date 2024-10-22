import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../models/message.dart';
import '../../../../services/http_client.dart';
import '../../../../services/storage.dart';

class RegisterStepThreeController extends GetxController {
  TextEditingController passController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  String code=Get.arguments["code"];
  String tel=Get.arguments["tel"];

  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onClose() {
    super.onClose();
  }
  //执行注册
  Future<MessageModel> doRegister() async{
    var response = await httpsClient.post("/api/register",data:{
      "tel":tel,
      "password":passController.text,
      "code":code
    });
    if (response != null) {
      if (kDebugMode) {
        print(response);
      }
      if(response.data["success"]){
        //执行登录 保存用户信息
        Storage.setData("userinfo",response.data["userinfo"]);
        return MessageModel(message: "注册成功", success: true);
      }

      return MessageModel(message: response.data["message"], success: false);
    }else{
      return MessageModel(message: "网络异常", success: false);
    }
  }
}
