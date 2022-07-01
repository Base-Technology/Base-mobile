import 'package:flutter/material.dart';

import '../widget/CustomText.dart';

class MaxToken extends StatelessWidget {
  const MaxToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 40,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFFFC000))),
          onPressed: () {},
          child: CustomText(
            "MAX",
            textColor: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w600
          )),
    );
  }
}
