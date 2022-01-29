import 'package:delivery/models/cart.dart';
import 'package:delivery/utils/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget increasyDecreasyButton(Cart cart, int index, CartController value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove,
          )),
      Text(
        cart.products[index].quantity.toString(),
      ),
      IconButton(
          onPressed: () {
            value.addProduct(cart.products[index].product);
          },
          icon: const Icon(Icons.add))
    ],
  );
}
