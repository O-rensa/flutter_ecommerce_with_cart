import 'package:ecommerce_with_cart/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // properties

  // products for sale
  final List<Product> _shop = [
    // product 1
    Product(
      name: "Bag",
      price: 99.99,
      description: "Item description..",
      imagePath: "assets/bag.jpeg",
    ),

    // product 2
    Product(
      name: "Bike",
      price: 99.99,
      description: "Item description..",
      imagePath: "assets/bike.jpeg",
    ),

    // product 3
    Product(
      name: "Shirts",
      price: 99.99,
      description: "Item description..",
      imagePath: "assets/shirts.jpg"
    ),

    // product 4
    Product(
      name: "Shoes",
      price: 99.99,
      description: "Item description..",
      imagePath: "assets/shoes.jpg"
    ),
  ];

  // user cart
  final List<Product> _cart = [];

  // product getter
  List<Product> get shop => _shop;

  // cart getter
  List<Product> get cart => _cart;

  // add product to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove product to cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}