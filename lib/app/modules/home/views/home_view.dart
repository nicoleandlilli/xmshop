import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmeshop/app/services/http_client.dart';
import 'package:xmeshop/app/services/kee_alive_wrapper.dart';
import 'package:xmeshop/app/services/ncFonts.dart';
import 'package:xmeshop/app/services/screenAdapter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

///请求转换对象地址： https://autocode.icu/jsontodart
class HomeView extends GetView<HomeController>{
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
          body: Stack(
            children: [
              _buildBody(),
              _buildAppBar(),
            ],),


        ),
    );
  }

  ///内容区域
  Widget _buildBody() {
    return Positioned(
      // top: -55,
      top: -60,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        // shrinkWrap: true,
        children: [
          _buildSwiperView(),
          _buildBanner(),
          _buildCategory(),
          _buildHotSellingBanner(),
          _buildBestSelling(),
          _buildBestGoods(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );

  }

  ///创建热销产品
  Widget _buildBestGoods(){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30), ScreenAdapter.height(40), ScreenAdapter.width(30), ScreenAdapter.height(20)),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("省心优惠", style: TextStyle(
                fontSize: ScreenAdapter.fontSize(46),
              ),),
              Text("全部优惠>", style: TextStyle(
                fontSize: ScreenAdapter.fontSize(38),
              ),),
            ],
          ),
        ),
        Container(
          color: const Color.fromRGBO(246, 246, 246, 1),
          padding: EdgeInsets.all(ScreenAdapter.width(26)),
          child: Obx(()=>MasonryGridView.count(
            crossAxisCount: 2, //2列
            mainAxisSpacing: ScreenAdapter.width(26),//水平方向间距
            crossAxisSpacing: ScreenAdapter.width(26),//垂直方向间距,
            itemCount: controller.popularProductList.length,
            shrinkWrap: true, ///收缩，让子元素自适应
            physics: const NeverScrollableScrollPhysics(),///禁止滑动
            itemBuilder: (context, index){
              // var height=50+150*Random().nextDouble(); //0.0-1.0
              var item = controller.popularProductList[index];
              return Container(
                // height: height,
                padding: EdgeInsets.all(ScreenAdapter.width(20)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      child: Image.network(HttpClient.replaceUri(item.pic), fit: BoxFit.cover,),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      width: double.infinity,
                      child: Text(item.title, textAlign: TextAlign.start, style: TextStyle(fontSize: ScreenAdapter.fontSize(42), fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      width: double.infinity,
                      child: Text(item.subTitle, textAlign: TextAlign.start, style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      width: double.infinity,
                      child: Text("￥${item.price}", textAlign: TextAlign.start, style: TextStyle(fontSize: ScreenAdapter.fontSize(32), fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              );
            },
          )),
        ),
      ],
    );
  }

  ///创建热销甄选
  Widget _buildBestSelling(){
    return Column(
      children: [
        Padding(
        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30), ScreenAdapter.height(40), ScreenAdapter.width(30), ScreenAdapter.height(20)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("热销甄选", style: TextStyle(
              fontSize: ScreenAdapter.fontSize(46),
            ),),
            Text("更多手机>", style: TextStyle(
              fontSize: ScreenAdapter.fontSize(38),
            ),),
          ],
        ),
       ),
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), ScreenAdapter.height(0), ScreenAdapter.width(20), ScreenAdapter.height(20)),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                  child: SizedBox(
                    height: ScreenAdapter.height(738),
                    child: Obx(()=> Swiper(
                      itemBuilder: (context, index){
                        return Image.network(HttpClient.replaceUri(controller.bestSellingSwiperList[index].pic),fit: BoxFit.fill,);
                      },
                      itemCount: controller.bestSellingSwiperList.value.length,
                      pagination: SwiperPagination(
                        builder: SwiperCustomPagination(
                            builder: (BuildContext context, SwiperPluginConfig config){
                              return ConstrainedBox(
                                constraints: BoxConstraints.expand(height:  ScreenAdapter.height(36)),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child: Align(
                                      alignment: Alignment.center,
                                      child: const RectSwiperPaginationBuilder(
                                        color: Colors.black12,
                                        activeColor: Colors.black54,
                                      ).build(context, config),
                                    )),
                                  ],
                                ),
                              );
                            }),
                      ),
                      autoplay: true,
                      loop: true,
                      // duration: 3000,
                    )),
              )),
              SizedBox(width: ScreenAdapter.width(20),),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: ScreenAdapter.height(738),
                    child: Obx(()=>Column(
                      children: controller.bestSellingPList.asMap().entries.map((entrie) {
                        var key = entrie.key;
                        var value = entrie.value;
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, key==2?0:ScreenAdapter.height(20)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: ScreenAdapter.height(20),),
                                              Text(value.title, style: TextStyle(fontSize: ScreenAdapter.fontSize(38),fontWeight: FontWeight.bold),),
                                              SizedBox(height: ScreenAdapter.height(20),),
                                              Text(value.subTitle, style: TextStyle(fontSize: ScreenAdapter.fontSize(28)),),
                                              SizedBox(height: ScreenAdapter.height(20),),
                                              Text("￥${value.price}", style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                                            ],
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.all(ScreenAdapter.height(8)),
                                          child: Image.network(HttpClient.replaceUri(value.pic),fit:BoxFit.cover),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        );
                      }).toList(),
                    )),

                    // Column(
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: Container(
                    //         child: Row(
                    //             children: [
                    //               Expanded(
                    //                 flex: 3,
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("空气炸烤箱", style: TextStyle(fontSize: ScreenAdapter.fontSize(38),fontWeight: FontWeight.bold),),
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("大容量专业炸烤", style: TextStyle(fontSize: ScreenAdapter.fontSize(28)),),
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("众筹价￥345元", style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                    //                   ],
                    //                 )),
                    //               Expanded(
                    //                 flex: 2,
                    //                 child: Padding(
                    //                   padding: EdgeInsets.all(ScreenAdapter.height(8)),
                    //                   child: Image.network("https://www.itying.com/images/shouji.png",fit:BoxFit.cover),
                    //                 ),
                    //               ),
                    //             ],
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(height: ScreenAdapter.height(20),),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Container(
                    //         child: Row(
                    //           children: [
                    //             Expanded(
                    //                 flex: 3,
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("空气炸烤箱", style: TextStyle(fontSize: ScreenAdapter.fontSize(38),fontWeight: FontWeight.bold),),
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("大容量专业炸烤", style: TextStyle(fontSize: ScreenAdapter.fontSize(28)),),
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("众筹价￥345元", style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                    //                   ],
                    //                 )),
                    //             Expanded(
                    //               flex: 2,
                    //               child: Padding(
                    //                 padding: EdgeInsets.all(ScreenAdapter.height(8)),
                    //                 child: Image.network("https://www.itying.com/images/kaoxiang.png",fit:BoxFit.cover),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(height: ScreenAdapter.height(20),),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Container(
                    //         child: Row(
                    //           children: [
                    //             Expanded(
                    //                 flex: 3,
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("空气炸烤箱", style: TextStyle(fontSize: ScreenAdapter.fontSize(38),fontWeight: FontWeight.bold),),
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("大容量专业炸烤", style: TextStyle(fontSize: ScreenAdapter.fontSize(28)),),
                    //                     SizedBox(height: ScreenAdapter.height(20),),
                    //                     Text("众筹价￥345元", style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                    //                   ],
                    //                 )),
                    //             Expanded(
                    //               flex: 2,
                    //               child: Padding(
                    //                 padding: EdgeInsets.all(ScreenAdapter.height(8)),
                    //                 child: Image.network("https://www.itying.com/images/shouji.png",fit:BoxFit.cover),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
              )),
            ],
          ),
        ),
      ],
    );
  }

  ///创建热销banner
  Widget _buildHotSellingBanner() {
    return Padding(
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), ScreenAdapter.width(20), ScreenAdapter.width(20), 0),
      child: Container(
        height: ScreenAdapter.height(420),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
            image: const DecorationImage(
              image: AssetImage( "assets/images/xiaomiBanner2.png"),
              fit: BoxFit.cover,
            ),
        ),
      ),
    );
  }


  ///创建轮播图下面的banner
  Widget _buildBanner() {
    return SizedBox(
                  width: ScreenAdapter.width(1080),
                  height: ScreenAdapter.width(92),
                  child: Image.asset("assets/images/xiaomiBanner.png",fit: BoxFit.cover,),
                );
  }

  ///顶部导航
  Widget _buildAppBar() {
    return Positioned(
              top: -18,
              // top: 0,
              left: 0,
              right: 0,
              child: Obx(()=> AppBar(
                leading: controller.flag.value? const Text(""): const Icon(NCFonts.xiaomi, color: Colors.white,),
                leadingWidth: controller.flag.value?ScreenAdapter.width(40):ScreenAdapter.width(140),
                title: AnimatedContainer(
                  width: controller.flag.value?ScreenAdapter.width(800):ScreenAdapter.width(620),
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
                centerTitle: true,
                backgroundColor: controller.flag.value?Colors.white:Colors.transparent,
                elevation: 0,//去掉底
                actions: [
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.qr_code, color: controller.flag.value?Colors.black87:Colors.white,)),
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.message, color: controller.flag.value?Colors.black87:Colors.white,)),
                ],// 部阴影
              )),
            );
  }

  Widget _buildCategory() {
    return Container(
      width: ScreenAdapter.width(1080),
      // height: ScreenAdapter.height(400),
      height: ScreenAdapter.height(425),
      child: Obx(()=>Swiper(
        itemBuilder: (context, index){
          return GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                // crossAxisSpacing: ScreenAdapter.width(20),
                // mainAxisSpacing: ScreenAdapter.height(20),

              ),
              itemBuilder: (context, i){
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(136),
                      height: ScreenAdapter.height(136),
                      child: Image.network(HttpClient.replaceUri(controller.categoryList[index*10+i].pic), fit: BoxFit.fitHeight,),
                    ),
                    // Padding(padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(4), 0, 0), child: Text("手机", style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),))
                    Text(controller.categoryList[index*10+i].title, style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                  ],
                );
              });
        },
        itemCount: controller.categoryList.length~/10,   //取整
        pagination: SwiperPagination(
          margin: const EdgeInsets.all(0.0),
          // builder: SwiperPagination.rect,
          builder: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config){
                return ConstrainedBox(
                  constraints: BoxConstraints.expand(height:  ScreenAdapter.height(20)),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Align(
                        alignment: Alignment.center,
                        child: const RectSwiperPaginationBuilder(
                          color: Colors.black12,
                          activeColor: Colors.black54,
                        ).build(context, config),
                      )),
                    ],
                  ),
                );
              }),
        ),
        // duration: 3000,
      )),
    );
  }

  Widget _buildSwiperView() {
    return SizedBox(
      width: ScreenAdapter.width(1000),
      height: ScreenAdapter.height(472),
      child: Obx(() => Swiper(
        itemBuilder: (context, index){
          return Image.network(HttpClient.replaceUri(controller.swiperList[index].pic),fit: BoxFit.fill,);
        },
        itemCount: controller.swiperList.value.length,
        pagination: const SwiperPagination(
          builder: SwiperPagination.rect,
        ),
        autoplay: true,
        loop: true,
        // duration: 3000,
      )),
    );
  }

}