import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key, required this.history}) : super(key: key);

  final List<String> history;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0), child: _historyListView(context));
  }

  Widget _historyListView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: history.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(history[index]),
        );
      },
    );
  }
}
