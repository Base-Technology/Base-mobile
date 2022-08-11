import 'package:acy_ipay/Chat/chat_main.dart';
import 'package:acy_ipay/Homepage/main_page.dart';
import 'package:acy_ipay/Settings/settings_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildHeader(BuildContext context) => Material(
      color: Colors.blue.shade700,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        padding: EdgeInsets.only(
          left: 30,
          top: 24 + MediaQuery.of(context).padding.top
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('test.base'),
                Text('Online'),
                Text('0x738xf...23wfsw')
              ]
            ),
          ],
        ),
      ),
    );

    Widget buildMenuItems(BuildContext context) => Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.chat_rounded),
              title: Text('Chat'),
              onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ChatMain())),
            ),
            ListTile(
              leading: Icon(Icons.house_rounded),
              title: Text('House'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatMain()));
              },
            ),
            ListTile(
              leading: Icon(Icons.people_rounded),
              title: Text('DAO'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatMain()));
              },
            ),
            ListTile(
              leading: Icon(Icons.wallet_rounded),
              title: Text('Wallet'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsMain()));
              },
            ),
            ListTile(
              leading: Icon(Icons.help_rounded),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatMain()));
              },
            ),
          ],
      ),
    );

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      )
    );
  }
}
