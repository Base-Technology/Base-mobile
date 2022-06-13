import 'package:acy_ipay/Chat/models/chat_user_model.dart';
import 'package:acy_ipay/widget/chat_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override 
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUser> chat_users = [
    ChatUser(name: "Base(3)", message: "John sent a photo.", profile_pic_URL: "", time: "Now"),
    ChatUser(name: "Fredericking", message: "You've been invited.", profile_pic_URL: "", time: "Yesterday"),
    ChatUser(name: "LINE USA", message: "Welcome to LINE!", profile_pic_URL: "", time: "5/27"),
  ];
  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(child: Padding (padding: EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Chats", style : TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8,top: 2, bottom: 2),
                height: 30,
              child : Row (children: <Widget>[
                Icon(Icons.more_vert, size: 30,),
              ],)
              )
            ],
          ))
          ),
      Padding(
  padding: EdgeInsets.only(top: 16,left: 16,right: 16),
  child: TextField(
    decoration: InputDecoration(
      hintText: "Search...",
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.grey.shade100
          )
      ),
    ),
  ),
),
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
                time:chat_users[index].time,
                is_read: (index == 0 || index == 3)?true:false,
              );
            },
          ),
        ]
        ,)
      )
    );
  }
}
