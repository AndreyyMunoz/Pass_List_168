import 'package:flutter/material.dart';
import 'package:past_list/qr_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.code, required this.closeScreen});

  final Object code;
  final Function() closeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            closeScreen();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        title: const Text("QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: code.toString(),
              version: QrVersions.auto,
              size: 175.0,
              errorStateBuilder: (cxt, err) {
                return const Center(
                  child: Text(
                    'Uh oh! Parece que algo salió mal...',
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            const Text("Scaneo completado",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("$code",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 48,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {},
              child: const Text("Confirmar Asistencia",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}