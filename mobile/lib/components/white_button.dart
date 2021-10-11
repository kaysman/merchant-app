import 'package:flutter/material.dart';

class WhiteOptionButton extends StatelessWidget {
  const WhiteOptionButton({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor ?? Theme.of(context).primaryColor,
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
