import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: NetworkImage(
                          'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                    ),
                  ),
                  Text(
                    "Jay Malave",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    "jay.malave73@gmail.com",
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  ListTile(
                    leading: Text(
                      "Address ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "Dummy Address",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      "Phone    ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "Dummy Phone",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Edit Profile'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Order History'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Log Out'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
