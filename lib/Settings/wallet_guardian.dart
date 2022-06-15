import 'dart:typed_data';

import 'package:acy_ipay/Settings/add_guardian_manually.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletGuardian extends StatelessWidget {
  const WalletGuardian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget topBar = Container(
      padding: const EdgeInsets.only(top: 25),
      margin: const EdgeInsets.only(bottom: 15),
      color: Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.black,
                )),
          ),
          const Text(
            'Guardians',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.none,
                color: Colors.black),
          ),
        ],
      ),
    );

    Widget instructions = Text(
      "You need at least 1 guardian approval for a wallet recovery or transfer over your daily limit.",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 12,
          fontFamily: 'Karla',
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
          color: Colors.grey.shade600),
    );

    Widget addGuardian = SizedBox(
      width: 250,
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.transparent)),
            ),
            backgroundColor:
            MaterialStateProperty.all<Color>(Color(0xFFFFC000)),
          ),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddGuardianManually()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.black,),
              SizedBox(width: 20),
              Text("Add Guardian",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      color: Colors.black)),
            ],
          )),
    );

    return Scaffold(
      body: Column(
        children: [
          topBar,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/icon/icon_empty.png',
                  width: 180,
                  height: 180,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: instructions),
                  ],
                ),
                SizedBox(height: 10),
                addGuardian
              ],
            ),
          ),
        ],
      ),
    );
  }
}
