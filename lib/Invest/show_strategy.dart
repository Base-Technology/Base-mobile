import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import '../widget/CustomText.dart';
class ShowStrategy extends StatelessWidget {
  const ShowStrategy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Map strategies = {
      "Staking":
          "Stake your ETH on Eth2 and earn daily rewards. You'll receive a new token representing your stake that you can convert back to ETH.",
      "Yield Optimized":
          "Earn more on your ETH with automated investment stategies by Yearn. Curve stETH yVault uses multiple DeFi protocols to increase returns(e.g. Lido, Curve, Convex)",
      "Leveraged Staking":
          "Earn higher rewards with Index Coop (icETH), Boosted by leveraging Lido Staked ETH ~2.5x with Aave."
    };
    List strategiesKey = strategies.keys.toList();

    Widget strategyBox(String assetPath, String strategyType, String strategyInfo) {
      return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 12),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade800),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            CustomText(
              strategyType, //"Staking",
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomText(
                strategyInfo,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Provided by",
                    fontSize: 14,
                  ),
                  FaIcon(
                    FontAwesomeIcons.circleInfo,
                    color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

  return Column(
      children: [
        strategyBox("assets/icon/icon_stake.svg", strategiesKey[0],
            strategies[strategiesKey[0]]),
        strategyBox("assets/icon/icon_stake.svg", strategiesKey[1],
            strategies[strategiesKey[1]]),
        strategyBox("assets/icon/icon_stake.svg", strategiesKey[2],
            strategies[strategiesKey[2]]),
      ],
    );
  }
}
