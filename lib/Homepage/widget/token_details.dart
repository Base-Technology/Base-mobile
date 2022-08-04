import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';

class TokenDetails extends StatelessWidget {
  final String tokenName;
  const TokenDetails({Key? key, required this.tokenName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){}, 
      child: Container(
        width: MediaQuery.of(context).size.width * 0.175,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Color(0xF24B4F4E),
        ),
        child: TextButton(
          onPressed: (){},
          child: CustomText(tokenName, fontSize: 12,),
        ),
      )
    );
  }
}
