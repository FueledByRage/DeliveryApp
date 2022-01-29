import 'package:delivery/models/chat.dart';
import 'package:delivery/utils/providers/chats_provider.dart';
import 'package:delivery/views/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatsController>(
      builder: (BuildContext context, ChatsController value, _) {
        return SafeArea(
            child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: value.getChats().length,
                    itemBuilder: (BuildContext context, int index) {
                      Chat item = value.getChats()[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ChatScreen(
                                      item: item,
                                    )));
                          },
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    maxRadius: 30,
                                    backgroundImage:
                                        AssetImage(item.restaurant.logoUrl),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.restaurant.name,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        item.date.day.toString() +
                                            '/' +
                                            item.date.month.toString(),
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ));
      },
    );
  }
}
