import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../services/kee_alive_wrapper.dart';

class CartView extends GetView{
  const CartView({super.key});


  @override
  Widget build(BuildContext context) {
    return const KeepAliveWrapper(
        child: Scaffold(
          body: Center(
            child:  Text("CartView"),
          ),
        )
    );
  }


}