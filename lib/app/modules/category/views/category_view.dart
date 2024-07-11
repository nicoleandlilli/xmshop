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
          appBar: _buildAppBar(),
          body: _buildBody(),
        )
    );

  }

  Widget _buildBody() {
    return Row(
      children: [
        SizedBox(
          width: ScreenAdapter.width(280),
          height: double.infinity,
          child: ListView.builder(
            itemCount: 20,
              itemBuilder: (context, index){
                return SizedBox(
                  width: double.infinity,
                  height: ScreenAdapter.height(180),
                  child: Obx(()=>InkWell(
                    onTap: (){
                      controller.changeIndex(index);
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:Container(
                            width: ScreenAdapter.width(10),
                            height: ScreenAdapter.height(46),
                            color: controller.selectIndex.value==index?Colors.red:Colors.white,
                          ),
                        ),
                        Center(
                          child: Text("第$index个"),
                        ),


                      ],
                    ),
                  )),
                );
              },
          ),
        ),
        Expanded(child: SizedBox(
          height: double.infinity,
          child: GridView.builder(
            itemCount: 35,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: ScreenAdapter.width(40),
              mainAxisSpacing: ScreenAdapter.height(40),
              childAspectRatio: 240/340
            ),
            itemBuilder: ((context, index){
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Image.network("https://xiaomi.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png",fit: BoxFit.fitHeight,),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(10), 0, 0),
                  child: Text("手机",style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),),
                  ),
                ],
              );
            }),
          ),
        ),),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
        );
  }

}