import 'package:flutter/material.dart';

class CartModal extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    [
      "Beetroot",
      "4.00",
      "lib/images/beetroot.png",
      Colors.red,
    ],
    [
      "Bell Pepper",
      "2.00",
      "lib/images/bell-pepper.png",
      Colors.red,
    ],
    [
      "Pumpkin",
      "8.00",
      "lib/images/pumpkin.png",
      Colors.orange,
    ],
    [
      "Carrot",
      "1.00",
      "lib/images/carrot.png",
      Colors.orange,
    ],
    [
      "Ginger",
      "3.00",
      "lib/images/ginger.png",
      Colors.yellow,
    ],
    [
      "Corn",
      "5.00",
      "lib/images/corn.png",
      Colors.yellow,
    ],
    [
      "Cabbage",
      "3.00",
      "lib/images/cabbage.png",
      Colors.green,
    ],
    [
      "Cucumber",
      "3.00",
      "lib/images/cucumber.png",
      Colors.green,
    ],
  ];

  // cart
  List _cartItems = [];

  // getter
  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add item
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item
  void removeItemFromCart(int index) {
    _cartItems.removeAt(
        index); // only index because we are removing from cart list, not re fetching from actual item data
    notifyListeners();
  }

  // calculate total
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i]
          [1]); // 1 is the position of the price in the nexted array
    }
    return totalPrice.toStringAsFixed(2);
  }
}
