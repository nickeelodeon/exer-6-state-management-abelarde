import 'package:flutter/material.dart';
import '../model/Item.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  if (context.watch<ShoppingCart>().cart.isNotEmpty) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showProductList(context),
          showTotal(context),
          const Divider(height: 4, color: Colors.black),
          Flexible(
            child: TextButton(
              onPressed: () {
                context.read<ShoppingCart>().removeAll();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Payment Successful"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text("Pay Now"),
            ),
          ),
        ],
      ),
    );
  } else {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: const Center(
        child: Text("No items left"),
      ),
    );
  }
}


  Widget showProductList(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.food_bank),
            title: Text(products[index].name),
            trailing: Text('\$${products[index].price}'),
          );
        },
      ),
    );
  }

  Widget showTotal(BuildContext context) {
    double total = context.watch<ShoppingCart>().cartTotal;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Total: \$$total",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

