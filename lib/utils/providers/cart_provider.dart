import 'package:delivery/models/cart.dart';
import 'package:delivery/db/db.dart';
import 'package:delivery/models/product.dart';
import 'package:flutter/cupertino.dart';

class CartController extends ChangeNotifier {
  List<Cart> getCartItens() {
    return cart;
  }

  addProduct(Product product) {
    addProductToCart(product);
    notifyListeners();
  }
}
