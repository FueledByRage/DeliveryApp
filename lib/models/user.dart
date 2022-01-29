import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';

class User {
  final String userName;
  double cash = 0.0;
  final String password;
  List<List<double>> address = [
    [0.0, 0.0]
  ];
  final String email;
  String phone = '';
  List<Product> favourites = [];

  User(this.userName, this.password, this.email);

  changePhone(String newPhone) {
    newPhone = phone;
  }

  setAddress(List<double> newAddress) {
    address.add(newAddress);
  }

  addCash(double c) {
    cash += c;
  }

  removeCash(double c) {
    if (cash > c) {
      cash -= c;
    } else {
      throw Error();
    }
  }
}
