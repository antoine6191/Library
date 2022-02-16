import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class BarcodeScan extends StatefulWidget {

  @override
  _BarcodeScanState createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  String _scanBarcode = 'Inconnu';

  @override
  void initState() {
    super.initState();
  }


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Annuler', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Scanner un livre')),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => scanBarcodeNormal(),
                        child: Text('Commencer')),
                    Text('Scan result : $_scanBarcode\n',
                        style: TextStyle(fontSize: 20))
                  ]));
        }));
  }
}