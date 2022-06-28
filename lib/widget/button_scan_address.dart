import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanAddress extends StatefulWidget {
  const ScanAddress({Key? key}) : super(key: key);

  @override
  State<ScanAddress> createState() => _ScanAddressState();
}

class _ScanAddressState extends State<ScanAddress> {
  String qrCode = '';
  @override
  Widget build(BuildContext context) {
    Future<void> scanQrCode() async {
      try {
        final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ffffff',
          "Cancel",
          true,
          ScanMode.QR,
        );
        if (!mounted) return;
        setState(() {
          this.qrCode = qrCode.isEmpty
              ? ''
              : qrCode == '-1'
                  ? ''
                  : qrCode;
        });
      } on PlatformException {
        qrCode = 'Failed to get platform version';
      }
    }

    return IconButton(
      onPressed: scanQrCode,
      icon: Icon(
        Icons.qr_code_scanner_outlined,
        size: 25,
        color: Colors.black,
      ),
    );
  }
}
