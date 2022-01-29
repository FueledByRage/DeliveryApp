import 'package:delivery/models/restaurant.dart';
import 'package:delivery/models/review.dart';

class Product {
  final Restaurant restaurant;
  final String name;
  final double price;
  final String imageURL;
  final String type;
  int _score = 0;
  List<Review> reviews = [];

  Product(
      {required this.restaurant,
      required this.name,
      required this.price,
      required this.type,
      this.imageURL = ''});

  //set review(Review review) => reviews.add(review);

  setReview(Review review) {
    _score += review.stars;
    reviews.add(review);
  }

  String getScore() {
    if (reviews.isEmpty) {
      return 'There is not any review yet.';
    } else {
      return (_score / reviews.length).toString();
    }
  }
}
