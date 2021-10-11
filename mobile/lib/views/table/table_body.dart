import 'package:flutter/material.dart';
import 'package:merchant_helper/components/card.dart';
import 'package:merchant_helper/components/option_btn.dart';
import 'package:merchant_helper/config/data.dart';
import 'package:merchant_helper/models/order.dart';
import 'package:merchant_helper/services/orders_service.dart';
import 'package:merchant_helper/services/selecteds_service.dart';
import 'package:merchant_helper/tools/extensions.dart';
import 'package:provider/provider.dart';
import 'package:merchant_helper/config/enums.dart';
import 'delete.dart';

class TableBody extends StatefulWidget {
  const TableBody({Key? key, required this.orders}) : super(key: key);

  final List<Order> orders;

  @override
  State<TableBody> createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  late List<String> _columnNames;
  late List<Order> _tableRows;

  int _currentSortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    _columnNames = tableColumns;
    _tableRows = widget.orders;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SelectedService>(context);
    return Column(
      children: [
        buildOptions(context, state),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortColumnIndex: _currentSortColumnIndex,
              sortAscending: _sortAscending,
              onSelectAll: (v) {
                onSelectAll(v, state.selecteds);
              },
              horizontalMargin: 18,
              showCheckboxColumn: true,
              showBottomBorder: true,
              headingTextStyle: TextStyle(
                color: Colors.black45,
              ),
              columns: _columnNames.map<DataColumn>((data) {
                return DataColumn(
                  label: Text(data),
                  onSort: (i, v) {
                    setState(() {
                      _currentSortColumnIndex = i;
                      _sortAscending = !_sortAscending;
                    });
                    Provider.of<OrdersService>(context, listen: false)
                        .sortOrders(_sortAscending);
                  },
                );
              }).toList(),
              rows: _tableRows.map<DataRow>((data) {
                bool selected = state.checkItem(data);
                return DataRow(
                  selected: selected,
                  onSelectChanged: (v) {
                    onSelectChanged(v!, data);
                  },
                  cells: [
                    DataCell(CustomCard(id: data.orderId!)),
                    DataCell(Text("${data.orderDescription!}")),
                    DataCell(Text("${data.weight!}")),
                    DataCell(Text("${data.quantity!}")),
                    DataCell(Text("${data.pickupDate!}")),
                    DataCell(Text("${data.pickupAddressLine1!}")),
                    DataCell(Text("${data.pickupAddressLine2!}")),
                    DataCell(Text("${data.pickupPostalCode!}")),
                    DataCell(Text("${data.deliveryDate!}")),
                    DataCell(Text("${data.deliveryAddressLine1!}")),
                    DataCell(Text("${data.deliveryAddressLine2!}")),
                    DataCell(Text("${data.deliveryPostalCode!}")),
                    DataCell(Text("${data.customerFirstName!}")),
                    DataCell(Text("${data.customerLastName!}")),
                    DataCell(Text("${data.customerEmail!}")),
                    DataCell(Text("${data.customerPhoneNumber!}")),
                    DataCell(Text("${data.customerCompany!}")),
                    DataCell(Text("${data.merchantName!}")),
                    DataCell(
                      Text(
                        "${data.approvalStatus!.name}",
                        style: TextStyle(
                          color: data.approvalStatus!.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  onSelectAll(bool? v, List<Order> items) {
    Provider.of<SelectedService>(context, listen: false).addAll(_tableRows);
  }

  onSelectChanged(bool selected, Order order) {
    Provider.of<SelectedService>(context, listen: false).addItem(order);
  }

  buildOptions(BuildContext context, SelectedService state) {
    final totalEntries = _tableRows.length;
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          curve: Curves.easeInOutCirc,
          duration: const Duration(milliseconds: 600),
          child: state.selecteds.isEmpty
              ? Text("Showing $totalEntries entries")
              : SelectedsOptions(
                  itemsSelected: state.selecteds.length,
                  onTap: () => buildDialog(state.selecteds),
                ),
        ),
      ),
    );
  }

  buildDialog(List<Order> orders) {
    final statuses = orders.map((e) => e.approvalStatus);
    for (final element in statuses) {
      if (element != OrderStatus.NOT_PICKED_UP) {
        showSnackbar(
          context,
          "Only NOT PICKED UP orders can be deleted.",
          success: false,
        );
        return;
      }
    }

    showDialog(
      context: context,
      builder: (_) {
        return DeleteDialog(
          orders: orders,
          onDeletePressed: () => deleteSelected(orders),
        );
      },
    );
  }

  void deleteSelected(List<Order> orders) {
    Provider.of<OrdersService>(context, listen: false).removeItem(orders);
    Provider.of<SelectedService>(context, listen: false).setItems([]);
    showSnackbar(context, "Deleted ${orders.length} orders");
    Navigator.of(context).pop();
  }
}
