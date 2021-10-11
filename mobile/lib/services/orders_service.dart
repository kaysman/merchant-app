import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merchant_helper/config/enums.dart';
import 'package:merchant_helper/models/order.dart';
import 'package:merchant_helper/repository/get_orders_repo.dart';

class OrdersService with ChangeNotifier {
  bool isLoading = true;
  String error = "";
  List<Order> orders = [];

  OrdersService() {
    this.getOrders();
  }

  getOrders() async {
    try {
      var response = await GetOrdersRepository.getOrdersRepository();
      orders = response;
    } on SocketException {
      error = "Network Issue. Please check your internet and try again";
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  sortOrders(bool value) {
    if (value) {
      orders.sort((a, b) => b.orderId!.compareTo(a.orderId!));
    } else {
      orders.sort((a, b) => a.orderId!.compareTo(b.orderId!));
    }
    this.notifyListeners();
  }

  /// remove item
  void removeItem(List<Order> items) {
    print(orders.length);
    var toRemove = [];
    items.forEach((element) => toRemove.add(element.orderId));
    orders.removeWhere((item) => toRemove.contains(item.orderId));
    print(orders.length);
    notifyListeners();
  }

  int filterByStatus(OrderStatus status) {
    final list = orders.where((element) => element.approvalStatus == status);
    return list.length;
  }
}
