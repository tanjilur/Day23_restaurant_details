import 'package:flutter/cupertino.dart';
import 'package:fooddelivaryui/model/order.dart';

class User {
  final String? name;
  final List<Order>? Orders;
  final List<Order>? cart;

  User({
    this.name,
    this.Orders,
    this.cart,
  });
}
