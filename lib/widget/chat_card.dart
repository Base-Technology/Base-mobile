import 'package:acy_ipay/Chat/chat_detail.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatefulWidget {
  String name;
  String message;
  String profile_pic_URL;
  String time;
  bool is_read;

  ChatCard(
      {required this.name,
      required this.message,
      required this.profile_pic_URL,
      required this.time,
      required this.is_read});
  @override
  _ChatCardState createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetailPage();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(children: <Widget>[
          Expanded(
              child: Row(children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(widget.profile_pic_URL),
              maxRadius: 30,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(widget.message,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.is_read
                                    ? FontWeight.bold
                                    : FontWeight.normal))
                      ],
                    )))
          ])),
          Text(
            widget.time,
            style: TextStyle(
                fontSize: 12,
                fontWeight:
                    widget.is_read ? FontWeight.bold : FontWeight.normal),
          )
        ]),
      ),
    );
  }
}
