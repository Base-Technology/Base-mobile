import 'package:flutter/material.dart';

import '../widget/CustomText.dart';

class SwapToken extends StatelessWidget {
  const SwapToken({Key? key}) : super(key: key);

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
          child: CustomText("Swap Now",
                  fontSize: 16,
                  textColor: Colors.black
          ),
      )
    );
  }
}
