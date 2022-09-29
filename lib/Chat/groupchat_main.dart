import 'package:acy_ipay/Chat/channel_details.dart';
import 'package:acy_ipay/Chat/channel_list.dart';
import 'package:acy_ipay/Chat/groupchat_page.dart';
import 'package:flutter/material.dart';
import 'package:overlapping_panels/overlapping_panels.dart';

class GroupChatMainPage extends StatefulWidget {
  const GroupChatMainPage({Key? key}) : super(key: key);

  @override
  State<GroupChatMainPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatMainPage> {
  Offset footerOffset = const Offset(0, 1);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OverlappingPanels(
          left: Builder(builder: (context) {
            return const ChannelList();
          }),
          right: Builder(
            builder: (context) => const ChannelDetails(),
          ),
          main: Builder(
            builder: (context) {
              return const GroupChatPage();
            },
          ),
          onSideChange: (side) {
            setState(() {
              if (side == RevealSide.main) {
                footerOffset = const Offset(0, 1);
              } else if (side == RevealSide.left) {
                footerOffset = const Offset(0, 0);
              }
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 160),
            offset: footerOffset,
            child: SizedBox(
              height: 50,
              child: Material(
                color: Color(0xE618191D),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.house_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.people_rounded,
                            color: Colors.white54,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.wallet_rounded,
                            color: Colors.white54,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            radius: 15,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/5024388?v=4"),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}