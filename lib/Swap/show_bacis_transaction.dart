import 'package:acy_ipay/Swap/button_transaction.dart';
import 'package:acy_ipay/Swap/slippage_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Widget gasText = Column(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Select higher gas price to accelerate your transaction processing time.",
        style: TextStyle(color: Colors.grey.shade600),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Divider(thickness: 0.8, color: Colors.grey.shade800),
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 10, 11, 10),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Max gas fee",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Karla',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            color: Colors.black)),
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
                                              Text(
                                                "${data.gas}",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${data.name}",
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade800),
                                              ),
                                            ],
                                          ),
                                          Text(
                                              '~' ' ' "${data.price}" ' ' "BNB")
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
              gasText,
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
