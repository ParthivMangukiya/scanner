import 'package:flutter/material.dart';
import 'package:scanner/model/pastresult.dart';
import 'package:intl/intl.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'result.dart';
import '../model/scanresult.dart';

const String pastResultBoxName = 'pastResultBox';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with AutomaticKeepAliveClientMixin<HistoryPage> {
  @override
  bool get wantKeepAlive => true;

  Box<PastResult> pastResultBox = Hive.box<PastResult>(pastResultBoxName);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0), child: _historyListView(context));
  }

  Widget _historyListView(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pastResultBox.listenable(),
      builder: (context, Box<PastResult> items, _) {
        List<String> keys = items.keys.cast<String>().toList();
        if (keys.isEmpty) {
          return const Center(
            child: Text('No Past Results!'),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: keys.length,
          itemBuilder: (context, index) {
            final String key = keys[index];
            final PastResult data = items.get(key) ??
                PastResult(
                    result: 'Something Went Wrong!', scanTime: DateTime.now());
            final DateFormat formatter = DateFormat('MMM dd, y H:m');
            final String formatted = formatter.format(data.scanTime);
            return ListTile(
              title: Text(data.result),
              subtitle: Text(formatted),
              onTap: () => showResult(data),
            );
          },
        );
      },
    );
  }

  //Navigate to result view
  void showResult(PastResult data) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          ResultPage(result: ScanResult(success: true, result: data.result)),
    ));
  }
}
