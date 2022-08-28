import 'package:acy_ipay/Chat/models/chat_user_model.dart';
import 'package:acy_ipay/widget/chat_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUser> chat_users = [
    ChatUser(
        name: "Base(3)",
        message: "John sent a photo.",
        profile_pic_URL: "",
        time: "Now"),
    ChatUser(
        name: "Fredericking",
        message: "You've been invited.",
        profile_pic_URL: "",
        time: "Yesterday"),
    ChatUser(
        name: "LINE USA",
        message: "Welcome to LINE!",
        profile_pic_URL: "",
        time: "5/27"),
  ];
  Container _leading() {
    return Container(
      width: 50,
      color: Colors.yellow,
      child: Icon(Icons.logo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF1EA838)),
          title: Text('Wallet', style: TextStyle(color: Colors.white)),
          elevation: 1,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.arrow_back),
                tooltip: 'Add Alarm',
                onPressed: () {}),
            new IconButton(
                icon: new Icon(Icons.arrow_back),
                tooltip: 'Add Alarm',
                onPressed: () {}),
          ],
          leading: _leading(),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListView.builder(
                  itemCount: chat_users.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ChatCard(
                      name: chat_users[index].name,
                      message: chat_users[index].message,
                      profile_pic_URL: chat_users[index].profile_pic_URL,
                      time: chat_users[index].time,
                      is_read: (index == 0 || index == 3) ? true : false,
                    );
                  },
                ),
              ],
            )));
  }
}
