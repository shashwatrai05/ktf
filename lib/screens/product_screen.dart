import 'package:flutter/material.dart';
import 'package:ktf/widgtes/product_grid.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgtes/app_drawer.dart';
import '../providers/cart.dart';
import '../widgtes/badge.dart';
import '../screens/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
   //var _showOnlyFavorites = false;
  var _isInIt = true;
  var isLoading = false;

  @override
  void initState() {
    //Provider.of<Products>(context).fetchAndSetProducts();  Won't work
    // Future.delayed(Duration.zero).then((_){
//Provider.of<Products>(context).fetchAndSetProducts();
    //  });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInIt) {
      setState(() {
        isLoading = true;
      });

      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isInIt = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('KICK THAT FITS'),
          actions: <Widget>[
          
          Consumer<Cart>(
            builder: (_, cart, ch) => Badgee(
              value: cart.itemCount.toString(),
              color: Colors.red,
              child: ch!,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
        ),
        drawer: const AppDrawer(),
        body: const ProductsGrid(),
      )
    ;
  }
}
