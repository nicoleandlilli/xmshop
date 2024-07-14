import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/kee_alive_wrapper.dart';

class ProductListView extends GetView<ProductListView>{
  const ProductListView({super.key});


  @override
  Widget build(BuildContext context) {
    print("get arguments..............${Get.arguments}");
    return const KeepAliveWrapper(
        child: Scaffold(
          body: Center(
            child:  Text("CartView"),
          ),
        )
    );
  }


}