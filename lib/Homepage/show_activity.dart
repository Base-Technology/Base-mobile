import 'package:acy_ipay/Homepage/zero_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowActivity extends StatelessWidget {
  const ShowActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        ZeroRecord(),
    ]));
  }
}
