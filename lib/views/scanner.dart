import 'package:flutter/material.dart';

import 'qrscan.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  bool showQRPage = false;

  void moveToScan() {
    setState(() {
      showQRPage = true;
    });
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => QRScanPage(),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    if (showQRPage) {
      return _welcome();
    } else {
      return QRScanPage();
    }
  }

  Widget _welcome() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Scan QR Code to view image',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(onPressed: moveToScan, child: const Text('Continue')),
        ],
      ),
    );
  }
}
