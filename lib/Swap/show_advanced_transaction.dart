import 'package:acy_ipay/Swap/counter_box.dart';
import 'package:acy_ipay/Swap/slippage_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'button_transaction.dart';

class AdvancedTransactionPage extends StatefulWidget {
  const AdvancedTransactionPage({Key? key}) : super(key: key);

  @override
  State<AdvancedTransactionPage> createState() =>
      _AdvancedTransactionPageState();
}

class _AdvancedTransactionPageState extends State<AdvancedTransactionPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    num _defaultValue = 50000;
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 10, 11, 10),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText("Gas Limit",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Counter(
                        buttonSize: 25,
                        initialValue: _defaultValue,
                        minValue: 21000,
                        maxValue: 245000,
                        step: 500,
                        onChanged: (value) {
                          // get the latest value from here
                          setState(() {
                            _defaultValue = value;
                          });
                        },
                        decimalPlaces: 0,
                        color: Color(0xE61B1D1C),
                        textStyle: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                    CustomText("Gas Price",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                    ),
                    Counter(
                        buttonSize: 25,
                        initialValue: 50000,
                        minValue: 21000,
                        maxValue: 245000,
                        step: 500,
                        onChanged: (value) {
                          // get the latest value from here
                          setState(() {
                            _defaultValue = value;
                          });
                        },
                        decimalPlaces: 0,
                        color: Color(0xE61B1D1C),
                        textStyle: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 30),
                    Divider(thickness: 0.8, color: Color(0xF24B4F4E)),
                    CustomText("Custom Nonce:",
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                            ),
                    Counter(
                        buttonSize: 25,
                        initialValue: 50000,
                        minValue: 21000,
                        maxValue: 245000,
                        step: 500,
                        onChanged: (value) {
                          // get the latest value from here
                          setState(() {
                            _defaultValue = value;
                          });
                        },
                        decimalPlaces: 0,
                        color: Color(0xE61B1D1C),
                        textStyle: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(thickness: 0.8, color: Colors.grey.shade800),
                    SlippageSelection(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SaveResetTransaction(title: "Reset"),
                        SaveResetTransaction(title: "Save"),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
