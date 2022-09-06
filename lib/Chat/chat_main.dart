import 'package:flutter/material.dart';

import 'chat_page.dart';

class ChatMain extends StatelessWidget {
  const ChatMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ChatPage(),
    );
  }
}
