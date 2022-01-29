import 'package:delivery/models/cart_iten.dart';
import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';

class Cart {
  Restaurant restaurant = Restaurant(name: 'name', street: 'street');
  String user;
  final List<CartIten> products;

  Cart(this.restaurant, this.user, this.products);

  addProduct(Product product) {
    if (products.any((CartIten iten) => iten.product == product)) {
      products
          .firstWhere((CartIten iten) => iten.product == product)
          .quantity++;
    } else {
      products.add(CartIten(product));
    }
  }

  double getPrice() {
    double price = 0.0;

    products.forEach((CartIten iten) {
      price += iten.product.price * iten.quantity;
    });
    return price;
  }
}
