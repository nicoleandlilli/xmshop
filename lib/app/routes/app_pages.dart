
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/tabs/bingdings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.tabs;

  static final routes = [
    GetPage(
      name: Paths.tabs,
      page: ()=>const TabsView(),
      binding: TabsBinding(),
    ),


    // GetPage(
    //   name: _Paths.HOME,
    //   page: ()=>const HomeView(),
    //   binding: HomeBinding(),
    // ),

    // GetPage(
    //   name: _Paths.CATEGORY,
    //   page: ()=>const CategoryView(),
    //   binding: CategoryBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.GIVE,
    //   page: ()=>const GiveView(),
    //   binding: GiveBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.CART,
    //   page: ()=>const CartView(),
    //   binding: CartBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.USER,
    //   page: ()=>const UserView(),
    //   binding: UserBinding(),
    // ),
  ];
}


