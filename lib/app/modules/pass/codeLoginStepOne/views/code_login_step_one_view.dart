import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/pass/codeLoginStepOne/controllers/code_login_step_one_controller.dart';

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
              hintText: "请输入手机号",
              onChanged: (value) {
                print(value);
              }),


          //用户协议
          const UserAgreement(),


          //登录按钮
          PassButton(text: "获取验证码", onPressed: (){
            if (kDebugMode) {
              print("获取验证码");
            }
            Get.toNamed(Paths.CODE_LOGIN_STEP_TWO);
          }),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){

              }, child: const Text("忘记密码")),
              TextButton(onPressed: (){
                Get.toNamed(Paths.PASS_LOGIN);
              }, child: const Text("其他登录方式"))
            ],
          ),

        ],
      ),
    );
  }

}