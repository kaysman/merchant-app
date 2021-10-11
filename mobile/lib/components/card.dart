import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
        child: Center(
          child: Text(
            "$id",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
