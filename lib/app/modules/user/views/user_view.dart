import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/services/screenAdapter.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
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
          body: ListView(
            padding: EdgeInsets.all(ScreenAdapter.height(20)),
            children: [
              //用户头像  登录注册
              Container(
                child: Row(
                  children: [
                    SizedBox(width: ScreenAdapter.width(40),),
                    SizedBox(
                      height: ScreenAdapter.height(150),
                      width: ScreenAdapter.width(150),
                      child: CircleAvatar(
                        radius: ScreenAdapter.width(75),
                        backgroundImage: const AssetImage("assets/images/user.png"),
                      ),
                    ),
                    SizedBox(width: ScreenAdapter.width(40),),
                    Text("登录/注册", style: TextStyle(fontSize: ScreenAdapter.fontSize(46)),),
                    SizedBox(width: ScreenAdapter.width(40),),
                    Icon(Icons.arrow_forward_ios, size: ScreenAdapter.fontSize(34),color: Colors.black54,),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

}