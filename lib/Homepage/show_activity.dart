import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowActivity extends StatelessWidget {
  const ShowActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(
      "Test",
      style: TextStyle(color: Colors.white),
    )));
  }
}
