import 'package:ecommerce_with_cart/components/intro_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage(
    {
      super.key,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          // styling
          mainAxisAlignment: MainAxisAlignment.center,

          // elements 
          children: [
          // logo
          Icon(
            Icons.shopping_bag,
            size: 70,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          const SizedBox(height: 10,), // just to add space
        
          // title
          const Text(
            "The Grey Shop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                ),
            ),

          const SizedBox(height: 10,), // just to add space
        
          // subtitle
          Text(
            "Of Finest Quality",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 10,), // just to add space

          // button
          IntroButton(
            onTap: () => Navigator.pushNamed(context, '/shop_page'), 
            child: const Icon(Icons.arrow_forward),
            )
        ],),
      )
    );
  }
}