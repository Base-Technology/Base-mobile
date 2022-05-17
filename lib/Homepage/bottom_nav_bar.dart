import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/Swap/swap_main.dart';
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
  List pages = [HomePage(), SwapMain(), investMain(), sendMain()];

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
        backgroundColor: Color(0xFF18191C),
        selectedItemColor: Color(0xF2FFC000),
        unselectedItemColor: currentIndex == 0 ? Colors.white54 : Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.5),
                child: SvgPicture.asset(
                  "assets/icon/icon_home.svg",
                  height: 23,
                  width: 23,
                  color:
                      currentIndex == 0 ? Color(0xF2FFC000) : Color(0xFFBDBDBD),
                ),
              )),
          BottomNavigationBarItem(
              label: 'Swap',
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.5),
                child: SvgPicture.asset(
                  "assets/icon/icon_swap.svg",
                  height: 23,
                  width: 23,
                  color:
                      currentIndex == 1 ? Color(0xF2FFC000) : Color(0xFFBDBDBD),
                ),
              )),
          BottomNavigationBarItem(
              label: 'Earn',
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.5),
                child: SvgPicture.asset(
                  "assets/icon/icon_earn.svg",
                  height: 23,
                  width: 23,
                  color:
                      currentIndex == 2 ? Color(0xF2FFC000) : Color(0xFFBDBDBD),
                ),
              )),
          BottomNavigationBarItem(
              label: 'Me',
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.5),
                child: SvgPicture.asset(
                  "assets/icon/icon_me.svg",
                  height: 23,
                  width: 23,
                  color:
                      currentIndex == 3 ? Color(0xF2FFC000) : Color(0xFFBDBDBD),
                ),
              ))
        ],
      ),
    );
  }
}
