import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/CustomText.dart';

class ShowDeposit extends StatelessWidget {
  const ShowDeposit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Supported token assets list
    Map supportedToken = {
      "BTC": "assets/icon/icon_btc.svg",
      "ETH": "assets/icon/icon_eth.svg",
      "USDT": "assets/icon/icon_usdt.svg",
      "ACY": "assets/icon/icon_acy.svg",
      "USDC": "assets/icon/icon_usdc.svg",
      "USDA": "assets/icon/icon_usda.svg",
      "USDH": "assets/icon/icon_usdh.svg",
      "BNB": "assets/icon/icon_bnb.svg",
      "XRP": "assets/icon/icon_xrp.svg",
      "SHIBA": "assets/icon/icon_shiba.svg",
      "Crypto.com": "assets/icon/icon_cro.svg",
      "AXS": "assets/icon/icon_axs.svg",
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Top Returns',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                CustomText(
                  'APY',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ]),
        ),
        ListView.separated(
            primary: false,
            padding: const EdgeInsets.only(bottom: 1),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: supportedToken.length,
            separatorBuilder: (context, index) => Divider(
                indent: 0,
                endIndent: 0,
                thickness: 0.5,
                height: 0.1,
                color: Color(0x1ABDBDBD)),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                minLeadingWidth: 10,
                leading: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            supportedToken.values.elementAt(index),
                            height: 30,
                            width: 30,
                          ),
                        ]),
                  ),
                ),
                title: CustomText(
                  supportedToken.keys.elementAt(index),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                trailing: SizedBox(
                  height: 40,
                  child: CustomText(
                    "100%",
                    fontSize: 20,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
