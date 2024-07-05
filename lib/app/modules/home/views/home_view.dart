import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmeshop/app/services/kee_alive_wrapper.dart';

class HomeView extends GetView{
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: 1080.w,
                height: 690.h,
                color: Colors.red,
                child: const Center(
                  child:  Text("HomeView"),
                ),
              )
            ],
          ),
        ),
    );
  }

}