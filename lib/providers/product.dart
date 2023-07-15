import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false,
  });

  void togglefavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
