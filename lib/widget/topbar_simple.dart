import 'package:acy_ipay/widget/button_switch_wallet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Settings/Contact/add_contact.dart';
import '../theme_provider.dart';
import 'CustomText.dart';

class TopBarSimple extends StatelessWidget {
  final String title;
  final bool isContact;
  final bool isReferral;
  const TopBarSimple(
      {Key? key,
      required this.title,
      required this.isContact,
      required this.isReferral})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: const EdgeInsets.only(top: 25),
      color: themeProvider.isDarkMode ? Colors.black : Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black ,
                )),
          ),
          CustomText(
            title,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          isContact
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddContact()));
                        },
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          size: 25,
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black ,
                        )),
                  ),
                )
              : isReferral
                  ? Align(
                      alignment: Alignment.centerRight, child: SwitchWallet())
                  : SizedBox(
                      height: 30,
                      width: 20,
                    ),
        ],
      ),
    );
  }
}
