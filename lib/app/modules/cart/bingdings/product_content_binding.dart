import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:xmeshop/app/modules/cart/controllers/cart_controller.dart';



class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
          () => CartController(),
    );
  }

}