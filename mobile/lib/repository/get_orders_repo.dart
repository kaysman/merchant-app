import 'package:merchant_helper/config/request.dart';
import 'package:merchant_helper/models/order.dart';

class GetOrdersRepository {
  static Future<List<Order>> getOrdersRepository() async {
    try {
      var response = await DioRequest().get("orders");

      List<Order> list = [];

      for (final item in List.castFrom(response)) {
        if (item.isNotEmpty) {
          var map = item;
          map['approval_status'] = map["approval_status"].toUpperCase();
          list.add(Order.fromJson(map));
        }
      }

      return list;
    } catch (e) {
      throw e;
    }
  }
}
