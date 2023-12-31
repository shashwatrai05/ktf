import 'package:flutter/material.dart';

import '../custom_route.dart';
import '../screens/orders_screen.dart';
//import 'package:shopapp/providers/auth.dart';
//import 'package:shopapp/screen/orders_screen.dart';
//import 'package:shopapp/screen/user_products_screen.dart';
//import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Welcome to KTF'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context)
                .pushReplacementNamed(OrdersScreen.routeName);
              Navigator.of(context).pushReplacement(
                  CustomRoute(builder: (ctx) => OrdersScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Know your Size'),
            onTap: () {
              // Navigator.of(context)
              //   .pushReplacementNamed(OrdersScreen.routeName);
              // Navigator.of(context).pushReplacement(
              //     CustomRoute(builder: (ctx) => OrdersScreen()));
            },
          ),
          const Divider(),
          /*
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              // Navigator.of(context)
              //   .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context, listen: false).logout();
            },

          )
          */
        ],
      ),
    );
  }
}
