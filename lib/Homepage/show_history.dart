import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryFilter extends StatefulWidget {
  const HistoryFilter({Key? key}) : super(key: key);

  @override
  State<HistoryFilter> createState() => _HistoryFilterState();
}

class _HistoryFilterState extends State<HistoryFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF18191C),
      margin: EdgeInsets.only(top: 35),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: SvgPicture.asset(
                  "assets/icon/icon_arrow_back.svg",
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                color: Colors.transparent,
              ),
            ),
            Text(
              "History Filter",
              style: TextStyle(
                fontFamily: 'Karla',
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
