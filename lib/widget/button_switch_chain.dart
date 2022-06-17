import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SwitchChain extends StatelessWidget {
  const SwitchChain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        height: 30,
        width: MediaQuery.of(context).size.width * 0.135,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.grey.shade700, width: 1),
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.5),
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
              SvgPicture.asset(
                'assets/icon/icon_switch.svg',
                width: 28,
                height: 28,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ));
  }
}
