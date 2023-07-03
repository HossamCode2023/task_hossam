import 'package:get/get.dart';

class CartItem {
  final String imageLink;
  final String title;
  final String details;
  int quantity;

  CartItem( this.imageLink, this.title, this.details, this.quantity );
}

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  int get total => cartItems.fold(0, (total, item) => total +  item.quantity);

  void addItem(CartItem item) {
    final index = cartItems.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(item);
    }
  }

  void removeItem(CartItem item) {
    cartItems.removeWhere((i) => i.title == item.title);
  }

  void clear() {
    cartItems.clear();
  }
}

