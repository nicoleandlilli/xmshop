import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../services/kee_alive_wrapper.dart';

class SearchView extends GetView{
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const KeepAliveWrapper(
        child: Scaffold(
          body: Center(
            child:  Text("GiveView"),
          ),
        )
    );
  }

}