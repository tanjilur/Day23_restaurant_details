import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddelivaryui/data/data.dart';
import 'package:fooddelivaryui/model/restaurant.dart';
import 'package:fooddelivaryui/widgerts/rastaurentdetails.dart';
import 'package:fooddelivaryui/widgerts/recentorders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestaurant() {
    List<Widget> restaurantList = [];

    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RastautantDetails(
              restaurant: restaurant,
            ),
          ));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Image(
                    image: AssetImage('${restaurant.imageUrl}'),
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${restaurant.name}'),
                  Text('${restaurant.address}'),
                  Text('0.3 miles'),
                ],
              )
            ],
          ),
        ),
      ));
    });

    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Zone"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                '(${currentUser.cart!.length})',
                style: TextStyle(color: Colors.white),
              ))
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            suffixIcon: Icon(Icons.close),
          )),
          Text("Recent Orders..."),
          RecentOrders(),
          Column(
            children: [
              Text("Near By Restaurant"),
              buildRestaurant(),
            ],
          )
        ],
      ),
    );
  }
}
