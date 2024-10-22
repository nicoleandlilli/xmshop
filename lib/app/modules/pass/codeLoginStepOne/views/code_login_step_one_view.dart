import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/pass/codeLoginStepOne/controllers/code_login_step_one_controller.dart';

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

          PassTextFiled(
              hintText: "密码",
              onChanged: (value) {
                print(value);
              }),
          //用户协议
          const UserAgreement(),
          //登录按钮
          PassButton(text: "获取验证码", onPressed: (){
            print("获取验证码");
          })

        ],
      ),
    );
  }

}