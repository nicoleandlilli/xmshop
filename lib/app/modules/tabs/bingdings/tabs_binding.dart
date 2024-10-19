import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:xmeshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmeshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmeshop/app/modules/give/controllers/give_controller.dart';
import 'package:xmeshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmeshop/app/modules/user/controllers/user_controller.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
        () => TabsController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<CategoryController>(
          () => CategoryController(),
    );
    Get.lazyPut<GiveController>(
          () => GiveController(),
    );

    Get.lazyPut<CartController>(
          () => CartController(),
    );

    Get.lazyPut<UserController>(
          () => UserController(),
    );
  }

}