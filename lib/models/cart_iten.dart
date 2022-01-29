import 'package:delivery/models/product.dart';

class CartIten {
  int quantity = 1;
  final Product product;

  CartIten(this.product);

  addQuantity() {
    quantity++;
  }
}
