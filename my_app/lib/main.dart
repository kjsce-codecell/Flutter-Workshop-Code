import 'package:flutter/material.dart';
import 'package:my_app/screens/Cart.dart';
import 'package:my_app/screens/Home.dart';
import 'package:my_app/screens/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final Tabs = [Home(), Cart(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown, brightness: Brightness.dark),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    // color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: null,
                        ),
                        SizedBox(height: 20,),
                        Text('Jay Malave', textAlign: TextAlign.center,),
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
                Divider(color: Colors.blue,height: 1, thickness: 0.25),
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
        body: Tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.brown,
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
