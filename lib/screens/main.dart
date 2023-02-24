import 'package:flutter/material.dart';
import 'package:my_cart_example_app/model/Cart.dart';
import 'CatalogPage.dart';
import '../model/PetModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var cart = Cart([]);
  var ali = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  var data = [
    PetModel(
      id: "1",
      name: 'Cat 1',
      imageName: 'assets/images/cat1.jpeg',
      price: 10,
      addedToCart: false,
    ),
    PetModel(
      id: "2",
      name: 'Cat 2',
      imageName: 'assets/images/cat2.jpeg',
      price: 11,
      addedToCart: false,
    ),
    PetModel(
      id: "3",
      name: 'Cat 3',
      imageName: 'assets/images/cat3.jpeg',
      price: 12,
      addedToCart: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatalogPage(
        title: 'Pet Shop',
        data: data,
        badgeCount: cart.items.length.toString(),
        onClickedOnAdd: itemAdded,
        cart: cart,
        onClearCart: onClearCart,
      ),
    );
  }

  void onClearCart() {
    setState(() {
       cart.clear();
       data = getProducts();
    });
   
  }

  void itemAdded(PetModel selectedItem) {
    final cartModel = CartModel(
        id: selectedItem.id,
        name: selectedItem.name,
        amount: selectedItem.price);
    cart.addItem(cartModel);
     ali = true;
    setState(() {
      data = getProducts();
    });
  }

  List<PetModel> getProducts() {
    return [
      PetModel(
        id: "1",
        name: 'Cat 1',
        imageName: 'assets/images/cat1.jpeg',
        price: 10,
        addedToCart: cart.containsId("1"),
      ),
      PetModel(
        id: "2",
        name: 'Cat 2',
        imageName: 'assets/images/cat2.jpeg',
        price: 11,
        addedToCart: cart.containsId("2"),
      ),
      PetModel(
        id: "3",
        name: 'Cat 3',
        imageName: 'assets/images/cat3.jpeg',
        price: 12,
        addedToCart: cart.containsId("3"),
      ),
    ];
  }
}
