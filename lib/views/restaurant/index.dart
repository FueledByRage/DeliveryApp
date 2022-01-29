import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/provider.dart';
import 'package:delivery/utils/providers/products_provider.dart';
import 'package:delivery/views/restaurant/bodies/home.dart';
import 'package:delivery/views/restaurant/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);
  final Restaurant restaurant;

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<Widget> bodies = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => Controller(),
          child: Consumer<ProductController>(
              builder: (BuildContext context, ProductController value, _) {
            List<Product> res =
                value.getProductsFromRestaurant(widget.restaurant.name);
            return NestedScrollView(
              headerSliverBuilder: (context, conditional) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    foregroundColor: primaryColor(),
                    expandedHeight: size.height * 0.3,
                    centerTitle: true,
                    title: Text(widget.restaurant.name),
                    flexibleSpace: FlexibleSpaceBar(
                      background: widget.restaurant.imageUrl != ''
                          ? Image.asset(
                              widget.restaurant.imageUrl,
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Text(
                                  'There is no image for this restaurant!')),
                    ),
                  )
                ];
              },
              body: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: res.isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTileProduct(item: res[index]),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemCount: res.length)
                          : const Center(
                              child: Text(
                                  'This restaurant has not registered any product yet!'))),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
