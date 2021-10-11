import 'package:flutter/material.dart';
import 'package:merchant_helper/components/dialog.dart';
import 'package:merchant_helper/config/constants.dart';
import 'package:merchant_helper/config/enums.dart';
import 'package:merchant_helper/models/order.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    Key? key,
    required this.onDeletePressed,
    required this.orders,
  }) : super(key: key);

  final List<Order> orders;
  final VoidCallback onDeletePressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomDialog(
      title: "Delete Order",
      bodyText: "${orders.length} order(s) will be permanently deleted",
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
        itemCount: orders.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Order ${orders[index].orderId}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: orders[index].approvalStatus!.color,
              ),
            ),
          );
        },
      ),
      height: size.height * 0.2,
      confirmButtonText: "Delete",
      confirmButtonPrimary: const Color(0xffE55959),
      confirmButtonOnPrimary: Colors.white,
      confirmButtonOnPressed: () => buildAlertDialog(context),
    );
  }

  buildAlertDialog(BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (_) {
        return CustomDialog(
          title: "Are you sure?",
          bodyText: Constants.alert_text,
          height: 80,
          confirmButtonOnPressed: onDeletePressed,
          confirmButtonText: "Yes, delete these items",
          confirmButtonPrimary: const Color(0xffE55959),
          confirmButtonOnPrimary: Colors.white,
        );
      },
    );
  }
}
