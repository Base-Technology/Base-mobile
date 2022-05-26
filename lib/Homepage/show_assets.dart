import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowAssets extends StatelessWidget {
  const ShowAssets({Key? key}) : super(key: key);

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
    };

    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.only(bottom: 1),
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
              title: Text(
                supportedToken.keys.elementAt(index),
                style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 16,
                    color: Color(0xFFBDBDBD)),
              ),
              trailing: SizedBox(
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "0.25",
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFFBDBDBD)),
                    ),
                    Text(
                      "\$732.5",
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey.shade700),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
