import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../controllers/product_content_controller.dart';


class ProductContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductContentController>(
          () => ProductContentController(),
    );
  }

}