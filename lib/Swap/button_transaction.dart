import 'package:flutter/material.dart';

import '../widget/CustomText.dart';

class SaveResetTransaction extends StatelessWidget {
  final String title;
  const SaveResetTransaction({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TO-DO: Functions to reset and save states
    void resetSettings() => {};
    void saveSettings() => {};

    return Container(
      height: 45,
      width: 150,
      margin: EdgeInsets.only(top: 25),
      child: TextButton(
        onPressed: title == "reset" ? resetSettings : saveSettings,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.transparent)),
          ),
          backgroundColor: title == "reset"
              ? MaterialStateProperty.all<Color>(Colors.grey.shade800)
              : MaterialStateProperty.all<Color>(Color(0xFFFFC000)),
        ),
        child: CustomText(
              title,
              fontSize: 18,
            )
      ),
    );
  }
}
