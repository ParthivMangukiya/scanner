import 'package:flutter/material.dart';

import 'views/scanner.dart';
import 'views/history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  String _title = 'Scan QR';

  final tabBarTitle = ['Scan QR', 'Result'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                _title = tabBarTitle[tabController.index];
              });
            }
          });
          return Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.qr_code)),
                  Tab(icon: Icon(Icons.list))
                ],
              ),
              title: Text(_title),
            ),
            body: const TabBarView(
              children: <Widget>[
                ScannerPage(),
                HistoryPage(history: ['A', 'B']),
              ],
            ),
          );
        }),
      ),
    );
  }
}
