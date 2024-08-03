import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {

  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // styling

      // elements
      appBar: AppBar(
        // styling
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,

        // elements
        title: const Text(
          "Cart Page",
        ),
      ),

    );
  }
}