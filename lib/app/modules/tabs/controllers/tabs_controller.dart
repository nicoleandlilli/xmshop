import 'package:get/get.dart';

class TabsController extends GetxController{

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndex(index){
    super.onClose();
    update();
  }

}