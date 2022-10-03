import 'package:acy_ipay/Chat/widget/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:overlapping_panels/overlapping_panels.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';

import '../Constant/channel_data.dart';

class GroupChatPage extends StatelessWidget {
  const GroupChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => {_controller.jumpTo(_controller.position.maxScrollExtent)});

    getSenderView(CustomClipper clipper, BuildContext context, text) => ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        elevation: 0,
        shadowColor: Colors.transparent,
        backGroundColor: Color(0xD99DE694),
        margin: EdgeInsets.only(top: 2.5),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
    );

    getReceiverView(CustomClipper clipper, BuildContext context, text) => ChatBubble(
      clipper: clipper,
      backGroundColor: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      margin: EdgeInsets.only(top: 2.5),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset : true,
      appBar: AppBar(
        backgroundColor: Color(0xE6303136),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: const [
                  Text('# general-chat')
                ]),
              ],
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFFBABBBF)),
          onPressed: () {
            OverlappingPanels.of(context)?.reveal(RevealSide.left);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.group, color: Color(0xFFBABBBF)),
            onPressed: () {
              OverlappingPanels.of(context)?.reveal(RevealSide.right);
            },
          )
        ],
      ),
      body:ColoredBox(
        color: Color(0xF2363940),
        child: Column(
            children: [Flexible(
              child: ListView(
                controller: _controller,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [...chat, ...chat]
                      .map((chatEntry) => ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    leading: chatEntry['user']['name'] == "notgr" ? SizedBox(width: 0.1,) : CircleAvatar(
                      foregroundImage: NetworkImage(chatEntry['user']['avatar']),
                    ),
                    title: Column(
                      children: [
                        chatEntry['user']['name'] == "notgr" ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              chatEntry["time"],
                              style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          ],
                        ) :
                        Row(
                          children: [
                            Text(
                              chatEntry['user']['name'],
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              chatEntry["time"],
                              style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          ],
                        ),
                        chatEntry['user']['name'] == "notgr" ? getSenderView(ChatBubbleClipper7(type: BubbleType.sendBubble, radius: 15), context, chatEntry['message']) : getReceiverView(ChatBubbleClipper7(type: BubbleType.receiverBubble, radius: 15), context, chatEntry['message']),
                      ],
                    ),
                    onTap: () {},
                    onLongPress: () {},
                  )).toList(),
              ),
            ),
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xF2363940),
                    border: Border(
                      top: BorderSide(color: Color(0xE62E3136))
                    )
                  ),
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 48,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Color(0xE62A2B2F),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Color(0xFFBABBBF),
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Color(0xE62A2B2F),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Icon(
                            Icons.image,
                            color: Color(0xFFBABBBF),
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xE62A2B2F),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(18)
                            ),
                            child: TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                hintText: "Message #general-chat",
                                hintStyle: TextStyle(color: Color(0xF271767C)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12.5)
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF1EAA39),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          // backgroundColor: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
            ]
          ),
      ),
    );
  }
}