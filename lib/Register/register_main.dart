import 'package:flutter/material.dart';

class RegisterMain extends StatelessWidget {
  const RegisterMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Base Wallet"),
        Text("1/100 fees of Ethereum on zkRollup Layer 2 Network"),
        SizedBox(
          width: double.infinity,
          child: TextButton(
          style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.transparent)),
          ),
          backgroundColor:
          MaterialStateProperty.all<Color>(Color(0xFFFFC000)),
          ),
          onPressed: () {},
            child: Text("Create Wallet",
              style: TextStyle(
              fontSize: 16,
              fontFamily: 'Karla',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Colors.black))),
        ),
      ],
    );
  }
}
