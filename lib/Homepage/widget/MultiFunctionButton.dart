import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MultiFunctionButton extends StatelessWidget {
  final String text;
  final String iconPath;
  const MultiFunctionButton(
      {Key? key, required this.text, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 80,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(65)),
              child: TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10.0),
                  primary: Colors.white,
                  backgroundColor: const Color(0xFF1E1C1D),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    SvgPicture.asset(
                      iconPath,
                      width: 25,
                      height: 25,
                      color: Color(0xFFBDBDBD),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
