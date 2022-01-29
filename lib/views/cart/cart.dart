import 'package:delivery/models/cart.dart';
import 'package:delivery/models/orders.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/providers/cart_provider.dart';
import 'package:delivery/views/cart/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:delivery/db/db.dart';
import 'package:provider/provider.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({Key? key, required this.cart}) : super(key: key);
  final Cart cart;

  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 250, 1),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Consumer<CartController>(
                builder: (BuildContext context, CartController value, _) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.arrow_back)),
                          Text(widget.cart.restaurant.name),
                          const SizedBox()
                        ],
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.black))),
                          child: ListView.builder(
                              itemCount: widget.cart.products.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: size.width * .8,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            230, 230, 230, 1),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: size.width * .2,
                                            child: Image(
                                              image: AssetImage(widget
                                                  .cart
                                                  .products[index]
                                                  .product
                                                  .imageURL),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.cart.products[index]
                                                    .product.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              Text('\$ ' +
                                                  widget.cart.products[index]
                                                      .product.price
                                                      .toString()),
                                            ],
                                          ),
                                          Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: increasyDecreasyButton(
                                                widget.cart, index, value),
                                          ),
                                          const SizedBox(),
                                          IconButton(
                                              color: primaryColor(),
                                              onPressed: () {},
                                              icon: const Icon(Icons.delete))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '\$ ' + widget.cart.getPrice().toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      )),
                      Expanded(
                          child: SizedBox(
                        width: size.width * .8,
                        child: ElevatedButton(
                          onPressed: () {
                            Order order = Order(
                                widget.cart.restaurant,
                                widget.cart.getPrice(),
                                widget.cart.user,
                                widget.cart.products);
                            newOrder(order);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Buy'),
                        ),
                      ))
                    ],
                  );
                },
              )),
        ));
  }
}
