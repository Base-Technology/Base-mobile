import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'button_history.dart';
import 'button_switch_chain.dart';
import 'button_switch_wallet.dart';

class TopBar extends StatelessWidget {
  final String title;
  const TopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                  )),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: CustomText(
                  title,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: SwitchChain()
              ),
              SizedBox(
                width: 10,
              ),
              SwitchWallet(),
              SizedBox(
                width: 10,
              ),
              GoToHistory(),
            ],
          ),
        ],
      )
    );
  }
}
