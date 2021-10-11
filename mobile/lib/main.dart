import 'package:flutter/material.dart';
import 'package:merchant_helper/config/constants.dart';
import 'package:merchant_helper/services/index_service.dart';
import 'package:provider/provider.dart';

import 'components/unfocus.dart';
import 'services/orders_service.dart';
import 'services/selecteds_service.dart';
import 'views/index/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) {
        return IndexProvider();
      }),
      ChangeNotifierProvider(create: (_) {
        return OrdersService();
      }),
      ChangeNotifierProvider(create: (_) {
        return SelectedService();
      }),
    ],
    child: const MerchantApp(),
  ));
}

class MerchantApp extends StatelessWidget {
  const MerchantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merchant TMS',
      theme: Constants.lightTheme(),
      builder: (context, child) => Unfocus(child: child!),
      home: const IndexPage(),
    );
  }
}
