import 'package:delivery/models/cart.dart';
import 'package:delivery/models/cart_iten.dart';
import 'package:delivery/models/chat.dart';
import 'package:delivery/models/message.dart';
import 'package:delivery/models/orders.dart';
import 'package:delivery/models/product.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/models/review.dart';
import 'package:delivery/models/user.dart';

List<User> users = [User('Erik', '1', '1')];

Restaurant mc = Restaurant(
    name: 'McDonald',
    street: 'Rua das Flores 3',
    logoUrl: 'assets/logo.png',
    imageUrl: 'assets/mc.jpg');

Restaurant subway = Restaurant(
  name: 'Subway',
  street: 'Praça Barão vermelho 456',
  logoUrl: 'assets/logo.png',
);

Product burguer = Product(
    restaurant: mc,
    name: 'Hamburguer',
    price: 12.0,
    type: 'Sandwich',
    imageURL: 'assets/hamburguer.jpg');
Product refri = Product(
    restaurant: mc,
    name: 'Refri',
    price: 12.0,
    type: 'drink',
    imageURL: 'assets/hamburguer.jpg');
Product cake = Product(
    name: 'Cake',
    restaurant: subway,
    price: 15.0,
    type: 'Candy',
    imageURL: 'assets/cake.jpg');

List<Restaurant> listOfRestaurants = [mc, subway];

List<Order> listOfOrders = [
  Order(mc, 25.0, 'Erik', [CartIten(cake)]),
  Order(subway, 10.0, 'Morg', [CartIten(cake)]),
];

List<Product> offers = [burguer, cake];

Map<String, Cart> cartItens = {
  mc.name: Cart(mc, 'Erik', [CartIten(refri)])
};

List<Cart> cart = [
  Cart(mc, 'Erik', [CartIten(refri)])
];

List<Product> listOfProducts = [burguer, refri, cake];

List<Review> listOfReviews = [
  Review(mc, 'Erik', 4, 'cool', [CartIten(burguer)]),
  Review(mc, 'Natan', 3, 'nice', [CartIten(burguer), CartIten(refri)]),
  Review(mc, 'Morg', 3, 'quite nice', [CartIten(burguer), CartIten(refri)]),
  Review(mc, 'Melkior', 5, 'Awesome', [CartIten(burguer)]),
  Review(mc, 'Erik Natan', 2, 'poor', [CartIten(refri)]),
];

Cart addProductToCart(Product product) {
  Cart iten;
  if (cart
      .any((Cart iten) => product.restaurant.name == iten.restaurant.name)) {
    iten = cart.firstWhere(
        (Cart iten) => product.restaurant.name == iten.restaurant.name);
    iten.addProduct(product);
    return iten;
  } else {
    iten = Cart(product.restaurant, 'Erik', [CartIten(product)]);
    cart.add(iten);
    return iten;
  }
}

Chat chat1 = Chat(users[0], mc);
Chat chat2 = Chat(users[0], subway);

List<Chat> chats = [chat1, chat2];

List<Message> messages = [
  Message('restaurant', 'refrigerante?', mc, users[0]),
  Message('user', 'Não, obrigado', mc, users[0]),
  Message('restaurant', 'Olá', subway, users[0]),
  Message('restaurant', 'Olá', subway, users[0]),
];

newOrder(Order newOrder) {
  cartItens
      .removeWhere((String key, Cart value) => key == newOrder.restaurant.name);
  listOfOrders.add(newOrder);
}
