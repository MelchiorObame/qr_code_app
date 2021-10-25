// ignore_for_file: camel_case_types

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class QR_creator extends StatefulWidget {
  const QR_creator({Key? key}) : super(key: key);

  @override
  _QR_creatorState createState() => _QR_creatorState();
}

class _QR_creatorState extends State<QR_creator> {
  final textController = TextEditingController();
  late String welcomeDefaultValue =
      'https://www.google.fr/url?sa=i&url=https%3A%2F%2Fwww.objetrama.fr%2Fblog%2Fle-welcome-pack-cadeau-entreprise.html&psig=AOvVaw3h1CBLUeDPKJsBoAPp3WlU&ust=1635264048546000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCND1xLr35fMCFQAAAAAdAAAAABAD';
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer un QR code"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
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
                    onPressed: () => setState(() {
                      isFirst = false;
                    }),
                  )
                ],
              ),
              const SizedBox(height: 42),
              !isFirst
                  ? BarcodeWidget(
                      data: textController.text,
                      barcode: Barcode.qrCode(),
                      height: MediaQuery.of(context).size.width * 0.7,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BarcodeWidget(
                          data: welcomeDefaultValue,
                          color: Colors.green,
                          barcode: Barcode.qrCode(),
                          height: MediaQuery.of(context).size.width * 0.7,
                        ),
                        const Text(
                          'QRcode par défaut',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              color: Colors.green),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
