import 'package:delivery/utils/providers/orders_provider.dart';
import 'package:delivery/views/order/order.dart';
import 'package:delivery/views/review/index.dart';
import 'package:flutter/material.dart';
import 'package:delivery/utils/provider.dart';
import 'package:provider/provider.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersController>(
      builder: (BuildContext context, OrdersController value, _) {
        return Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(240, 240, 250, 1)),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(child: Text('Sort orders by ')),
                          PopupMenuButton(
                              itemBuilder: (context) => [
                                    const PopupMenuItem(child: Text('All')),
                                    const PopupMenuItem(
                                      child: Text('Done'),
                                    ),
                                    const PopupMenuItem(
                                        child: Text('In Progress'))
                                  ])
                        ],
                      ),
                    )),
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(230, 230, 230, 1),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  if (value.getOrders()[index].hasReview ==
                                      false) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                NewReview(
                                                    order: value
                                                        .getOrders()[index])));
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value
                                                  .getOrders()[index]
                                                  .restaurant
                                                  .name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text('\$ ' +
                                                value
                                                    .getOrders()[index]
                                                    .price
                                                    .toString()),
                                            Text(value
                                                    .getOrders()[index]
                                                    .date
                                                    .day
                                                    .toString() +
                                                '/' +
                                                value
                                                    .getOrders()[index]
                                                    .date
                                                    .month
                                                    .toString())
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              value.getOrders()[index].status,
                                              style: TextStyle(
                                                  color: value
                                                              .getOrders()[
                                                                  index]
                                                              .status ==
                                                          'In progress'
                                                      ? Colors.red
                                                      : Colors.greenAccent),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: value.getOrders().length)),
                  ),
                )
              ],
            ));
      },
    );
  }
}
