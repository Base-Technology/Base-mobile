import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          TopBarSimple(title: "Add Contact", isContact: false)
        ],
      ),
    );
  }
}
