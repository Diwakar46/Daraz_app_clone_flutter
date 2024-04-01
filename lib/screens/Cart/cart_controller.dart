import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CartController extends GetxController {
  var products = {}.obs;
  RxInt cartItems = 0.obs;
  int addToCart() {
    cartItems++;
    return cartItems.value;
  }

}
