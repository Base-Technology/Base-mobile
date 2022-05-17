import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowMarket extends StatelessWidget {
  const ShowMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "SHOW MARKET PAGE",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
