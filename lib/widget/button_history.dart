import 'package:acy_ipay/Notification/notification_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class GoToHistory extends StatelessWidget {
  const GoToHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NotificationMain()));
      },
      icon: SvgPicture.asset(
        'assets/icon/icon_history.svg',
        width: 30,
        height: 30,
        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
