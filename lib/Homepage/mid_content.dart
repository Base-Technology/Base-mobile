import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class midContent extends StatefulWidget {
  const midContent({Key? key}) : super(key: key);

  @override
  State<midContent> createState() => _midContentState();
}

class _midContentState extends State<midContent> {
  @override
  Widget build(BuildContext context) {
    Column _threeButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: CircleAvatar(
              child: Icon(icon, color: color),
              radius: 60,
              backgroundColor: Color(0xF2F26A3C),
            ),
            iconSize: 40,
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget threeButtonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _threeButtonColumn(
            Colors.white, FontAwesomeIcons.arrowDownLong, 'Receive'),
        _threeButtonColumn(Colors.white, FontAwesomeIcons.qrcode, 'Scan QR'),
        _threeButtonColumn(Colors.white,
            FontAwesomeIcons.upRightAndDownLeftFromCenter, 'Trade'),
      ],
    );

    double resWidth = MediaQuery.of(context).size.width;

    Widget tapToBuy = Container(
        width: resWidth * 0.75,
        margin: EdgeInsets.only(top: 45.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.5)),
          color: Colors.white,
        ),
        child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color(0xF2F26A3C),
                  radius: 28,
                  child: FaIcon(FontAwesomeIcons.creditCard,
                      color: Colors.white, size: 22),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Buy crypto for free',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              )
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Your first crypto purchase is on us.',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Tap here to buy.',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                      ],
                    ))
              ],
            )));

    return Container(
        margin: EdgeInsets.only(top: 150.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.ellipsis,
                      color: Colors.white, size: 55),
                  Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: FaIcon(FontAwesomeIcons.ellipsis,
                          color: Colors.white, size: 55))
                ]),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                  width: 28.0,
                  child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.eyeSlash,
                          size: 10, color: Color(0xE62A292E)),
                      tooltip: 'Tap to show balance',
                      onPressed: () {}),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.8),
                  child: Text(
                    'Show Balance',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 10,
                        color: Color(0xE62A292E),
                        decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
            threeButtonSection,
            tapToBuy,
          ],
        ));
  }
}
