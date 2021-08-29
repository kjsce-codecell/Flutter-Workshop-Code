import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:collection/collection.dart';
import 'dart:math';

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

  late ConfettiController _controllerTopCenter;

  @override
  void initState() {
       _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getTotalCost();
    return Column(
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
         Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _controllerTopCenter,
            blastDirection: pi / 2,
            maxBlastForce: 5, // set a lower max blast force
            minBlastForce: 2, // set a lower min blast force
            emissionFrequency: 0.05,
            numberOfParticles: 50, // a lot of particles at once
            gravity: 1,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: MaterialButton(
              onPressed: () {
                _controllerTopCenter.play();
              },
              child: _display('Proceed to checkout')),
        ),
      ],
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

Text _display(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.white, fontSize: 20),
  );
}
