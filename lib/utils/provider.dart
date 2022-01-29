import 'package:delivery/db/db.dart';
import 'package:delivery/models/cart.dart';
import 'package:delivery/models/orders.dart';
import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/models/review.dart';
import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  List<String> restaurants = ['Do seu zé', 'Fon fon'];
  List<String> orders = ['Bebida', 'PF'];

  List<Restaurant> getRestaurants() {
    return listOfRestaurants;
  }

  List<Order> getOrders() {
    return listOfOrders;
  }

  Map<String, Cart> getCartItens() {
    return cartItens;
  }

  List<Product> getProductsFromRestaurant(String restaurant) {
    return listOfProducts
        .where((Product element) => element.restaurant.name == restaurant)
        .toList();
  }

  List<Restaurant> getRestaurantFromParam(String param) {
    return listOfRestaurants
        .where((Restaurant restaurant) => restaurant.name.contains(param))
        .toList();
  }

  List<Product> getOffers() {
    return offers;
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
    return total == 0 || reviews.isEmpty ? 0 : total / reviews.length;
  }

  addOrder(Order newOrder) {
    notifyListeners();
  }
}
