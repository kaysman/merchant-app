import 'package:flutter/material.dart';

void navigateTo(BuildContext context, WidgetBuilder builder) {
  Navigator.push<dynamic>(
    context,
    MaterialPageRoute<dynamic>(builder: builder),
  );
}

void hideKeyboard({BuildContext? context}) {
  if (context == null) {
    FocusManager.instance.primaryFocus?.unfocus();
  } else {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

void showSnackbar(BuildContext context, String message, {bool success = true}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: success ? Colors.black : Colors.deepOrange,
          fontSize: 14,
        ),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: "OKAY",
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
