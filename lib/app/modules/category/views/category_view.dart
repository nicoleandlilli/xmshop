import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/category/controllers/category_controller.dart';

import '../../../services/kee_alive_wrapper.dart';
import 'package:xmeshop/app/services/screenAdapter.dart';

class CategoryView extends GetView<CategoryController>{
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  KeepAliveWrapper(
        child: Scaffold(
          appBar: AppBar(
            title:  AnimatedContainer(
              width: ScreenAdapter.width(840),
              height: ScreenAdapter.height(96),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 246, 246, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              duration: const Duration(milliseconds: 300),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(10, 0, 4, 0), child: Icon(Icons.search),),
                  Text("手机",style: TextStyle(color: Colors.black54, fontSize: ScreenAdapter.fontSize(32)),),
                ],
              ),
            ),
            actions: [
              IconButton(
                  onPressed: (){

                  },
                  icon: const Icon(Icons.message_outlined, color: Colors.black45,)),

            ],// 部阴影
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Center(
            child:  Text("CategoryView"),
          ),
        )
    );

  }

}