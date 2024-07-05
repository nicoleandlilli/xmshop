import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/tabs/controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController>{
  const TabsView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabsView'),
        centerTitle: true,
      ),
      body: Text('tab'),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,//选中的颜色
        iconSize: 35,
        currentIndex:controller.currentIndex.value,//第几个菜单选中
        type: BottomNavigationBarType.fixed, //如果有四个或四个以上的
        onTap: (index){
          controller.setCurrentIndex(index);

        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "分类"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service),
              label: "服务"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "购物车"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "用户"
          ),
        ],
      ),
    );
  }

}