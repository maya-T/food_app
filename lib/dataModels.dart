import 'package:flutter/material.dart';
class Dish {
  String name;
  double price;
  double discount;
  String imagePath;
  String category;
  int stars;
  int numberReviews;
  int favorite =  0;
  List<Supplement> supplements;

  Dish(
      {@required this.name,
        @required this.price,
        @required this.discount,
        @required this.imagePath,
        @required this.category,
        @required this.stars,
        @required this.numberReviews,
        this.favorite,
        this.supplements,
      });
}
class OrderedDish {
  Dish dish;
  List<Supplement> selectedSupplements;
  int quantity=0;
  OrderedDish(
      {@required this.dish,
        @required this.selectedSupplements,
      });
}

class Category {
  final String name;
  final String imagePath;
  int numberItems;
  Category(
      {@required this.name,
        @required this.imagePath,
        @required this.numberItems});
}

class Supplement{

  String name;
  double price;
  double discount;
  Supplement(
      {@required this.name,
        @required this.price,
        @required this.discount,
       });
}