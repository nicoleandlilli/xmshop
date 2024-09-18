import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/modules/sample/controllers/sample_controller.dart';

import '../../../services/kee_alive_wrapper.dart';

class ProductContentView extends GetView<SampleController>{
  const ProductContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  Text("GiveView"),
      ),
    );
  }

}