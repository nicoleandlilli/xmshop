import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmeshop/app/services/kee_alive_wrapper.dart';
import 'package:xmeshop/app/services/ncFonts.dart';
import 'package:xmeshop/app/services/screenAdapter.dart';
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
              // bottom: 0,
              child: ListView(
                controller: controller.scrollController,
                shrinkWrap: true,

                children: [
                  _buildSwiperView(),
                  _buildBanner(),
                  _buildCategory(),
                  _buildHotSellingBanner(),
                  _buildBestSelling(),


                ],
              ),
            );
  }


  ///创建热销甄选
  Widget _buildBestSelling(){
    return Column(
      children: [
        Padding(
        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30), ScreenAdapter.height(20), ScreenAdapter.width(30), ScreenAdapter.height(20)),
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
                  child: Container(

                    height: ScreenAdapter.height(738),
                    color: Colors.red,
                    child: Text("1"),
              )),
              SizedBox(width: ScreenAdapter.width(20),),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: ScreenAdapter.height(738),
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.cyanAccent,
                            child: const Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text("左侧")),
                                  Expanded(
                                    flex: 2,
                                    child: Text("右侧")),
                                ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.orange,
                            child: const Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Text("左侧")),
                                Expanded(
                                    flex: 2,
                                    child: Text("右侧")),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.amberAccent,
                            child: const Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Text("左侧")),
                                Expanded(
                                    flex: 2,
                                    child: Text("右侧")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                // String picUrl = "https://miapp.itying.com/public/upload/NssHlEUvoWU36EpuF3S1URMB.png";
                String picUrl = "https://miapp.itying.com/${controller.categoryList[index*10+i].pic}";
                picUrl = picUrl.replaceAll("\\", "/");
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(136),
                      height: ScreenAdapter.height(136),
                      child: Image.network(picUrl, fit: BoxFit.fitHeight,),
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
          String picUrl = "https://miapp.itying.com/${controller.swiperList[index].pic}";
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