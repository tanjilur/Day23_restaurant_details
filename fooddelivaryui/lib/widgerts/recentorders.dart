import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddelivaryui/data/data.dart';
import 'package:fooddelivaryui/model/order.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  State<RecentOrders> createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  buildRecentOrder(Order order) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 300,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage('${order.food!.imageUrl}'),
              width: 120,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${order.food!.name}'),
                Text('${order.restaurant!.name}'),
                Text('${order.date}'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          //color: Colors.blue,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.Orders!.length,
              itemBuilder: (context, index) {
                Order order = currentUser.Orders![index];
                return buildRecentOrder(order);
              }),
        )
      ],
    );
  }
}
