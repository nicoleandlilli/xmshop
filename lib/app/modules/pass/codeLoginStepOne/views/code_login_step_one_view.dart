import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/pass/codeLoginStepOne/controllers/code_login_step_one_controller.dart';

import '../../../../models/message.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/kee_alive_wrapper.dart';
import '../../../../services/screenAdapter.dart';
import '../../../../widget/logo.dart';
import '../../../../widget/passButton.dart';
import '../../../../widget/passTextField.dart';
import '../../../../widget/userAgreement.dart';

class CodeLoginStepOneView extends GetView<CodeLoginStepOneController>{
  const CodeLoginStepOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [TextButton(onPressed: () {}, child: Text("帮助"))],),

      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          //logo
          const Logo(),

          //输入手机号
          PassTextFiled(
              controller: controller.telController,
              hintText: "请输入手机号",
              onChanged: (value) {
                print(value);
              }),


          //用户协议
          const UserAgreement(),


          //登录按钮
          PassButton(text: "获取验证码", onPressed: () async{
            if (kDebugMode) {
              print("获取验证码");
            }
            if (!GetUtils.isPhoneNumber(controller.telController.text) ||
                controller.telController.text.length != 11) {
              Get.snackbar("提示信息!", "手机号格式不合法");
            }else{
              MessageModel result=await controller.sendCode();
              if(result.success){
                Get.toNamed(Paths.CODE_LOGIN_STEP_TWO,arguments: {
                  "tel":controller.telController.text
                });
              }else{
                Get.snackbar("提示信息!", result.message);
              }
            }
          }),

          SizedBox(height: ScreenAdapter.height(40)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                Get.toNamed(Paths.REGISTER_STEP_ONE);
              }, child: const Text("新用户注册")),
              TextButton(onPressed: (){
                Get.toNamed("/pass-login");
              }, child: const Text("账户密码登录"))
            ],
          ),

        ],
      ),
    );
  }

}