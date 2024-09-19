import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../services/screenAdapter.dart';
import '../controllers/product_content_controller.dart';

class SecondPageView extends GetView {
    final ProductContentController controller = Get.find();
   SecondPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
              key: controller.gk2,
              alignment: Alignment.center,
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(2900),
              color: Colors.blue,
              child: const Text("详情", style: TextStyle(fontSize: 100)),
            );
  }
}
