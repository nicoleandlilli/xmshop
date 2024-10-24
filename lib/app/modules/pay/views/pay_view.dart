import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  const PayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
