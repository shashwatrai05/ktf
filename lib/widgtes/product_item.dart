import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
//import '../providers/products.dart';
import '../providers/cart.dart';
import '../screens/virtual_try_on.dart';
import 'package:camera/camera.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  //const ProductItem({super.key});
   CameraController? controller;
   Future<void> initializeControllerFuture = Future<void>.value();




/*
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id,this.title,this.imageUrl);
*/
  @override
  Widget build(BuildContext context) {
    final product= Provider.of<Product>(context,listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
                        padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(10),
                            width: 160,
                            height: 650,
                            decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2.0),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: <Widget>[
                                
                                Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 148,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                     Text(product.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    // IconButton(onPressed: (){
                                    //   product.togglefavouriteStatus();
                                    // }, icon: Icon(product.isFavourite
                                    //               ? Icons.favorite
                                    //               : Icons.favorite_border_outlined)),
                                                  IconButton(
                                            onPressed: () {
                                              cart.additem(product.id, product.price, product.title);
                                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: const Text('Added Item to Cart'),
                                                  duration: const Duration(seconds: 2),
                                                  action: SnackBarAction(
                                                      label: 'Undo',
                                                      onPressed: () {
                                                        cart.removeSingleItem(product.id);
                                                      }),
                                                ),
                                              );
                                            },
                                            icon: const Icon(Icons.shopping_cart),
                                            color: Theme.of(context).colorScheme.secondary,
                                          ),
                                    ],
                                     
                                  ),
                                ),
                                Text('₹${product.price}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),
                                ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VirtualTryOnPage(
          controller: controller,
          initializeControllerFuture: initializeControllerFuture,
        ),
      ),
    );
  },
  child: const Text('TRY NOW!',
  style: TextStyle(color: Colors.black),),
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.red.shade300),
  ),
)

                              ],
                            ));
  }
}