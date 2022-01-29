import 'dart:ui';

import 'package:delivery/utils/providers/products_provider.dart';
import 'package:delivery/utils/providers/restaurants_provider.dart';
import 'package:delivery/views/home/bodies/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:delivery/utils/provider.dart';
import 'package:delivery/views/home/bodies/widgets/custom_list_item.dart';
import 'package:provider/provider.dart';
import 'package:delivery/views/product/index.dart';

class RestaurantsList extends StatefulWidget {
  const RestaurantsList({Key? key}) : super(key: key);

  @override
  State<RestaurantsList> createState() => _RestaurantsListState();
}

class _RestaurantsListState extends State<RestaurantsList> {
  @override
  Widget build(BuildContext context) {
    String param = '';
    Size size = MediaQuery.of(context).size;
    return Consumer<RestaurantsController>(
      builder: (BuildContext context, RestaurantsController value, _) {
        return Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Some Offers for you',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Carousel(
                    products: value.getOffers(),
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
                          return CustomTile(
                            item: value.getRestaurants()[index],
                            score: value
                                .getScore(value.getRestaurants()[index].name),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemCount: param == ''
                            ? value.getRestaurants().length
                            : value.getRestaurantFromParam(param).length)),
              ),
            )
          ],
        );
      },
    );
  }
}
