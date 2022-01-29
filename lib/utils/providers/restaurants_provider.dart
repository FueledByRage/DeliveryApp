import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:delivery/db/db.dart';
import 'package:delivery/models/review.dart';

class RestaurantsController extends ChangeNotifier {
  List<Restaurant> getRestaurants() {
    return listOfRestaurants;
  }

  List<Restaurant> getRestaurantFromParam(String name) {
    return listOfRestaurants
        .where((Restaurant restaurant) => restaurant.name.contains(name))
        .toList();
  }

  List<Review> getReviews(String restaurant) {
    return listOfReviews
        .where((Review review) => review.restaurant.name == restaurant)
        .toList();
  }

  double getScore(String restaurant) {
    List<Review> reviews = getReviews(restaurant);
    int total = 0;
    reviews.forEach((Review review) {
      total += review.stars;
    });
    return total == 0 || reviews.isEmpty ? 0 : (total / reviews.length);
  }

  List<Product> getOffers() {
    return offers;
  }
}
