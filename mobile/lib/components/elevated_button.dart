import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn({
    Key? key,
    required this.title,
    required this.onPressed,
    this.primary,
    this.onPrimary,
  }) : super(key: key);

  final String title;
  final Color? primary;
  final Color? onPrimary;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
      style: ElevatedButton.styleFrom(
        primary: primary,
        onPrimary: onPrimary,
        padding: EdgeInsets.symmetric(
          vertical: 12,
        ),
      ),
    );
  }
}
