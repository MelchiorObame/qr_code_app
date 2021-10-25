import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class QR_scanner extends StatefulWidget {
  const QR_scanner({Key? key}) : super(key: key);

  @override
  _QR_scannerState createState() => _QR_scannerState();
}

// ignore: camel_case_types
class _QR_scannerState extends State<QR_scanner> {
  String _qrCodeData = "codeQR";
  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Terminer', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _qrCodeData = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Terminer', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _qrCodeData = barcodeScanRes;
    });
  }

  void _launchURL() async => await canLaunch(_qrCodeData)
      ? await launch(_qrCodeData)
      : throw 'impossible de lancer ce lien : $_qrCodeData';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("scanner un QRcode"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            alignment: Alignment.center,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => scanBarcodeNormal(),
                    child: const Text('Scanner un CodeBar')),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => scanQR(),
                  child: const Text('Scanner un QRcode'),
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: "Resultat (cliquer pour ouvrir le lien) :   ",
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                    children: [
                      TextSpan(
                        text: _qrCodeData,
                        style: const TextStyle(
                            color: Colors.blue, fontStyle: FontStyle.italic),
                        recognizer: TapGestureRecognizer()..onTap = _launchURL,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
