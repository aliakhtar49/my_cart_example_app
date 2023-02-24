import 'package:flutter/material.dart';
import 'package:my_cart_example_app/model/Cart.dart';
import '../widgets/ListItem.dart';
import '../model/PetModel.dart';
import './CartPage.dart';
import 'package:badges/badges.dart' as badges;

class CatalogPage extends StatelessWidget {
  CatalogPage({super.key, required this.title, required this.data, required this.badgeCount, required this.onClickedOnAdd, required this.cart, required this.onClearCart});
  final String title;
  final String badgeCount;
  final List<PetModel> data;
  final Function onClickedOnAdd;
  final Cart cart;
  final VoidCallback onClearCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 0),
            badgeContent: Text(badgeCount),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(cart, onClearCart)),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: ((context, index) => ListItem(data[index], onClickedOnAdd)),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
