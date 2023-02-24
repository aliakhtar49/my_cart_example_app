import 'package:flutter/material.dart';
import '../widgets/MySeparator.dart';
import '../model/Cart.dart';

class CartFooter extends StatelessWidget {
  final Cart cart;
  final VoidCallback onClearCart;

  CartFooter(this.cart, this.onClearCart);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySeparator(),
        SizedBox(
          height: 20,
        ),
        Text(
          "Total =  ${cart.getTotal()}\$",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
       TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
            ),
            onPressed: onClearCart,
            child: Text(
              "CLEAR",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
      ],
    );
  }
}
