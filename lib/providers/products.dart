//import 'dart:convert';
//import 'dart:io';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier{
   List<Product> _items = [
    /*
    Product(
      id: 'p1',
      title: 'Nike',
      price: 29.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),
    Product(
      id: 'p2',
      title: 'Nike',
      price: 59.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),
    Product(
      id: 'p3',
      title: 'Nike',
      price: 19.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),
    Product(
      id: 'p4',
      title: 'Nike',
      price: 49.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),

     Product(
      id: 'p5',
      title: 'Nike',
      price: 19.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),

     Product(
      id: 'p6',
      title: 'Nike',
      price: 19.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),

     Product(
      id: 'p7',
      title: 'Nike',
      price: 19.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),

     Product(
      id: 'p8',
      title: 'Nike',
      price: 19.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),
    Product(
      id: 'p9',
      title: 'Nike',
      price: 19.99,
      imageUrl:
          'https://cdn.sanity.io/images/c1chvb1i/production/a670be5a9cebda50533600d43605f04b3ef52a8b-784x745.jpg/ratio-2.jpg?fm=webp',
    ),
    */

    ];

   //final String authTokens;
  //final String userId;
  //Products(this.authTokens, this.userId, this._items);

//var _showFavoritesOnly=false;
  List<Product> get items {
    //  if(_showFavoritesOnly){
//return _items.where((ProductItem) => ProductItem.isFavourite).toList();}
    return [..._items];
  }

  List<Product> get favouriteItem {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }


   Future<void> fetchAndSetProducts() async {
    //[bool filterByUser = false]
   // final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
   // var url =
     //   'https://shopping-app-ce5f7-default-rtdb.firebaseio.com/products.json?auth=$authTokens&$filterString';
    try {
      var url =
          'https://kick-that-fits-adccc-default-rtdb.firebaseio.com/products.json';
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          price: prodData['price'].toDouble(),
         // isFavourite:
           //   favoriteData == null ? false : favoriteData[prodId] ?? false,
          imageUrl: prodData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}