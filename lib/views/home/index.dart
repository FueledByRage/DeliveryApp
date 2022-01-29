import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/options.dart';
import 'package:delivery/utils/providers/cart_provider.dart';
import 'package:delivery/utils/providers/orders_provider.dart';
import 'package:delivery/utils/providers/products_provider.dart';
import 'package:delivery/utils/providers/restaurants_provider.dart';
import 'package:delivery/utils/providers/reviews_provider.dart';
import 'package:delivery/utils/providers/user_provider.dart';
import 'package:delivery/views/chats/chats.dart';
import 'package:provider/provider.dart';
import 'package:delivery/views/home/bodies/cart_list.dart';
import 'package:delivery/views/home/bodies/orders.dart';
import 'package:delivery/views/home/bodies/profile.dart';
import 'package:delivery/views/home/bodies/restaurants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Options> allOptions = <Options>[
    const Options(Icons.house, 'Home', RestaurantsList()),
    const Options(Icons.note, 'orders', Orders()),
    const Options(Icons.chat, 'Chats', ChatsList()),
    const Options(Icons.shopping_cart, 'Cart', CartList())
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 250, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor(),
        title: const Text('Welcome!'),
      ),
      body: allOptions[_currentIndex].body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        unselectedItemColor: secondaryColor(),
        selectedItemColor: primaryColor(),
        items: allOptions.map((Options option) {
          return BottomNavigationBarItem(
              icon: Icon(option.icon), label: option.label);
        }).toList(),
      ),
    );
  }
}
