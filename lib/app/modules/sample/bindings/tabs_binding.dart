import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:xmeshop/app/modules/sample/controllers/sample_controller.dart';


class SampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampleController>(
          () => SampleController(),
    );
  }

}