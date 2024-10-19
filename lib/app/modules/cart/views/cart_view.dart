import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:xmeshop/app/modules/cart/views/cart_item_num_view.dart';
import '../../../services/screenAdapter.dart';
import '../controllers/cart_controller.dart';
import "cart_item_view.dart";

class CartView extends GetView<CartController>{
  const CartView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('购物车'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){

          }, child: const Text("编辑"))
        ],
      ),
      body: GetBuilder<CartController>(
        initState: (state){
          //获取购物车数据
          controller.getCartListData();
        },
        init: controller,
        builder: (controller){
          return controller.cartList.isNotEmpty?Stack(
            children: [
              ListView(
                padding: EdgeInsets.only(bottom: ScreenAdapter.height(200)),
                children: controller.cartList.map((value){
                  return CartItemView(value);
                }).toList(),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child:Container(
                    padding: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    width: ScreenAdapter.width(1080),
                    height: ScreenAdapter.height(190),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide (color: Color.fromARGB(178, 240, 236, 236),width: ScreenAdapter.height(2))),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged:(value){
                              print(value);
                            }),const Text("全选")
                          ],
                        ),
                        Row(
                          children: [
                            Text("合计: "),
                            Text("¥98.9",style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(58),
                                color: Colors.red
                            )),
                            SizedBox(width: ScreenAdapter.width(20)),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(255, 165, 0, 0.9)),
                                    foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all(
                                      // CircleBorder()
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)))),

                                onPressed: (){


                                }, child: Text("结算")),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ):const Center(child: Text("购物车空空的"));
        },
      ),
    );

  }



}