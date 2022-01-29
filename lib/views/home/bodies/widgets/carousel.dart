import 'package:delivery/models/product.dart';
import 'package:delivery/views/product/index.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  Carousel({Key? key, required this.products}) : super(key: key);
  final List<Product> products;
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 8),
      child: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: products.length,
              itemBuilder: (BuildContext context, currentIndex) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              ProductScreen(item: products[currentIndex])));
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          child: AnimatedContainer(
                            curve: Curves.easeOutQuint,
                            margin: const EdgeInsets.only(right: 30),
                            duration: const Duration(milliseconds: 1000),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        products[currentIndex].imageURL),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            left: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[currentIndex].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$ ' +
                                      products[currentIndex].price.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            )),
                      ],
                    ));
              }),
        ],
      ),
    );
  }
}
