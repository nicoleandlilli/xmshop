import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/productList/controllers/product_list_controller.dart';
import 'package:xmeshop/app/services/http_client.dart';

import '../../../models/plist_model.dart';
import '../../../services/kee_alive_wrapper.dart';
import '../../../services/screenAdapter.dart';

class ProductListView extends GetView<ProductListController>{
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          appBar: _buildAppBar(),
          body: _buildBody(),
        )
    );
  }

  Widget _buildBody(){
    return Stack(
      children: [
        _buildProductList(),
        _buildSubHeader(),
      ],
    );
  }

  Widget _buildProgressIndicator(){
    if(controller.hasData.value){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return const Center(
        child: Text("没有数据了喔，我是有底线的"),
      );
    }
  }

  Widget _buildProductList(){
    return Obx(()=>controller.pList.isNotEmpty? ListView.builder(
        controller: controller.scrollController,
        padding: EdgeInsets.fromLTRB(ScreenAdapter.height(26), ScreenAdapter.height(140), ScreenAdapter.height(26), ScreenAdapter.height(26)),
        itemCount: controller.pList.length,
        itemBuilder: (context, index){
          PListModelItem item = controller.pList[index];
          return Column(
            children: [
              Container(
                // color: Colors.white,
                margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(60)),
                      width: ScreenAdapter.width(400),
                      height: ScreenAdapter.height(460),
                      child: Image.network("${HttpClient.replaceUri(item.pic)}",fit: BoxFit.cover,),
                      // child: Text("11111111111111111"),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: ScreenAdapter.width(20)),
                            child: Text(item.title, style: TextStyle(fontSize: ScreenAdapter.fontSize(42), fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: ScreenAdapter.width(20)),
                            child: Text(item.subTitle, style: TextStyle(fontSize: ScreenAdapter.fontSize(34),),),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                            child: Row(
                              children: [
                                Expanded(child: Column(
                                  children: [
                                    Text("超大屏", style: TextStyle(fontSize: ScreenAdapter.fontSize(34),fontWeight: FontWeight.bold),),
                                    Text("6.1寸", style: TextStyle(fontSize: ScreenAdapter.fontSize(34),fontWeight: FontWeight.bold),),
                                  ],
                                )),
                                Expanded(child: Column(
                                  children: [
                                    Text("超大屏", style: TextStyle(fontSize: ScreenAdapter.fontSize(34),fontWeight: FontWeight.bold),),
                                    Text("6.1寸", style: TextStyle(fontSize: ScreenAdapter.fontSize(34),fontWeight: FontWeight.bold),),
                                  ],
                                )),
                                Expanded(child: Column(
                                  children: [
                                    Text("超大屏", style: TextStyle(fontSize: ScreenAdapter.fontSize(34),fontWeight: FontWeight.bold),),
                                    Text("6.1寸", style: TextStyle(fontSize: ScreenAdapter.fontSize(34),fontWeight: FontWeight.bold),),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Text("￥${item.price}起", style: TextStyle(fontSize: ScreenAdapter.fontSize(38), fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              (index==controller.pList.length-1)?_buildProgressIndicator():const Text(""),
            ],
          );
        }):_buildProgressIndicator());
  }

  Widget _buildSubHeader(){
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: ScreenAdapter.height(120),
        width: ScreenAdapter.width(1080),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: ScreenAdapter.height(2),
              color: const Color.fromRGBO(233, 233, 233, 0.9),
            )
          )
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                      ScreenAdapter.height(16)),
                  child: Text(
                    "综合",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: ScreenAdapter.fontSize(32)),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                      ScreenAdapter.height(16)),
                  child: Text("销量",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                      ScreenAdapter.height(16)),
                  child: Text("价格",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                      ScreenAdapter.height(16)),
                  child: Text("筛选",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
                ),
                onTap: () {
                  //注意：新版本中ScaffoldState? 为可空类型 注意判断
                },
              ),
            ),
          ],
        ),
      ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title:  AnimatedContainer(
        width: ScreenAdapter.width(900),
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
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }


}