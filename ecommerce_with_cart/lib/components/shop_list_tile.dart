import 'package:flutter/material.dart';

class ShopListTile extends StatelessWidget {
  final String listTileTitle;
  final IconData icon;
  final void Function()? onTap;

  const ShopListTile({
    super.key,
    required this.listTileTitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // styles

      // elements
      leading: Icon(
        // styles
        color: Colors.grey,

        // elements
        icon
      ),
      title: Text(listTileTitle),

      onTap: onTap
    );
  }
}