import 'package:flutter/material.dart';

class CartModel {
  final String id;
  final String name;
  final double amount;

  CartModel({required this.id, required this.name, required this.amount});
}

class Cart {
  List<CartModel> items = [];

  Cart(this.items);

  void clear() {
    items = [];
  }

  bool isEmpty() {
    return items.length <= 0;
  }

  void addItem(CartModel item) {
    items.add(item);
  }

  bool containsId(String id) {
    var exists = false;
    for (var element in items) {
      if (element.id == id) {
        exists = true;
        break;
      }
    }
    return exists;
  }

  double getTotal() {
    return items.map((e) => e.amount).reduce((value, element) => value + element);
  }

  static Cart getMockCart() {
    return Cart([
      CartModel(id: "1", name: "Cat 1", amount: 10),
      CartModel(id: "2", name: "Cat 2", amount: 10),
    ]);
  }
}
