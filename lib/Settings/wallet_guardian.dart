import 'package:acy_ipay/Settings/add_guardian_manually.dart';
import 'package:acy_ipay/widget/topbar.dart';
import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import '../widget/CustomText.dart';

class WalletGuardian extends StatelessWidget {
  const WalletGuardian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    Widget instructions = CustomText(
      "You need at least 1 guardian approval for a wallet recovery or transfer over your daily limit.",
      fontSize: 12,
      fontWeight: FontWeight.w600,
      textColor: Colors.grey.shade600
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
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddGuardianManually()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.black,
              ),
              SizedBox(width: 20),
              CustomText(
                "Add Guardian",
                fontSize: 16,
                textColor: Colors.black,
              )
            ],
          )),
    );

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: [
          TopBarSimple(title: "Guardian", isContact: false, isReferral: false),
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
