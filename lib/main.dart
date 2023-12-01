import 'package:flutter/material.dart';
import 'package:ktf/providers/cart.dart';
import 'package:ktf/providers/orders.dart';
import 'package:ktf/providers/products.dart';
import 'package:ktf/screens/cart_screen.dart';
import 'package:ktf/screens/orders_screen.dart';
import 'package:ktf/screens/splash_screen.dart';
import 'package:provider/provider.dart';


void main() {
runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return 
    MultiProvider(
      providers:[
        ChangeNotifierProvider( create: (_)=> Products()),
      ChangeNotifierProvider(create: (ctx) => Cart()),
      ChangeNotifierProvider(create: (_)=> Orders())
      ] ,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
                title: 'KICK THAT FITS',
                theme: ThemeData(
  // fontFamily: 'Lato', // Uncomment this line if you want to specify a custom font family
  pageTransitionsTheme: const PageTransitionsTheme(builders: {}),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey, // Use Colors.white as MaterialColor directly
  ).copyWith(
    secondary: Colors.blue.shade800,
  ),
),

                home: const SplashScreen(),
                routes: {
                  CartScreen.routeName:(ctx)=>  CartScreen(),
                  OrdersScreen.routeName:(ctx) => OrdersScreen(),
                },              
              ),
      
    );
  }
}
