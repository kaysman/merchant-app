import 'package:flutter/material.dart';
import 'package:merchant_helper/services/orders_service.dart';
import 'package:provider/provider.dart';

import 'table_body.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: buildSearch(context)),
        SliverFillRemaining(
          child: Consumer<OrdersService>(builder: (context, state, _) {
            if (state.isLoading)
              return Center(child: CircularProgressIndicator());
            else if (state.error.isNotEmpty) {
              return Center(child: Text(state.error));
            } else {
              return TableBody(orders: state.orders);
            }
          }),
        ),
      ],
    );
  }

  buildSearch(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 6),
      width: MediaQuery.of(context).size.width - 32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            decoration: const InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
