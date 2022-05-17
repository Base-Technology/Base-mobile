import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ColumnIconButton extends StatelessWidget {
  final String buttonText;
  final String assetPath;
  final VoidCallback onClicked;
  final Color color;
  const ColumnIconButton(
      {Key? key,
      required this.buttonText,
      required this.assetPath,
      required this.onClicked,
      required this.color})
      : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(assetPath, color: color),
              ),
              radius: 60,
              backgroundColor: Color(0xF2030203),
            ),
            iconSize: 40,
            onPressed: onClicked,
          ),
          Container(
            margin: const EdgeInsets.only(top: 3),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
