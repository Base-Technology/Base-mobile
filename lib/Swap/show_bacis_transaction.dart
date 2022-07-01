import 'package:acy_ipay/Swap/button_transaction.dart';
import 'package:acy_ipay/Swap/slippage_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'package:acy_ipay/widget/CustomText.dart';

class BasicTransactionPage extends StatefulWidget {
  const BasicTransactionPage({Key? key}) : super(key: key);

  @override
  State<BasicTransactionPage> createState() => _BasicTransactionPageState();
}

class OptionList {
  String name;
  int gas;
  int index;
  double price;
  OptionList(
      {required this.name,
      required this.gas,
      required this.index,
      required this.price});
}

class _BasicTransactionPageState extends State<BasicTransactionPage> {
  // Default Radio Button Item
  String speed = 'Regular';

  // Group Value for Radio Button.
  int id = 1;

  List<OptionList> optList = [
    OptionList(name: "Super Fast", gas: 20, index: 1, price: 0.01),
    OptionList(name: "Fast", gas: 6, index: 2, price: 0.003),
    OptionList(name: "Regular", gas: 5, index: 3, price: 0.0025),
    OptionList(name: "Slow", gas: 5, index: 4, price: 0.0025),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                    CustomText("Max gas fee",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 0,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.start,
                        children: optList
                            .map((data) => SizedBox(
                                  width: 136,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Transform.scale(
                                        scale: 1.25,
                                        child: Radio(
                                            activeColor: Color(0xFFFFC000),
                                            value: data.index,
                                            groupValue: id,
                                            onChanged: (val) {
                                              setState(() {
                                                id = data.index;
                                              });
                                            }),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                "${data.gas}",
                                                fontSize: 12,
                                              ),
                                              SizedBox(width: 5,),
                                              CustomText(
                                                "${data.name}",
                                                fontSize: 12,
                                              )
                                            ],
                                          ),
                                          CustomText(
                                              '~' ' ' "${data.price}" ' ' "BNB",
                                              fontSize: 12,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Select higher gas price to accelerate your transaction processing time.",
                    style: TextStyle(color: themeProvider.isDarkMode ? Color(0xF2949695): Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Divider(thickness: 0.8, color: themeProvider.isDarkMode ? Color(0xF24B4F4E) : Colors.black),
                )
              ]),
              SlippageSelection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SaveResetTransaction(title: "Reset"),
                  SaveResetTransaction(title: "Save"),
                ],
              )
            ],
          )),
    );
  }
}
