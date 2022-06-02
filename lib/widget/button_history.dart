import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoToHistory extends StatelessWidget {
  const GoToHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icon/icon_history.svg',
        width: 30,
        height: 30,
        color: Colors.black,
      ),
    );
  }
}
