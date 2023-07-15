import 'package:flutter/material.dart';
import 'package:ktf/providers/cart.dart';
import 'package:ktf/providers/products.dart';
import 'package:ktf/screens/cart_screen.dart';
import 'package:ktf/screens/product_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return 
    MultiProvider(
      providers:[
        ChangeNotifierProvider(
      create: (_)=> Products()),
      ChangeNotifierProvider(create: (ctx) => Cart()),
      ] ,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
                title: 'KICK THAT FITS',
                theme: ThemeData(
                  //fontFamily: 'Lato',
                  pageTransitionsTheme: PageTransitionsTheme(builders: {
                  }),
                  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                      .copyWith(secondary: Colors.deepOrange),
                ),
                home: ProductScreen(),
                routes: {
                  CartScreen.routeName:(ctx)=> CartScreen()
                },              
              ),
      
    );
  }
}
