import 'package:flutter/material.dart';

class VaultsMain extends StatefulWidget {
  const VaultsMain({Key? key}) : super(key: key);

  @override
  State<VaultsMain> createState() => _VaultsMainState();
}

class _VaultsMainState extends State<VaultsMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.45,
    );
  }
}
