import 'package:flutter/material.dart';
import 'package:my_app/screen/MyCart.dart';
import 'package:my_app/screen/mycatalog.dart';
import 'package:my_app/screen/checkout_page.dart';
import 'package:provider/provider.dart';
import 'package:my_app/provider/shoppingcart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/cart': (context) => const MyCart(),
        '/products': (context) => const MyCatalog(),
        '/checkout': (context) => const CheckoutPage(),
      },
      home: const MyCatalog(),
    );
  }
}


