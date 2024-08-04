import 'package:ecommerce_with_cart/components/intro_button.dart';
import 'package:ecommerce_with_cart/models/product.dart';
import 'package:ecommerce_with_cart/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {

  const CartPage({
    super.key,
  });

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show dialog box to ask use to confirm remove from cart
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
            ),

          // yes button
          MaterialButton(
            onPressed: () { 
              // pop dialog box
              Navigator.pop(context); 

              // remove from cart
              context.read<Shop>().removeFromCart(product);
              },
            child: const Text("Yes"),
            ),
        ],
      ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
          content: Text("User wants to pay! Connect this app to your backend"),
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    // get access to cart
    final cart = context.watch<Shop>().cart;

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

      body: Column(
        children: [
          // cart List
          Expanded(
            child: cart.isEmpty ? 
            const Center(child: Text("Your Cart is Empty"),)
            : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // get individual item in cart
                final item = cart[index];

                // return as cart tile UI
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    onPressed: () => removeItemFromCart(context, item),
                    icon: const Icon(Icons.remove),
                  ),
                );
              }),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IntroButton(
                child: const Text("PAY NOW"),
                onTap: () => payButtonPressed(context),
              ),
            ),
          
          const SizedBox(height: 50.0,),
        ],
      ),

    );
  }
}