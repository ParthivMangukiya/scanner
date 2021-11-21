import 'package:flutter/material.dart';

import 'qrscan.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage>
    with AutomaticKeepAliveClientMixin<ScannerPage> {
  @override
  bool get wantKeepAlive => true;

  bool showQRPage = false;

  void moveToScan() {
    setState(() {
      showQRPage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    if (!showQRPage) {
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
            padding: EdgeInsets.all(16.0),
            child: Text('Scan QR Code to view image',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.all(32.0),
            child: const Image(image: AssetImage('assets/scan_qr.png')),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.navigate_next),
            onPressed: moveToScan,
            label: const Text('Continue'),
            style: ElevatedButton.styleFrom(minimumSize: const Size.square(40)),
          )
        ],
      ),
    );
  }
}
