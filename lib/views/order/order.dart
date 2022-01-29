import 'package:delivery/models/orders.dart';
import 'package:delivery/utils/providers/orders_provider.dart';
import 'package:delivery/views/review/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
              Text(order.restaurant.name),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => NewReview(
                              order: order,
                            )));
                  },
                  icon: const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ))
            ],
          ),
          Text(order.date.day.toString() + '/' + order.date.month.toString()),
          Text(order.price.toString()),
          Text(order.user.toString()),
        ],
      ),
    ));
  }
}
