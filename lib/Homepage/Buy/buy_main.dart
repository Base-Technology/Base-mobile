import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyMain extends StatelessWidget {
  const BuyMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBarSimple(title: "Choose a provider"),
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          horizontalTitleGap: 0,
          leading: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset("assets/icon/icon_ramp.svg",height: 40,width: 40,)
          ),
          title: Text("Ramp",
                  style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  color: Colors.black),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Card or bank transfer",
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none,
                    color: Colors.grey.shade600),),
              Text("First purchase fee free",
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    color: Colors.grey.shade600),),
            ]
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
          onTap: (){},
        ),
      ],
    );
  }
}
