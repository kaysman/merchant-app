import 'package:flutter/foundation.dart';

class IndexProvider with ChangeNotifier {
  // initial tab index
  int _selectedItem = 0;

  // getter
  int get getSelectedIndex => this._selectedItem;

  // setter
  set setSelectedIndex(int value) {
    this._selectedItem = value;
    notifyListeners();
  }

  resetRoutes() {
    _selectedItem = 0;
    notifyListeners();
  }
}
