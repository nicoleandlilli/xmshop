import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmeshop/app/services/http_client.dart';

import '../../../routes/app_routes.dart';
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
          child: Obx(()=>_buildLeftCategory()),
        ),
        _buildRightCategory(),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(

      title: InkWell(
        child: AnimatedContainer(
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
              const Padding(padding: EdgeInsets.fromLTRB(10, 0, 4, 0), child: Icon(Icons.search,color:Colors.black54,),),
              Text("手机",style: TextStyle(color: Colors.black54, fontSize: ScreenAdapter.fontSize(32)),),
            ],
          ),
        ),
        onTap: (){
          Get.toNamed(Paths.SEARCH);
        },
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

  Widget _buildRightCategory(){
    return Expanded(child: Container(
      color:Colors.white,
      height: double.infinity,
      child: Obx(()=>GridView.builder(
        itemCount: controller.rightCategoryList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: ScreenAdapter.width(40),
            mainAxisSpacing: ScreenAdapter.height(40),
            childAspectRatio: 240/340
        ),
        itemBuilder: ((context, index){
          return InkWell(
            onTap: (){
              Get.toNamed("/product-list",
                arguments: {"cid": controller.rightCategoryList[index].id});
            },
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Image.network(HttpsClient.replaceUri(controller.rightCategoryList[index].pic),fit: BoxFit.fitHeight,),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(10), 0, 0),
                  child: Text(controller.rightCategoryList[index].title,style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),),
                ),
              ],
            ),
          );
        }),
      )),
    ),);
  }

  Widget _buildLeftCategory(){
    return ListView.builder(
      itemCount:  controller.leftCategoryList.length,
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
                  child: Text(controller.leftCategoryList[index].title,
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(36),
                      fontWeight: controller.selectIndex.value==index?FontWeight.bold:FontWeight.normal),),
                  // child: Text("第$index个${}"),
                ),


              ],
            ),
          )),
        );
      },
    );
  }

}