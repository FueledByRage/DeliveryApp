import 'package:delivery/models/chat.dart';
import 'package:delivery/models/message.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/providers/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.item}) : super(key: key);
  final Chat item;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: AssetImage(widget.item.restaurant.logoUrl),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Consumer<MessagesController>(
          builder: (BuildContext context, MessagesController value, _) {
            Chat chat = widget.item;
            return Stack(
              children: [
                ListView.builder(
                    itemCount:
                        value.getMessages(chat.restaurant, chat.user).length,
                    itemBuilder: (BuildContext context, int index) {
                      Message item =
                          value.getMessages(chat.restaurant, chat.user)[index];
                      return SizedBox(
                        width: size.width * 0.8,
                        child: Align(
                          alignment: item.author == 'restaurant'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: item.author == 'restaurant'
                                      ? Colors.yellowAccent
                                      : Colors.lightBlue,
                                  borderRadius: item.author == 'restaurant'
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30))
                                      : const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(item.message),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(5),
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                                onChanged: (String value) {
                                  message = value;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Write message...",
                                    hintStyle: TextStyle(color: Colors.black54),
                                    border: InputBorder.none))),
                        FloatingActionButton(
                          onPressed: () {
                            if (message != '') {
                              value.sendMessage(Message(
                                  'user', message, chat.restaurant, chat.user));
                            }
                          },
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          backgroundColor: Colors.blue,
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
