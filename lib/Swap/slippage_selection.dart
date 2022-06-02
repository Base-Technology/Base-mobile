import 'package:flutter/material.dart';

import 'custom_radio.dart';

class SlippageSelection extends StatefulWidget {
  const SlippageSelection({Key? key}) : super(key: key);

  @override
  State<SlippageSelection> createState() => _SlippageSelectionState();
}

class _SlippageSelectionState extends State<SlippageSelection> {
  int _value = 2;

  @override
  Widget build(BuildContext context) {
    Widget slippageText = Text(
      "Your transaction will revert if the price changes unfavorably by more than this percentage.",
        style: TextStyle(
            fontSize: 12,
            fontFamily: 'Karla',
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
            color: Colors.grey.shade300)
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Slippage tolerance",
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
                color: Colors.black)),
        Padding(
          padding: _value == 1 ? const EdgeInsets.only(top: 10) : EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyRadioListTile<int>(
                value: 1,
                groupValue: _value,
                leading: '0.1%',
                needInput: false,
                onChanged: (value) => setState(() => _value = value!),
              ),
              MyRadioListTile<int>(
                value: 2,
                groupValue: _value,
                leading: '0.5%',
                needInput: false,
                onChanged: (value) => setState(() => _value = value!),
              ),
              MyRadioListTile<int>(
                value: 3,
                groupValue: _value,
                leading: '1%',
                needInput: false,
                onChanged: (value) => setState(() => _value = value!),
              ),
              MyRadioListTile<int>(
                value: 4,
                groupValue: _value,
                leading: '',
                needInput: true,
                onChanged: (value) => setState(() => _value = value!),
              ),
            ],
          ),
        ),
        _value == 1 ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Your transaction may fail",style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  color: Color(0xD9FFC000))),
            ),
            slippageText
          ],
        ) : slippageText,
      ],
    );
  }
}
