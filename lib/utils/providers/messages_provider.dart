import 'package:delivery/db/db.dart';
import 'package:delivery/models/message.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/models/user.dart';
import 'package:flutter/cupertino.dart';

class MessagesController extends ChangeNotifier {
  List<Message> getMessages(Restaurant restaurant, User user) {
    return messages
        .where((Message message) =>
            message.restaurant == restaurant && message.user == user)
        .toList();
  }

  sendMessage(Message message) {
    print(message);
    messages.add(message);
    notifyListeners();
  }
}
