import 'package:get/get.dart';

abstract class Routes{
  Routes._();

  static const tabs = Paths.TABS;
}

abstract class Paths {
  Paths._();
  static const TABS = '/tabs';
  static const PRODUCT_LIST  = '/product-list';
  static const SEARCH = '/search';
  static const PRODUCT_CONTENT = '/product_content';
  static const CART = '/cart';
  static const USER = '/user';
}

