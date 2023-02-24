import 'package:flutter/material.dart';


class CartItem extends StatelessWidget {
  CartItem(this.name);
  final String name;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
