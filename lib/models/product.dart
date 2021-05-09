import 'dart:collection';


import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imgUrl,
    @required this.color,
  });
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: "p3",
        title: "GAMBURGER",
        description: "LAZZATNI TA'TIB KURIB HIS ET",
        price: 10000,
        imgUrl:
            'https://img3.goodfon.ru/wallpaper/nbig/a/51/fastfud-sendvich-gamburger.jpg',
        color: "0xFFFFF590"),
    Product(
        id: "p1",
        title: "SHAURMA",
        description: "LAZZATNI TA'TIB KURIB HIS ET",
        price: 18000,
        imgUrl:'https://lh3.googleusercontent.com/proxy/KVwfgZMz9GhYMCHZEgH3TLLSgK3FdVO1LHJi8eqcoySIkQdvO_s5BveH2g_hoF7oZmTP96yQiqbKjZvZsZx9wVSjqQa5fZwZHKukOx7gRNJvcsRuZSprpyczMjK8vmODOoBQpaNs',
        color: "0xFFFFF590"),
    Product(
        id: "p2",
        title: "CHIZBURGER",
        description: "LAZZATNI TA'TIB KURIB HIS ET",
        price: 15000 ,
        imgUrl: 'https://food-boom.ru/image/cache/catalog/iiko_biz/53f9da17-e40f-4332-8f16-9f47d61dbfdc-300x300.jpg',
        color: "0xFFFFF590"),
  ];

  UnmodifiableListView<Product> get item => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
