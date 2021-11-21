import 'package:flutter/material.dart';

import 'package:scanner/model/scanresult.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, this.result}) : super(key: key);

  final ScanResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: Center(
          child: _resultView(),
        ));
  }

  Widget _resultView() {
    if (result?.success == false) {
      return _failureView();
    }
    return _successView();
  }

  Widget _successView() {
    if (result != null && result?.result != null) {
      return Image.network(result!.result!);
    }
    return _failureView();
  }

  Widget _failureView() {
    return Text(result?.failure ?? 'Something went wrong!');
  }
}
