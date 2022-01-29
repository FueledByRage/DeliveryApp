import 'package:delivery/models/cart.dart';
import 'package:delivery/utils/provider.dart';
import 'package:delivery/utils/providers/cart_provider.dart';
import 'package:delivery/views/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List<Cart> mapToList(Map<String, Cart> map) {
    List<Cart> list = [];
    map.forEach((String key, Cart value) {
      list.add(value);
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
        builder: (BuildContext context, CartController value, _) {
      return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext contest) {
                  return CartDetails(cart: value.getCartItens()[index]);
                }));
              },
              trailing: Text(
                  '\$ ' + value.getCartItens()[index].getPrice().toString()),
              title: Text(value.getCartItens()[index].restaurant.name),
              subtitle: Text(value.getCartItens()[index].user),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: value.getCartItens().length);
    });
  }
}
