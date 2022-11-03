import 'dart:html';

import 'package:fooddelivaryui/model/food.dart';
import 'package:fooddelivaryui/model/restaurant.dart';

class Order {
  final Restaurant? restaurant;
  final String? date;
  final Food? food;
  final int? quantity;

  Order({
    this.date,
    this.restaurant,
    this.food,
    this.quantity,
  });
}
