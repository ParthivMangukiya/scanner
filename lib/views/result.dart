import 'package:flutter/material.dart';

import 'package:scanner/helper/scanresult.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, this.result}) : super(key: key);

  final ScanResult? result;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _resultView(),
    );
  }

  Widget _resultView() {
    if (result?.success == false) {
      return _failureView();
    }
    return _successView();
  }

  Widget _successView() {
    if (result == null) {
      return const Expanded(
          flex: 1,
          child: Center(
            child: Text('Past Scan Results'),
          ));
    }
    return Expanded(
        flex: 1,
        child: Center(
          child: Image.network('https://picsum.photos/250?image=9'),
        ));
  }

  Widget _failureView() {
    return Expanded(
        flex: 1,
        child: Center(
          child: Text(result?.failure ?? 'Something went wrong!'),
        ));
  }
}
