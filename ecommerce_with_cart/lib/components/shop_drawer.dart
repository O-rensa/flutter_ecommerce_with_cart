import 'package:ecommerce_with_cart/components/shop_list_tile.dart';
import 'package:flutter/material.dart';

class ShopDrawer extends StatelessWidget {
  const ShopDrawer({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      // styles 
      backgroundColor: Theme.of(context).colorScheme.surface,

      // elements
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.10,
          bottom: 50.0,
        ),

        child: Column(
          // styles
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // elements
          children: [
            // drawer header
            Column(
              children: [
                Container(
                  // styles
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: Divider.createBorderSide(
                        context,
                        color: Theme.of(context).colorScheme.surface,
                      )
                    )
                  ),
                  
                  // elements
                  child: Center(
                    child: Icon(
                      // styles
                      color: Theme.of(context).colorScheme.inversePrimary,
                    
                      // elements
                      Icons.shopping_bag,
                      size: 60,
                    ),
                  ) 
                  
                ),

                const SizedBox(height: 25,), // just to add space

                // shop tile
                ShopListTile(
                  listTileTitle: "Shop", 
                  icon: Icons.home, 
                  onTap: () =>  Navigator.pop(context) // pop the drawer
                ),

                // cart tile
                ShopListTile(
                  listTileTitle: "Cart", 
                  icon: Icons.shopping_cart, 
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // go to cart page
                    Navigator.pushNamed(context, '/cart_page');
                  }
                ),

              ],
            ),

            // exit shop tile
            ShopListTile(
              listTileTitle: "Exit", 
              icon: Icons.logout, 
              onTap: () {
                // pop the drawer
                Navigator.pop(context);

                // go to intro page
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/intro_page',
                  (route) => false,
                );
              }
            ),
          ],
        ),
      )
    );
  }
}