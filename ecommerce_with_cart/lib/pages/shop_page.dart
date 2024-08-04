import 'package:ecommerce_with_cart/components/product_tile.dart';
import 'package:ecommerce_with_cart/components/shop_drawer.dart';
import 'package:ecommerce_with_cart/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {

  const ShopPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
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
          "Shop Page",
        ),

        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'), 
            icon: const Icon(Icons.shopping_cart_outlined),
            )
        ],

      ),

      drawer: const ShopDrawer(),

      body:  ListView(
        children: [
          // elements
          const SizedBox(height: 25,),

          // shop subtitle
          Center(
            child: Text(
              "Pick from selected list of products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              )
            ),
          ),

          // product List
          SizedBox(
            // styles
            height: 470,

            // elements
            child:  ListView.builder(
              itemCount: products.length,

              // styles
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                // get each individual product from shop
                final product = products[index];

                // return as a product tile UI
                return ProductTile(product: product);
              },
            ),
          )

      ],)

    );
  }
}