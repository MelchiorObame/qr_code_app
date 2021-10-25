import 'package:flutter/material.dart';
import 'package:qrcodeapp_xavier/screens/qr_creator.dart';
import 'package:qrcodeapp_xavier/screens/qr_scanner.dart';
import 'package:qrcodeapp_xavier/widgets/button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Text(
                'Bienvenue ! Cette applicatin permet de scanner et de créer des QR codes. Fait par Xavier Priva',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
            ButtonWidget(
              text: 'Créer un QR Code',
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => QR_creator(),
              )),
            ),
            const SizedBox(height: 32),
            ButtonWidget(
              text: 'Scanner un QR Code',
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => QR_scanner(),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
