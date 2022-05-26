import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwitchWallet extends StatelessWidget {
  const SwitchWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          primary: Color(0xE64B4F4E),
        ),
        child: Row(children: [
          Text('0x90...2739'),
          SizedBox(
            width: 10,
          ),
          FaIcon(
            FontAwesomeIcons.angleDown,
            size: 20.0,
          ),
        ]),
      ),
    );
  }
}
