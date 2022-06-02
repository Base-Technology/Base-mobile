import 'package:acy_ipay/Chat/chat_main.dart';
import 'package:acy_ipay/Homepage/main_page.dart';
import 'package:acy_ipay/Settings/settings_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final String tabItem;
  const TabNavigator({Key? key, this.navigatorKey, required this.tabItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = ChatMain();
    if (tabItem == "Chat") {
      child = ChatMain();
    } else if (tabItem == "Asset") {
      child = HomePage();
    } else if (tabItem == "Me") {
      child = SettingsMain();
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        SchedulerBinding.instance?.addPostFrameCallback((_) {
          // add your code here.

          Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => SingleChildScrollView(child: child)));
        });
      },
    );
  }
}
