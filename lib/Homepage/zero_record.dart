import 'package:acy_ipay/Homepage/show_history.dart';
import 'package:acy_ipay/widget/button_switch_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ZeroRecord extends StatelessWidget {
  const ZeroRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "History",
                  style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                children: [
                  SwitchWallet(),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    //padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HistoryFilter()),
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/icon/icon_filter.svg",
                          width: 20,
                          height: 20,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icon/icon_data.svg",
                    width: 60,
                    height: 60,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "Your activities will be shown here",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
