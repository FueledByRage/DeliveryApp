import 'package:delivery/models/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:delivery/db/db.dart';

class ReviewsController extends ChangeNotifier {
  List<Review> getReviews(String restaurant) {
    return listOfReviews
        .where((Review review) => review.restaurant.name == restaurant)
        .toList();
  }
}
