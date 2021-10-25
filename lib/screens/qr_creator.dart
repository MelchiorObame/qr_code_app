import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class QR_creator extends StatefulWidget {
  const QR_creator({Key? key}) : super(key: key);

  @override
  _QR_creatorState createState() => _QR_creatorState();
}

class _QR_creatorState extends State<QR_creator> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer un QR code"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        labelText: "infos à encoder",
                        helperText:
                            "Veillez saisir les informations à encoder ici",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.done, size: 30),
                    onPressed: () => setState(() {}),
                  )
                ],
              ),
              const SizedBox(height: 42),
              BarcodeWidget(
                data: textController.text,
                barcode: Barcode.qrCode(),
                height: MediaQuery.of(context).size.width * 0.7,
              )
            ],
          ),
        ),
      ),
    );
  }
}
