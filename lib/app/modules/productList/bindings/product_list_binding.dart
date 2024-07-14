import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:xmeshop/app/modules/productList/controllers/product_list_controller.dart';

class ProductListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(
          () => ProductListController(),
    );
  }

}