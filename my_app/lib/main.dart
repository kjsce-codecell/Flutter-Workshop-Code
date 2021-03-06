import 'package:flutter/material.dart';
import 'package:my_app/screens/cart.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static Map<String, String> cartItems = {};
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final tabs = [Home(), Cart(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.amber, brightness: Brightness.dark),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    // color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Jay Malave',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Item 1',
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(color: Colors.blue, height: 1, thickness: 0.25),
              ListTile(
                title: Text(
                  'Item 2',
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(color: Colors.blue, height: 1, thickness: 0.25),
              ListTile(
                title: Text(
                  'Item 3',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Codecell Coffee Shop'),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.amber,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
