import 'package:delivery/models/product.dart';
import 'package:delivery/views/product/index.dart';
import 'package:flutter/material.dart';

class CustomTileProduct extends StatelessWidget {
  const CustomTileProduct({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductScreen(
                    item: item,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: Image.asset(item.imageURL)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text('\$ ' + item.price.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 102, 0, 1)))
                      ],
                    )),
                const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
