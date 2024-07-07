import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmeshop/app/services/kee_alive_wrapper.dart';
import 'package:xmeshop/app/services/ncFonts.dart';
import 'package:xmeshop/app/services/screenAdapter.dart';

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
              top: -55,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                controller: controller.scrollController,
                children: [
                  _buildSwiperView(),
                ],
              ),
            );
  }

  ///顶部导航
  Widget _buildAppBar() {
    return Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Obx(()=> AppBar(
                leading: controller.flag.value? const Text(""): const Icon(NCFonts.xiaomi, color: Colors.white,),
                leadingWidth: controller.flag.value?ScreenAdapter.width(40):ScreenAdapter.width(140),
                title: AnimatedContainer(
                  width: controller.flag.value?ScreenAdapter.width(800):ScreenAdapter.width(620),
                  height: ScreenAdapter.height(96),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(230, 252, 243, 236),
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

  Widget _buildSwiperView() {
    return SizedBox(
      width: ScreenAdapter.width(1000),
      height: ScreenAdapter.height(682),
      child: Obx(() => Swiper(
        itemBuilder: (context, index){
          String picUrl = "https://miapp.itying.com/${controller.swiperList[index]["pic"]}";
          picUrl = picUrl.replaceAll("\\", "/");
          return Image.network(picUrl,fit: BoxFit.fill,);
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