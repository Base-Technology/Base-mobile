import 'package:flutter/material.dart';

class ChatMain extends StatelessWidget {
  const ChatMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Chat page",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
