import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class ExchangeBox extends StatefulWidget {
  const ExchangeBox({Key? key}) : super(key: key);

  @override
  State<ExchangeBox> createState() => _ExchangeBoxState();
}

class NumberRemoveExtraDotFormatter extends TextInputFormatter {
  NumberRemoveExtraDotFormatter({this.decimalRange = 3})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String nValue = newValue.text;
    TextSelection nSelection = newValue.selection;

    Pattern p = RegExp(r'(\d+\.?)|(\.?\d+)|(\.?)');
    nValue = p
        .allMatches(nValue)
        .map<String>((Match match) => match.group(0).toString())
        .join();

    if (nValue.startsWith('.')) {
      nValue = '0.';
    } else if (nValue.contains('.')) {
      if (nValue.substring(nValue.indexOf('.') + 1).length > decimalRange) {
        nValue = oldValue.text;
      } else {
        if (nValue.split('.').length > 2) {
          List<String> split = nValue.split('.');
          nValue = split[0] + '.' + split[1];
        }
      }
    }

    nSelection = newValue.selection.copyWith(
      baseOffset: math.min(nValue.length, nValue.length + 1),
      extentOffset: math.min(nValue.length, nValue.length + 1),
    );

    return TextEditingValue(
        text: nValue, selection: nSelection, composing: TextRange.empty);
  }
}

class _ExchangeBoxState extends State<ExchangeBox> {
  TextEditingController tokenAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF18191C),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("USDT")),
                TextField(
                  controller: tokenAmount,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    NumberRemoveExtraDotFormatter()
                    //BlacklistingTextInputFormatter(new RegExp('[\\-|\\ ]')),
                    //WhitelistingTextInputFormatter(new RegExp('^\d+[\.\,]\d+\$')),
                  ],
                  decoration: InputDecoration(
                    hintText: "0.0",
                  ),
                  style: TextStyle(
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
