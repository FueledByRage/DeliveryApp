import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:delivery/db/db.dart';

class UserController extends ChangeNotifier {
  late User loggedUser;
  bool logged = false;

  setUser(User user) {
    loggedUser = user;
    logged = true;
  }

  bool handleLogin(String email, String password) {
    if (users.any((User user) => user.email == email)) {
      User userFound = users.firstWhere((User user) => user.email == email);
      if (userFound.password == password) {
        setUser(userFound);
        return true;
      }
    }
    return false;
  }

  setFavourite(Product product) {
    loggedUser =
        users.firstWhere((User user) => user.email == loggedUser.email);
    if (!loggedUser.favourites.contains(product)) {
      loggedUser.favourites.add(product);
    } else {
      loggedUser.favourites.remove(product);
    }
    notifyListeners();
  }

  bool isFavourite(Product product) {
    return loggedUser.favourites.contains(product);
  }
}
