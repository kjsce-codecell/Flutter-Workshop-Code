import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:collection/collection.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String total = '0';
  void getTotalCost() {
    List<int> costsList = [];
    costsList.addAll(MyApp.cartItems.values.map((e) => int.parse(e)));
    setState(() {
      total = costsList.sum.toString();
    });
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    getTotalCost();
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your Cart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: MyApp.cartItems.length,
            itemBuilder: (context, index) {
              return CartItem(
                cost: MyApp.cartItems.values.elementAt(index),
                order: MyApp.cartItems.keys.elementAt(index),
              );
            },
          ),
          if (MyApp.cartItems.isNotEmpty)
            Card(
              color: Colors.transparent,
              child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'TOTAL',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$$total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: _handleSignIn,
              child: Container(
                width: 500,
                margin: EdgeInsets.all(10),
                child: Text(
                  'Proceed to Checkout',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String order;
  final String cost;
  const CartItem({Key? key, required this.order, required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(order),
            Text('\$$cost'),
          ],
        ),
      ),
    );
  }
}
