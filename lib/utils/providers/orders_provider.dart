import 'package:delivery/models/orders.dart';
import 'package:delivery/db/db.dart';
import 'package:flutter/cupertino.dart';

class OrdersController extends ChangeNotifier {
  List<Order> getOrders() {
    return listOfOrders;
  }

  addOrder(Order newOrder) {
    notifyListeners();
  }
}
