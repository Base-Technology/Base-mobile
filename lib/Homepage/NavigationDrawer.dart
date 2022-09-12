import 'package:acy_ipay/Chat/chat_main.dart';
import 'package:acy_ipay/DAO/daomain.dart';
import 'package:acy_ipay/Homepage/main_page.dart';
import 'package:acy_ipay/Settings/settings_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'main_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildHeader(BuildContext context) => Material(
      // color: Colors.blue.shade700,
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
              backgroundImage: NetworkImage("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202101%2F23%2F20210123215342_3bbf3.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664798010&t=148a45e866dc6295ba32f7b6c99c9634"),
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
            const Divider(color: Colors.black54),
            ListTile(
              leading: Icon(Icons.wallet_rounded),
              title: Text('Wallet'),
              onTap: () {
                pushNewScreenWithRouteSettings(
                  context,
                  settings: RouteSettings(name: '/home'),
                  screen: HomePage(),
                );
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.house_rounded),
              title: Text('DAO'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DaoMain()));
              },
            ),
            ListTile(
              leading: Icon(Icons.people_rounded),
              title: Text('Friends'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatMain()));
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
