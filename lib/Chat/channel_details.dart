import 'package:flutter/material.dart';

import '../Constant/channel_data.dart';

class ChannelDetails extends StatelessWidget {
  const ChannelDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            Container(
              width: 50,
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
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "#",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Expanded(
                                      child: Text(
                                        "general-chat",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_horiz))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Column(children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      size: 28,
                                      color: Color(0XF2B9BABE),
                                    )),
                                const Text(
                                  "Search",
                                  style: TextStyle(
                                      color: Color(0XF2B9BABE), fontSize: 12),
                                )
                              ]),
                              const Expanded(child: SizedBox()),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.push_pin,
                                        size: 28,
                                        color: Color(0XF2B9BABE),
                                      )),
                                  const Text(
                                    "Pins",
                                    style: TextStyle(
                                        color: Color(0XF2B9BABE), fontSize: 12),
                                  )
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.notifications,
                                        size: 28,
                                        color: Color(0XF2B9BABE),
                                      )),
                                  const Text(
                                    "Notifications",
                                    style: TextStyle(
                                        color: Color(0XF2B9BABE), fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Color(0xFF303030),
                          child: ListTile(
                            leading: Container(
                              child: const Icon(Icons.person_add_alt_1, color: Color(0XF2B9BABE)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Color(0xD9212226)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                            ),
                            title: const Text("Invite Members"),
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xF2363940),
                            child: Material(
                              child: ListView(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 16, right: 16),
                                    child: Text(
                                      'Community Manager - 3',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                  ...users.map((user) => ListTile(
                                    leading: CircleAvatar(
                                        radius: 15,
                                        foregroundImage: NetworkImage(
                                          user["avatar"]!,
                                        )),
                                    horizontalTitleGap: 0,
                                    title: Text(user["name"]!),
                                    onTap: () {},
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}