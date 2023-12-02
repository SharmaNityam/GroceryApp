import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  
  //lists of items on sale
  final List _shopItems = [
    // [itemName, itemPrice, imagePath, color ]
    ["Avovado", "4.00", "lib/Images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/Images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "lib/Images/chicken.png", Colors.brown],
    ["Water", "1.00", "lib/Images/water.png", Colors.blue],
  ];

  // list of cart items
  final List _cartItems = [];
  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add items to cart
  void addItemToCart( int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemToCart( int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i=0; i<cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}