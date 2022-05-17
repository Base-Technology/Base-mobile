import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ExchangeBox.dart';

class SwapMain extends StatelessWidget {
  const SwapMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double resWidth = MediaQuery.of(context).size.width;
    double resHeight = MediaQuery.of(context).size.height;

    Widget topBar = Container(
      padding: const EdgeInsets.only(top: 25),
      color: Color(0xFF18191C),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFF18191C),
              ),
              child: SizedBox(
                child: SvgPicture.asset(
                  'assets/icon/icon_base.svg',
                  width: 30,
                  height: 30,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'Swap',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
    return Container(
        //padding: EdgeInsets.all(10),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        topBar,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: resWidth * 0.3,
                height: resHeight * 0.4,
                decoration: BoxDecoration(
                    color: Color(0xFF373435),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ExchangeBox(),
                    ExchangeBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
