import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/user_model.dart';
import '../../../services/userServices.dart';

class UserController extends GetxController{

  RxBool isLogin=false.obs;
  // RxList userList=[].obs;
  var userInfo=UserModel().obs;
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }


  @override
  void onClose() {
    super.onClose();
  }

  getUserInfo() async{
    var tempLoginState=await UserServices.getUserLoginState();
    isLogin.value=tempLoginState;
    var tempList=await UserServices.getUserInfo();
    if(tempList.isNotEmpty){
      userInfo.value=UserModel.fromJson(tempList[0]);
      update();
    }
  }

  loginOut(){
    UserServices.loginOut();
    isLogin.value=false;
    //把信息值为空
    userInfo.value=UserModel();
    update();
  }
}