import 'package:flutter/material.dart';

import '../../widget/CustomText.dart';

class SendButton extends StatelessWidget {
  const SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
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
          onPressed: () {},
          child: CustomText(
            "Send",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            textColor: Colors.black,
          ),
        ));
  }
}
