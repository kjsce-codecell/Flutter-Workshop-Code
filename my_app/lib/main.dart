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
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        backgroundImage: null,
                        ),
                        SizedBox(height: 20,),
                        Text('Jay Malave', textAlign: TextAlign.center,),
                        SizedBox(height: 20,),

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
          title: Text('Flutter WS'),
        ),
        body: Tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
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
