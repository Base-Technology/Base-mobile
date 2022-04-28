import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:acy_ipay/Homepage/mid_content.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget topBar = Container(
            padding: EdgeInsets.only(top: 25),
            color: Color(0xF2FF875C),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: Colors.white,
                            border:
                                Border.all(width: 1, color: Color(0xFFF36A3B))),
                        child: FaIcon(FontAwesomeIcons.alignLeft,
                            color: const Color(0xFFF36A3B), size: 15),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xFFF36A3C),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                FaIcon(FontAwesomeIcons.solidStar,
                                    color: Colors.white, size: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 2.5),
                                  child: Text(
                                    'Invite Friends',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              ])),
                    ],
                  ),
                  midContent(),
                ]));
    return topBar;
  }
}
