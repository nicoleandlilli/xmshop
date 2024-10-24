import 'package:get/get.dart';

abstract class Routes{
  Routes._();

  static const tabs = Paths.TABS;
  static const PRODUCT_LIST = Paths.PRODUCT_LIST;
  static const SEARCH = Paths.SEARCH;
  static const PRODUCT_CONTENT = Paths.PRODUCT_CONTENT;
  static const Cart = Paths.CART;
  static const CODE_LOGIN_STEP_ONE = Paths.CODE_LOGIN_STEP_ONE;
  static const CODE_LOGIN_STEP_TWO = Paths.CODE_LOGIN_STEP_TWO;
  static const ON_STEP_LOGIN = Paths.ON_STEP_LOGIN;
  static const PASS_LOGIN = Paths.PASS_LOGIN;
  static const REGISTER_STEP_ONE = Paths.REGISTER_STEP_ONE;
  static const REGISTER_STEP_TWO = Paths.REGISTER_STEP_TWO;
  static const REGISTER_STEP_THREE = Paths.REGISTER_STEP_THREE;
  static const CHECKOUT = Paths.CHECKOUT;
  static const ADDRESS_LIST =  Paths.ADDRESS_LIST;
  static const ADDRESS_ADD = Paths.ADDRESS_ADD;
  static const ADDRESS_EDIT =  Paths.ADDRESS_EDIT;
}

abstract class Paths {
  Paths._();
  static const TABS = '/tabs';
  static const PRODUCT_LIST  = '/product-list';
  static const SEARCH = '/search';
  static const PRODUCT_CONTENT = '/product_content';
  static const CART = '/cart';
  static const USER = '/user';
  static const CODE_LOGIN_STEP_ONE = '/code-login-step-one';
  static const CODE_LOGIN_STEP_TWO = '/code-login-step-two';
  static const ON_STEP_LOGIN = '/on-step-login';
  static const PASS_LOGIN = '/pass-login';
  static const REGISTER_STEP_ONE = '/register-step-one';
  static const REGISTER_STEP_TWO = '/register-step-two';
  static const REGISTER_STEP_THREE = '/register-step-three';
  static const CHECKOUT = '/checkout';
  static const ADDRESS_LIST = '/address-list';
  static const ADDRESS_ADD = '/address-add';
  static const ADDRESS_EDIT = '/address-edit';
}

