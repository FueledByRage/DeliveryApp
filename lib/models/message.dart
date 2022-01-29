import 'package:delivery/models/restaurant.dart';
import 'package:delivery/models/user.dart';

class Message {
  late final String author;
  final Restaurant restaurant;
  final User user;
  final String message;
  DateTime date = DateTime.now();

  Message(this.author, this.message, this.restaurant, this.user);
}
