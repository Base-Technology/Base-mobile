import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/Activity/activity_main.dart';
import '/Invest/invest_main.dart';
import '/Send/send_main.dart';
import '/Homepage/main_page.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({Key? key}) : super(key: key);

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
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
  List pages = [HomePage(), activityMain(), investMain(), sendMain()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: currentIndex == 0 ? Color(0xF2FF875C) : Colors.white,
        selectedItemColor: currentIndex == 0 ? Colors.white : Color(0xF2FF875C),
        unselectedItemColor: currentIndex == 0 ? Colors.white54 : Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: 'Assets', icon: FaIcon(FontAwesomeIcons.wallet)),
          BottomNavigationBarItem(
              label: 'Activity', icon: FaIcon(FontAwesomeIcons.rightLeft)),
          BottomNavigationBarItem(
              label: 'Invest', icon: FaIcon(FontAwesomeIcons.arrowTrendUp)),
          BottomNavigationBarItem(
              label: 'Send', icon: FaIcon(FontAwesomeIcons.solidPaperPlane))
        ],
      ),
    );
  }
}
