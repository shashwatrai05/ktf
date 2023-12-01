import 'package:flutter/material.dart';
import 'package:ktf/screens/product_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ImageProvider logo = const AssetImage('assets/logo.png');
  gotoHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductScreen(),
        ));
  }
  @override
  void initState() {
    super.initState();
    gotoHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: logo,
              height: 128,
            ),
          )
        ],
      ),
    );
  }
}