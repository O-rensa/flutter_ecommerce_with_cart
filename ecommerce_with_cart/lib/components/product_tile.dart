import 'package:ecommerce_with_cart/models/product.dart';
import 'package:ecommerce_with_cart/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    super.key,
    required this.product,
  });

  // add to cart button pressed
  void addToCart(BuildContext context){
    // show a dialog box to ask user to confirm add to cart
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: const Text("Add this item to your cart?"),
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

              // add to cart
              context.read<Shop>().addToCart(product);
            },
            child: const Text("Yes"),
            ),
        ]
      ));
  }

  @override
  Widget build(BuildContext context) {
    const double vMargin = 20.0;
    const double hMargin = 5.0;

    return Container(
      // style
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.only(
        top: vMargin,
        bottom: vMargin,
        left: hMargin,
        right: hMargin,
      ),
      padding: const EdgeInsets.all(25),
      width: 250,

      // elements
      child: Column(
        // styles
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
        // elements
        children: [
          Column(
            // styles
            crossAxisAlignment: CrossAxisAlignment.start,

            // elements
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  // styles
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),

                  // elements
                  child: Image.asset(product.imagePath),
                  ),
                ),

                const SizedBox(height: 25,),

              // product name
              Text(
                // styles
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),

                // elements
                product.name,
                ),

              // product description
              Text(product.description),


                ],
          ),

          // product price + add to cart button
          Row(
            // styles
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // elements
            children: [
              Text('\$${product.price.toStringAsFixed(2)}'),

              Container(
                // styles
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12.0),
                ),

                // elements
                child: IconButton(
                  onPressed: () => addToCart(context), 
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}