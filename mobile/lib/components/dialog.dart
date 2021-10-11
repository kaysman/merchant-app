import 'package:flutter/material.dart';

import 'elevated_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    required this.bodyText,
    required this.confirmButtonOnPressed,
    required this.confirmButtonText,
    this.confirmButtonOnPrimary,
    this.confirmButtonPrimary,
    this.body,
    this.height,
  }) : super(key: key);

  final String title;
  final String bodyText;
  final Widget? body;
  final String confirmButtonText;
  final Color? confirmButtonPrimary;
  final Color? confirmButtonOnPrimary;
  final VoidCallback confirmButtonOnPressed;
  final double? height;

  // final String cancelButtonText;
  // final Color? cancelButtonPrimary;
  // final Color? cancelButtonOnPrimary;
  // final VoidCallback cancelButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = const EdgeInsets.fromLTRB(18, 12, 18, 12);
    return Dialog(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 40,
              padding: padding,
              color: const Color(0xff217074),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(bodyText),
              ),
            ),
            SizedBox(
              height: body == null ? 0 : height ?? size.height * 0.2,
              child: body ?? SizedBox(),
            ),
            Padding(
              padding: padding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedBtn(
                      onPressed: confirmButtonOnPressed,
                      title: confirmButtonText,
                      primary: confirmButtonPrimary,
                      onPrimary: confirmButtonOnPrimary,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedBtn(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: "Cancel",
                      primary: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
