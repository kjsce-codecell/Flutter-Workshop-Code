import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 5, top: 25),
                child: Text(
                  'Good morning, Jay',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Your recent orders',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 125.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.amber[700],
                    ),
                    margin: EdgeInsets.all(10),
                    width: 125.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(),
                        SizedBox(height: 20),
                        Text('Cappuccino'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.amber[700],
                    ),
                    margin: EdgeInsets.all(10),
                    width: 125.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(),
                        SizedBox(height: 20),
                        Text('Cappuccino'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.amber[700],
                    ),
                    margin: EdgeInsets.all(10),
                    width: 125.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(),
                        SizedBox(height: 20),
                        Text('Cappuccino'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.amber[700],
                    ),
                    margin: EdgeInsets.all(10),
                    width: 125.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(),
                        SizedBox(height: 20),
                        Text('Cappuccino'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.amber[700],
                    ),
                    margin: EdgeInsets.all(10),
                    width: 125.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(),
                        SizedBox(height: 20),
                        Text('Cappuccino'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search a coffee...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
            HomeCard(order: 'test', cost: '1'),
            HomeCard(order: 'test2', cost: '2'),
            HomeCard(order: 'test3', cost: '3'),
            HomeCard(order: 'test4', cost: '4'),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String order;
  final String cost;
  const HomeCard({Key? key, required this.order, required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 500,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlutterLogo(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      order,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\$$cost'),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Order now'),
                ),
                OutlinedButton(
                  onPressed: () {
                    MyApp.cartItems.add({order: cost});
                  },
                  child: Text(
                    'Add to cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}