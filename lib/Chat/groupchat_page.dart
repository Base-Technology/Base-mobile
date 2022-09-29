import 'package:flutter/material.dart';
import 'package:overlapping_panels/overlapping_panels.dart';

import '../Constant/channel_data.dart';

class GroupChatPage extends StatelessWidget {
  const GroupChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: const [
                  Text(
                    '@',
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text('notgr')
                ]),
                const Text(
                  'Playing Fornite Creative',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                )
              ],
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            OverlappingPanels.of(context)?.reveal(RevealSide.left);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              OverlappingPanels.of(context)?.reveal(RevealSide.right);
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              OverlappingPanels.of(context)?.reveal(RevealSide.right);
            },
          ),
          IconButton(
            icon: const Icon(Icons.group),
            onPressed: () {
              OverlappingPanels.of(context)?.reveal(RevealSide.right);
            },
          )
        ],
      ),
      body: Stack(
        children: [ListView(
          children: [...chat, ...chat]
              .map((chatEntry) => ListTile(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            leading: CircleAvatar(
              foregroundImage: NetworkImage(chatEntry['user']['avatar']),
            ),
            title: Row(
              children: [
                Text(
                  chatEntry['user']['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  chatEntry["time"],
                  style:
                  const TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            subtitle: Text(
              chatEntry['message'],
              style: const TextStyle(fontSize: 16),
            ),
            onTap: () {},
            onLongPress: () {},
          )).toList(),
        ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message . . . ",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    // backgroundColor: Colors.green,
                    elevation: 0,
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}