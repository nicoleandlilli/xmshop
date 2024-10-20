
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:xmeshop/app/modules/productContent/controllers/product_content_controller.dart';
import 'package:xmeshop/app/modules/productContent/views/product_content_view.dart';
import 'package:xmeshop/app/modules/productList/bindings/product_list_binding.dart';
import 'package:xmeshop/app/modules/productList/views/product_list_view.dart';

import '../modules/cart/bingdings/product_content_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/productContent/bingdings/product_content_binding.dart';
import '../modules/search/bingdings/tabs_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/tabs/bingdings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.tabs;

  static final routes = [
    GetPage(
      name: Paths.TABS,
      page: ()=>const TabsView(),
      binding: TabsBinding(),
    ),


    GetPage(
      name: Paths.PRODUCT_LIST,
      page: ()=>const ProductListView(),
      binding: ProductListBinding(),
    ),

    GetPage(
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
      name: Paths.SEARCH,
      page: ()=>const SearchView(),
      binding: SearchBinding(),
    ),

    GetPage(
      name: Paths.PRODUCT_CONTENT,
      page: ()=>const ProductContentView(),
      binding: ProductContentBinding(),
    ),

    // GetPage(
    //   name: Paths.CART,
    //   page: ()=>const CartView(),
    //   binding: CartBinding(),
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


