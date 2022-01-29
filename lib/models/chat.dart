import 'package:delivery/models/message.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/models/user.dart';

class Chat {
  final User user;
  final Restaurant restaurant;
  DateTime date = DateTime.now();
  Chat(this.user, this.restaurant);
}
