import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const Map<String, String> allItemsMap = {
    'test': '1',
    'test2': '2',
    'test3': '3',
    'test4': '4',
    'test5': '5',
    'test6': '6',
    'test7': '7'
  };
  Map<String, String> allItems = Map.from(allItemsMap);
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
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allItems.length,
                  itemBuilder: (context, index) {
                    return RecentCard(
                        cost: allItems.values.elementAt(index),
                        order: allItems.keys.elementAt(index));
                  }),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  onSubmitted: (valuee) {
                    valuee.isEmpty
                        ? allItems = allItemsMap
                        : allItems.containsKey(valuee)
                            ? allItems
                                .removeWhere((key, value) => key != valuee)
                            : null; //remove searched value and hit enter to get original list back.
                    setState(() {});
                  },
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
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: allItems.length,
                itemBuilder: (context, index) {
                  return HomeCard(
                      cost: allItems.values.elementAt(index),
                      order: allItems.keys.elementAt(index));
                }),
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
                  Image(
                    image: AssetImage('assets/images/frappe.png'),
                    height: 75,
                  ),
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
                    MyApp.cartItems[order] = cost;
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

class RecentCard extends StatelessWidget {
  final String order;
  final String cost;
  const RecentCard({Key? key, required this.order, required this.cost})
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
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                    image: AssetImage('assets/images/frappe.png'),
                    height: 50,
                  ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    order,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('\$$cost'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
