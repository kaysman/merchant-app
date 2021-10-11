import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:merchant_helper/config/enums.dart';
import 'package:merchant_helper/services/orders_service.dart';
import 'package:provider/provider.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Consumer<OrdersService>(builder: (context, state, _) {
        if (state.isLoading)
          return Center(child: CircularProgressIndicator());
        else if (state.error.isNotEmpty) {
          return Center(child: Text(state.error));
        } else {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: StatisticsCard(
                        status: OrderStatus.NOT_PICKED_UP,
                      ),
                    ),
                    Expanded(
                      child: StatisticsCard(
                        status: OrderStatus.IN_PROGRESS,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: StatisticsCard(
                        status: OrderStatus.FAILED,
                      ),
                    ),
                    Expanded(
                      child: StatisticsCard(
                        status: OrderStatus.COMPLETED,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({Key? key, required this.status}) : super(key: key);

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<OrdersService>(context);
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      color: status.color.withOpacity(0.8),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "${state.filterByStatus(status)}",
                style: TextStyle(
                  fontSize: 72,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            status.name,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
