import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/options.dart';
import 'package:delivery/views/chats/chats.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Options> allOptions = const [
      Options(Icons.arrow_downward, 'Deposit', Profile()),
      Options(Icons.chat, 'My chats', ChatsList()),
      Options(Icons.favorite, 'Favourites', Profile()),
      Options(Icons.gps_fixed, 'Address', Profile()),
      Options(Icons.phone, 'Contact', Profile()),
    ];

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 12,
                color: primaryColor(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Erik Natan',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Cash',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('550,00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            allOptions[index].body));
                  },
                  child: ListTile(
                    trailing: Icon(allOptions[index].icon),
                    title: Text(allOptions[index].label),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: allOptions.length),
        ],
      ),
    );
  }
}
