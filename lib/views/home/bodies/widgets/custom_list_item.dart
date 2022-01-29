import 'package:delivery/models/restaurant.dart';
import 'package:delivery/views/restaurant/index.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key, required this.item, required this.score})
      : super(key: key);

  final Restaurant item;
  /*final String image;
  final String title;
  final String subtitle;
  final Widget trailing;*/
  final double score;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RestaurantScreen(restaurant: item)));
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: Image.asset(item.logoUrl)),
                  Expanded(
                      flex: 3,
                      child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                item.street,
                                style: const TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ))),
                  Column(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(score.toStringAsFixed(1))
                    ],
                  )
                ],
              ))),
    );
  }
}
