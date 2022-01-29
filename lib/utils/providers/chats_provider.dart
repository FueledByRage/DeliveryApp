import 'package:delivery/db/db.dart';
import 'package:delivery/models/chat.dart';
import 'package:flutter/cupertino.dart';

class ChatsController extends ChangeNotifier {
  List<Chat> getChats() {
    return chats;
  }
}
