import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class activityMain extends StatelessWidget {
  const activityMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double resWidth = MediaQuery.of(context).size.width;
    double resHeight = MediaQuery.of(context).size.height;
    Widget topBar = Container(
      padding: EdgeInsets.only(top: 25),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                  'Wallet activity',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: resHeight * 0.15),
            child: SvgPicture.asset(
              'assets/icon/tradeCrypto.svg',
              width: 200,
              height: 200,
            ),
          ),
          Container(
              width: resWidth * 0.65,
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('After you\'ve made a transaction,',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.7))),
                        ]),
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('you can track it here',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.7))),
                        ]),
                  ]))
        ],
      ),
    );
    return topBar;
  }
}
