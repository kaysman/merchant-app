import 'package:flutter/material.dart';
import 'package:merchant_helper/models/order.dart';

class SelectedService with ChangeNotifier {
  List<Order> _selectedRows = [];

  // SelectedService(){

  // }

  /// set selected items
  void setItems(List<Order> value) {
    this._selectedRows = value;
    notifyListeners();
  }

  /// add item
  void addItem(Order v) {
    if (!this.checkItem(v)) {
      _selectedRows.add(v);
    } else {
      _selectedRows.remove(v);
    }
    notifyListeners();
  }

  void addAll(List<Order> items) {
    if (items.length == _selectedRows.length) {
      _selectedRows = [];
    } else {
      _selectedRows = [];
      _selectedRows.addAll(items);
    }
    notifyListeners();
  }

  /// check order if already is in selecteds or not
  bool checkItem(Order v) {
    return _idList(v).contains(v.orderId);
  }

  /// get ids of all selected orders
  Iterable<String?> _idList(Order v) {
    return this._selectedRows.map<String?>((elm) => elm.orderId!);
  }

  // getters
  List<Order> get selecteds => this._selectedRows;
}
