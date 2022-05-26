import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EarnStrategyBox extends StatelessWidget {
  const EarnStrategyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map strategies = {
      "Staking" : "Stake your ETH on Eth2 and earn daily rewards. You'll receive a new token representing your stake that you can convert back to ETH.",
      "Yield Optimized" : "Earn more on your ETH with automated investment stategies by Yearn. Curve stETH yVault uses multiple DeFi protocols to increase returns(e.g. Lido, Curve, Convex)",
      "Leveraged Staking" : "Earn higher rewards with Index Coop (icETH), Boosted by leveraging Lido Staked ETH ~2.5x with Aave."
    };
    List strategiesKey = strategies.keys.toList();

    Widget strategyBox (String assetPath, String strategyType, String strategyInfo) {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 12),
        width: MediaQuery
            .of(context)
            .size
            .width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xFFBDBDBD)
            ),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              strategyType, //"Staking",
              style: TextStyle(
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                strategyInfo,
                style: TextStyle(
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFBDBDBD)
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Provided by",
                    style: TextStyle(
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFFBDBDBD)
                    ),),
                  FaIcon(FontAwesomeIcons.circleInfo, color: Colors.white,),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        strategyBox("assets/icon/icon_stake.svg", strategiesKey[0], strategies[strategiesKey[0]]),
        strategyBox("assets/icon/icon_stake.svg", strategiesKey[1], strategies[strategiesKey[1]]),
        strategyBox("assets/icon/icon_stake.svg", strategiesKey[2], strategies[strategiesKey[2]]),
      ],
    );
  }
}
