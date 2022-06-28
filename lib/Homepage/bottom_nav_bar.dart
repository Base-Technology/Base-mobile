import 'package:acy_ipay/Chat/chat_main.dart';
import 'package:acy_ipay/Homepage/Receive/receive_main.dart';
import 'package:acy_ipay/Invest/invest_main.dart';
import 'package:acy_ipay/Swap/swap_main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '/Settings/settings_main.dart';
import '/Homepage/main_page.dart';
import 'Send/send_main.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({Key? key}) : super(key: key);

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  late PersistentTabController _controller;

  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    // Controller setting
    _controller = PersistentTabController(initialIndex: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<Widget> _buildScreens() {
    return [ChatMain(), HomePage(), SettingsMain()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        contentPadding: 0,
        icon: FaIcon(
          FontAwesomeIcons.solidMessage,
          size: 20,
        ),
        title: ("Chat"),
        activeColorPrimary: Colors.grey.shade700,
        inactiveColorPrimary: Colors.grey.shade700,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/earn': (context) => investMain(),
            '/swap': (context) => SwapMain(),
            '/send': (context) => SendMain(),
            '/receive': (context) => ReceiveMain(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,
        iconSize: 20,
        icon: FaIcon(
          FontAwesomeIcons.circleDollarToSlot,
          size: 20,
        ),
        title: ("Assets"),
        activeColorPrimary: Colors.grey.shade700,
        inactiveColorPrimary: Colors.grey.shade700,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/earn': (context) => investMain(),
            '/swap': (context) => SwapMain(),
            '/send': (context) => SendMain(),
            '/receive': (context) => ReceiveMain(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        contentPadding: -2,
        icon: FaIcon(
          FontAwesomeIcons.solidUser,
          size: 20,
        ),
        title: ("Me"),
        activeColorPrimary: Colors.grey.shade700,
        inactiveColorPrimary: Colors.grey.shade700,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/earn': (context) => investMain(),
            '/swap': (context) => SwapMain(),
            '/send': (context) => SendMain(),
            '/receive': (context) => ReceiveMain(),
          },
        ),
      ),
    ];
  }
  /* better version
  static const List<Option> options = [
  Option(name: "Home", icon: Icons.home, color: Colors.red,),
  Option(name: "Business", icon: Icons.business, color: Colors.green),
  Option(name: "School", icon: Icons.school, color: Colors.purple),
  Option(name: "Settings", icon: Icons.settings, color: Colors.pink),
  ];

  int index = 0;
  Option get option => options [index];

  onTap: (value) => setState(() => index = value),
        items: [
          for (final option in options) BottomNavigationBarItem(
            icon: Icon(option.icon),
            label: option.name,
          ),
        ],
  */

  List pages = [
    ChatMain(),
    HomePage(),
    SettingsMain()
  ]; //SwapMain(),investMain(), ,

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      onItemSelected: onTap,
      handleAndroidBackButtonPress: false, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
