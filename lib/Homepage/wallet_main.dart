import 'package:acy_ipay/Homepage/wallet_page.dart';
import '../Chat/chat_main1.dart';
import '../Chat/groupchat_main.dart';
import '../Chat/navigation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:overlapping_panels/overlapping_panels.dart';

import '../Settings/settings_main.dart';

class WalletMain extends StatefulWidget {
  const WalletMain({Key? key}) : super(key: key);

  @override
  State<WalletMain> createState() => _WalletMainState();
}

class _WalletMainState extends State<WalletMain> {
  Offset footerOffset = const Offset(0, 1);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OverlappingPanels(
          left: Builder(builder: (context) {
            return const NavigationList();
          }),
          main: Builder(
            builder: (context) {
              return const WalletPage();
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
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => GroupChatMainPage()));
                          },
                          icon: SvgPicture.asset(
                            "assets/icon/icon_logo.svg",
                            color: Color(0xFF1EAA39),
                            height: 32,
                            width: 32,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.people_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatMainOne()));
                          },
                          icon: SvgPicture.asset(
                            "assets/icon/icon_p2p.svg",
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => WalletPage()));
                          },
                          icon: const Icon(
                            Icons.wallet_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SettingsMain()));
                          },
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
