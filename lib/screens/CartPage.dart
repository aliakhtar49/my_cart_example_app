import 'package:my_cart_example_app/model/Cart.dart';
import '../widgets/CartItem.dart';
import '../widgets/CartFooter.dart';

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  Cart cart;
  final VoidCallback onClearCart;

  CartPage(this.cart, this.onClearCart);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.blue,
        child: cart.isEmpty() 
        ? Center(child: Text('No cart Item'),) 
        : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             ...cart.items.map((e) {
              return CartItem(e.name);
            }).toList(),
             CartFooter(cart, onClearCart),
          ],
        ),
      ),
    );
  }
}
