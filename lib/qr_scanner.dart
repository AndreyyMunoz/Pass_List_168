import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:past_list/result_qr_screen.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;
  bool isFlashOn = false;
  MobileScannerController controller = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFlashOn = !isFlashOn;
              },
            );
            controller.toggleTorch();
          },
          icon: Icon(Icons.flash_on, color: isFlashOn ?Colors.yellow: Colors.grey,))
        ],
        centerTitle: true,
        title: const Text(
          "Scanner de QR",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Por favor enfoca el código QR",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "El escaneo comenzará automaticamente.",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    MobileScanner(
                      scanWindow: Rect.fromCenter(center: const Offset(8, 12), width: 100.0, height: 50.0),
                      controller: controller,
                      onDetect: (barcode) {
                        if (!isScanCompleted) {
                          Object? code = barcode.raw;
                          code.toString();
                          isScanCompleted = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                code: code.toString(),
                                closeScreen: () {
                                  closeScreen();
                                },
                              ),
                            ),
                          );
                        }
                      },
                      //   overlayBuilder: (context, scanArea) {
                      //     return Center(
                      //       child: SizedBox(
                      //         width: scanArea.maxWidth * 0.7,
                      //         height: scanArea.maxHeight * 0.7,
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             border: Border.all(
                      //               color: Colors.red,
                      //               width: 5,
                      //             ),
                      //           borderRadius: BorderRadius.circular(10), // Redondea las esquinas
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // },
                    ),
                  ],
                ),
              ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: const Text(
                "Desarrollado por Devo Software Inc.",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  letterSpacing: 0.7,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
