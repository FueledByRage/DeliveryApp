import 'package:delivery/db/db.dart';
import 'package:delivery/models/orders.dart';
import 'package:delivery/models/product.dart';
import 'package:delivery/models/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewReview extends StatefulWidget {
  const NewReview({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  _NewReviewState createState() => _NewReviewState();
}

class _NewReviewState extends State<NewReview> {
  double stars = 0;
  String review = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                Text(widget.order.restaurant.name),
                const SizedBox()
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RatingBar(
                  allowHalfRating: false,
                  ratingWidget: RatingWidget(
                      half: const Icon(Icons.star_half),
                      full: const Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                      ),
                      empty: const Icon(Icons.star_border)),
                  onRatingUpdate: (value) {
                    stars = value;
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.order.products.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    Product item = widget.order.products[index].product;
                    return ListTile(title: Text(item.name));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (value) {
                  review = value;
                },
                decoration: InputDecoration(
                  hintText:
                      'Type your review about ${widget.order.restaurant.name}',
                ),
                maxLines: 8,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Review r = Review(widget.order.restaurant, 'user',
                      stars.toInt(), review, widget.order.products);
                  listOfReviews.add(r);
                  widget.order.sendReviews(r);
                  Navigator.of(context).pushNamed('/');
                },
                child: const Text('Review'))
          ],
        ),
      ),
    );
  }
}
