import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';

import '../Constant/channel_data.dart';

class ChannelList extends StatelessWidget {
  const ChannelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xD9212226),
        child: Row(
          children: [
            SizedBox(
              width: 70,
              child: ListView(
                  children: servers
                      .map((server) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      foregroundImage: NetworkImage(server),
                    ),
                  ))
                      .toList()),
            ),
            Expanded(
              child: SafeArea(
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xE6303136),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                  BorderSide(color: Colors.grey[100]!))),
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                      child: Text(
                                        "Metaverse DAO",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_horiz))
                                ],
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xF24F535C)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.person_add, color: Colors.white, size: 16,),
                                      SizedBox(width: 10,),
                                      CustomText("Invite", fontSize: 16,)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Material(
                            color: Color(0xE6303136),
                            child: ListView(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 14, left: 14, right: 14),
                                  child: Text(
                                    'TEXT CHANNELS',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                                ...["general-chat", "gm", "gn", "self-introduction"].map((channel) => ListTile(
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.tag, size: 21),
                                    ],
                                  ),
                                  horizontalTitleGap: 0,
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(channel),
                                    ],
                                  ),
                                  onTap: () {},
                                )),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 14, left: 14, right: 14),
                                  child: Text(
                                    'VOICE CHANNELS',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ),
                                ...["suggestions", "support", "create-ticket"].map((channel) => ListTile(
                                  leading: const Icon(Icons.headphones, size: 21),
                                  horizontalTitleGap: 0,
                                  title: Text(channel),
                                  onTap: () {},
                                ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}