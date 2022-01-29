import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/provider.dart';
import 'package:delivery/utils/providers/chats_provider.dart';
import 'package:delivery/utils/providers/messages_provider.dart';
import 'package:delivery/views/chats/chats.dart';
import 'package:delivery/views/home/bodies/cart_list.dart';
import 'package:delivery/views/login/index.dart';
import 'package:delivery/views/restaurant/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:delivery/views/home/index.dart';
import 'package:delivery/utils/providers/cart_provider.dart';
import 'package:delivery/utils/providers/orders_provider.dart';
import 'package:delivery/utils/providers/products_provider.dart';
import 'package:delivery/utils/providers/restaurants_provider.dart';
import 'package:delivery/utils/providers/reviews_provider.dart';
import 'package:delivery/utils/providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserController()),
          ChangeNotifierProvider(create: (_) => CartController()),
          ChangeNotifierProvider(create: (_) => OrdersController()),
          ChangeNotifierProvider(create: (_) => ProductController()),
          ChangeNotifierProvider(create: (_) => RestaurantsController()),
          ChangeNotifierProvider(create: (_) => ReviewsController()),
          ChangeNotifierProvider(create: (_) => ChatsController()),
          ChangeNotifierProvider(create: (_) => MessagesController())
        ],
        child: Consumer<UserController>(
          builder: (BuildContext context, UserController value, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.red,
              ),
              initialRoute: value.logged ? '/' : '/login',
              routes: {
                '/': (BuildContext context) => const HomePage(),
                '/login': (BuildContext context) => const LoginScreen(),
                '/chats': (BuildContext context) => const ChatsList()
              },
            );
          },
        ));
  }
}
