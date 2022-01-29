import 'package:delivery/db/db.dart';
import 'package:delivery/models/cart_iten.dart';
import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/models/review.dart';

class Order {
  final String user;
  Restaurant restaurant;
  String status = 'In progress';
  final List<CartIten> products;
  final double price;
  final DateTime date = DateTime.now();
  Order(this.restaurant, this.price, this.user, this.products);
  bool hasReview = false;

  sendReviews(Review review) {
    hasReview = true;
    products.forEach((CartIten iten) {
      iten.product.setReview(review);
    });
  }
}
