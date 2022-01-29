import 'package:delivery/models/product.dart';
import 'package:delivery/models/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:delivery/db/db.dart';

class ProductController extends ChangeNotifier {
  List<Product> getProductsFromRestaurant(String restaurant) {
    return listOfProducts
        .where((Product element) => element.restaurant.name == restaurant)
        .toList();
  }

  List<Product> getOffers() {
    return offers;
  }
}
