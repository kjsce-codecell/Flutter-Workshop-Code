import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.amber,
          backgroundColor: Colors.black,
          brightness: Brightness.dark),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              Card(
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Latte'),
                      Text('\$5.00'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Mocha'),
                      Text('\$5.00'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Irish'),
                      Text('\$5.00'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Frappe'),
                      Text('\$5.00'),
                    ],
                  ),
                ),
              ),
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
                        '\$20.00',
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
                  onPressed: () {},
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
        ),
      ),
    );
  }
}
