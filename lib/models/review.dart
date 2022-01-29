import 'package:delivery/models/cart_iten.dart';
import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';

class Review {
  final Restaurant restaurant;
  final String user;
  final int stars;
  final String review;
  final List<CartIten> product;

  Review(this.restaurant, this.user, this.stars, this.review, this.product);
}
