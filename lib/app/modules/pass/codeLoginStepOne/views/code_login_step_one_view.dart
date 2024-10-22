import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/pass/codeLoginStepOne/controllers/code_login_step_one_controller.dart';

import '../../../../services/kee_alive_wrapper.dart';

class CodeLoginStepOneView extends GetView<CodeLoginStepOneController>{
  const CodeLoginStepOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const KeepAliveWrapper(
        child: Scaffold(
          body: Center(
            child:  Text("GiveView"),
          ),
        )
    );
  }

}