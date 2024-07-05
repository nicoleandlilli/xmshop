import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/services/kee_alive_wrapper.dart';

class HomeView extends GetView{
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return const KeepAliveWrapper(
        child: Scaffold(
          body: Center(
            child:  Text("HomeView"),
          ),
        )
    );
  }

}