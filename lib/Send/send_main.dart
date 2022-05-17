import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class sendMain extends StatelessWidget {
  const sendMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget mainContext = Container(
        padding: EdgeInsets.only(top: 25),
        color: Color(0xFFFBFBFB),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xFFF36A3B))),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: SvgPicture.asset(
                        'assets/icon/icon_zksync.svg',
                        width: 30,
                        height: 30,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    'Send crypto',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ]),
            ]));
    return mainContext;
  }
}
