import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  // properties
  final void Function()? onTap;
  final Widget child;

  const IntroButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      )
    );
  }
}