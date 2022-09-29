import 'package:acy_ipay/Homepage/main_page.dart';
import 'package:acy_ipay/Homepage/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class ChatMain extends StatefulWidget {
  const ChatMain({Key? key}) : super(key: key);

  @override
  State<ChatMain> createState() => _ChatMainState();
}

class _ChatMainState extends State<ChatMain> {
  late double xOffset;
  late bool drawerOpened = false;

  void closeDrawer() => setState(() {
    xOffset = 0;
    drawerOpened = false;
  });

  void openDrawer() => setState(() {
    xOffset = MediaQuery.of(context).size.width * 0.9;
    drawerOpened = true;
  });

  @override
  void initState(){
    super.initState();
    closeDrawer();
  }

  buildPage(){
    return GestureDetector(
      onTap: closeDrawer,
      child: Container(
        transform: Matrix4.translationValues(xOffset, 0, 0),
        child: currentIndex == 0 ? ChatPage(openDrawer: openDrawer) : HomePage(),
      ),
    );
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: drawerOpened ? BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_rounded),
              label: 'Wallet',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_rounded),
              label: 'DAO',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded),
              label: 'Friends',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.white,
            ),
          ]
      ) : null,
      body: Stack(children: <Widget>[
        NavigationDrawer(),
        buildPage()
      ]),
    );
  }
}
