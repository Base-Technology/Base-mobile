import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SwitchChain extends StatelessWidget {
  const SwitchChain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        width: MediaQuery.of(context).size.width * 0.175,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
          color: Color(0xE64B4F4E),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10,
                child: SvgPicture.asset(
                  'assets/icon/icon_bsc_chain.svg',
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(width: 15,),
              SvgPicture.asset(
                'assets/icon/icon_switch.svg',
                width: 20,
                height: 20,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
