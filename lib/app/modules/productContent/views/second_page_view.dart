import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../services/screenAdapter.dart';
import '../controllers/product_content_controller.dart';
import 'package:flutter_html/flutter_html.dart';

class SecondPageView extends GetView {
    final ProductContentController controller = Get.find();
    final Function subHeader;
   SecondPageView(this.subHeader,{super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
              key: controller.gk2,
              alignment: Alignment.center,
      child: Column(
        children: [
          subHeader(),
          Obx(() => controller.selectedSubTabsIndex.value == 1
              ? Container(
              width: ScreenAdapter.width(1080),
              child: Html(
                data: controller.pcontent.value.content,
                style: {
                  "body": Style(backgroundColor: Colors.white),
                  "p": Style(fontSize: FontSize.large),
                },
              ))
              : Container(
            width: ScreenAdapter.width(1080),
            child: Html(
              data: controller.pcontent.value.specs,
              style: {
                "body": Style(backgroundColor: Colors.white),
                "p": Style(fontSize: FontSize.large),
              },
            ),
          )),
        ],
      ),
            );
  }
}
