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
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 12, right: 25, top: 12, bottom: 12),
            width: double.infinity,
            height: 289,
            child: Image.asset(
              "assets/images/free-delivery.png",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
