import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum OrderStatus { NOT_PICKED_UP, IN_PROGRESS, COMPLETED, FAILED }

extension OrderStatusTypeExtension on OrderStatus {
  String get describe => describeEnum(this).toString();

  String get name {
    switch (this) {
      case OrderStatus.NOT_PICKED_UP:
        return 'Not Picked Up';
      case OrderStatus.IN_PROGRESS:
        return 'In Progress';
      case OrderStatus.FAILED:
        return 'Failed';
      case OrderStatus.COMPLETED:
        return 'Completed';
      default:
        return "";
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.NOT_PICKED_UP:
        return const Color(0xFF1F1A6B);
      case OrderStatus.IN_PROGRESS:
        return const Color(0xffFF9C14);
      case OrderStatus.FAILED:
        return const Color(0xFFF32020);
      case OrderStatus.COMPLETED:
        return const Color(0xff35BE4A);
      default:
        return Colors.black;
    }
  }
}
