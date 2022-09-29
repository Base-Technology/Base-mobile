import 'package:acy_ipay/Homepage/Receive/receive_main.dart';
import 'package:acy_ipay/Homepage/Referral/referral_main.dart';
import 'package:acy_ipay/Homepage/bottom_nav_bar.dart';
import 'package:acy_ipay/Homepage/main_page.dart';
import 'package:acy_ipay/Register/register_main.dart';
import 'package:acy_ipay/Homepage/Send/send_main.dart';
import 'package:acy_ipay/Swap/swap_main.dart';
import 'package:acy_ipay/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:acy_ipay/Invest/invest_main.dart';
import 'package:acy_ipay/Chat/chat_main.dart';
import 'package:acy_ipay/Chat/friends/friends_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const MaterialColor customColor = MaterialColor(
    _customColor,
    <int, Color>{
      50: Color(0xFF202121),
      100: Color(0xFF202121),
      200: Color(0xFF202121),
      300: Color(0xFF202121),
      400: Color(0xFF202121),
      500: Color(_customColor),
      600: Color(0xFF202121),
      700: Color(0xFF202121),
      800: Color(0xFF202121),
      900: Color(0xFF202121),
    },
  );
  static const int _customColor = 0xFF202121;

  final boolTrue = false;
  final signUp = true;
  // final themec= ThemeData(
  //   scaffoldBackgroundColor: Color.fromRGBO(32,33,33,1),
  //   primaryColor: Colors.white,
  //   colorScheme: ColorScheme.light(),
  //   primaryIconTheme: IconThemeData(color: Color(0xFFFFC000)),
  //   brightness: Brightness.light,
  // );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Base',
          // themeMode: ThemeMode.system,
          // theme: themec,
          darkTheme: CustomTheme.darkTheme,
          theme: ThemeData(
            // 应用整体主题亮度
            brightness: Brightness.dark,
            // 背景色
            primarySwatch: customColor,
            // primaryColor: Colors.red,
            // // 前景色
            // accentColor: Colors.orange[600],
            //
            // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: signUp ? ChatMain() : RegisterMain(),
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/earn': (context) => investMain(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/swap': (context) => SwapMain(),
            '/home': (context) => HomePage(),
            '/chat': (context) => ChatMain(),
            '/send': (context) => SendMain(),
            '/receive': (context) => ReceiveMain(),
            '/referral': (context) => ReferralMain(),
            '/friends': (context) => FriendsPage(),

          },
        );
      });
}
