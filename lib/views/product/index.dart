import 'package:delivery/db/db.dart';
import 'package:delivery/models/cart.dart';
import 'package:delivery/models/product.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/providers/cart_provider.dart';
import 'package:delivery/utils/providers/user_provider.dart';
import 'package:delivery/views/cart/cart.dart';
import 'package:delivery/views/product/widgets/icon_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Text(
                  widget.item.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Consumer<UserController>(
                    builder: (BuildContext context, UserController value, _) {
                  return IconButton(
                      onPressed: () {
                        value.setFavourite(widget.item);
                      },
                      icon: Icon(
                        value.isFavourite(widget.item)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: primaryColor(),
                      ));
                })
              ],
            ),
            SizedBox(
              width: size.width * 0.6,
              child: Image.asset(widget.item.imageURL),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '\$ ' + widget.item.price.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size.width * .8,
              child: Consumer<CartController>(
                builder: (BuildContext context, CartController value, _) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                        onPressed: () {
                          Cart cart = addProductToCart(widget.item);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CartDetails(cart: cart)));
                        },
                        child: const Icon(Icons.shopping_cart)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: size.width * .85,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      iconRow(widget.item.restaurant.name, Icons.restaurant,
                          primaryColor()),
                      iconRow(widget.item.type, Icons.restaurant_menu,
                          secondaryColor()),
                      iconRow(widget.item.getScore(), Icons.star, Colors.yellow)
                    ],
                  )),
            )
          ],
        ),
      )),
    );
  }
}
