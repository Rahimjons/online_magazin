import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Card {
  final String id;
  final String title;
  final int number;
  final num price;
  final String imgUrl;

  Card({
    @required this.id,
    @required this.title,
    @required this.number,
    @required this.price,
    @required this.imgUrl,
  });
}

class CardDataProvider with ChangeNotifier {
  Map<String, Card> _cardItems = {};

  UnmodifiableMapView<String, Card> get cartItems =>
      UnmodifiableMapView(_cardItems);

  int get carItemsCount => _cardItems.length;

  double get totalAmount {
    var total = 0.0;
    _cardItems.forEach((key, item) {
      total += item.price * item.number;
    });
    return total;
  }

  void addItem({productId, price, title, imgUrl}) {
    if (_cardItems.containsKey(productId)) {
      cartItems.update(
        productId,
        (ex) => Card(
          id: ex.id,
          title: ex.title,
          number: ex.number + 1,
          price: ex.price,
          imgUrl: ex.imgUrl,
        ),
      );
    } else {
      cartItems.putIfAbsent(
        productId,
        () => Card(
          id: '${DateTime.now()}',
          title: title,
          number: 1,
          price: price,
          imgUrl: imgUrl,
        ),
      );
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cardItems.remove(productId);
    notifyListeners();
  }

  void updateItemsAddOne(String productId) {
    cartItems.update(
      productId,
      (ex) => Card(
        id: ex.id,
        title: ex.title,
        number: ex.number + 1,
        price: ex.price,
        imgUrl: ex.imgUrl,
      ),
    );
    notifyListeners();
  }

  void updateItemsSubOne(String productId) {
    if (_cardItems[productId].number < 2) {
      deleteItem(productId);
    } else {
      cartItems.update(
        productId,
        (ex) => Card(
          id: ex.id,
          title: ex.title,
          number: ex.number - 1,
          price: ex.price,
          imgUrl: ex.imgUrl,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _cardItems = {};
    notifyListeners();
  }
}
