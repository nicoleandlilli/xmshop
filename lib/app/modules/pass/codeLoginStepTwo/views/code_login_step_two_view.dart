import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/code_login_step_two_controller.dart';

class CodeLoginStepTwoView extends GetView<CodeLoginStepTwoController> {
  const CodeLoginStepTwoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('手机号快速登录'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CodeLoginStepTwoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
