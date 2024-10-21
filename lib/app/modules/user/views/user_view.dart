import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../services/kee_alive_wrapper.dart';

class UserView extends GetView{
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            actions: [
              Row(
                children: [
                  const Text("会员码"),
                  IconButton(onPressed: (){

                  }, icon: const Icon(Icons.qr_code_outlined)),

                  IconButton(onPressed: (){

                  }, icon: const Icon(Icons.settings_outlined)),

                  IconButton(onPressed: (){

                  }, icon: const Icon(Icons.message_outlined)),
                ],
              ),
            ],
          ),
          body: const Center(
            child:  Text("UserView"),
          ),
        )
    );
  }

}