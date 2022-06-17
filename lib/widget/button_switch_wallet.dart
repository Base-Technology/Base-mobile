import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwitchWallet extends StatelessWidget {
  const SwitchWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          primary: Colors.white,
        ),
        child: Row(children: [
          Text(
            '0x90...2739',
            style: TextStyle(fontFamily: 'Karla', color: Colors.black),
          ),
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            "assets/icon/icon_expand.svg",
            height: 20,
            width: 15,
            color: Colors.black,
          )
        ]),
      ),
    );
  }
}
