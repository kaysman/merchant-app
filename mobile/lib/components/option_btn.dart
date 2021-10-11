import 'package:flutter/material.dart';
import 'white_button.dart';

class SelectedsOptions extends StatelessWidget {
  const SelectedsOptions({
    Key? key,
    required this.itemsSelected,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final int itemsSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$itemsSelected entry selected"),
        Spacer(),
        if (itemsSelected == 1)
          WhiteOptionButton(
            icon: Icons.edit,
            title: "Edit",
          ),
        WhiteOptionButton(
          icon: Icons.delete,
          title: "Delete",
          iconColor: const Color(0xffE55959),
          onTap: onTap,
        ),
      ],
    );
  }
}
