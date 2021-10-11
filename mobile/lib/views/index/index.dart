import 'package:flutter/material.dart';
import 'package:merchant_helper/config/assets.dart';
import 'package:merchant_helper/config/constants.dart';
import 'package:merchant_helper/services/index_service.dart';
import 'package:merchant_helper/views/analytics/analytics.dart';
import 'package:merchant_helper/views/table/table_page.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      TablePage(),
      Container(
        color: Colors.yellow,
        child: Center(
          child: Text("Map"),
        ),
      ),
      AnalyticsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: [
            PngIcons.logo,
            const SizedBox(width: 12),
            const Text("Load and Go"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff35B8BE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: (i) {
          if (i == 0 || i == 2) {
            setState(() => indexProvider.setSelectedIndex = i);
          }
        },
        currentIndex: indexProvider.getSelectedIndex,
        items: Constants.bottomNavBarData.map<BottomNavigationBarItem>((item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            label: item.label,
          );
        }).toList(),
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.bounceIn,
          child: pages[indexProvider.getSelectedIndex],
        ),
      ),
    );
  }
}
