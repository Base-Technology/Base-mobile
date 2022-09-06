import 'package:acy_ipay/Chat/models/chat_user_model.dart';
import 'package:acy_ipay/widget/chat_card.dart';
import 'package:acy_ipay/widget/move.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:acy_ipay/Homepage/NavigationDrawer.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUser> chat_users = [
    ChatUser(
        name: "Base(3)",
        message: "John sent a photo.",
        profile_pic_URL: "https://img0.baidu.com/it/u=745053376,1504613451&fm=253&fmt=auto&app=138&f=PNG?w=582&h=500",
        time: "Now"),
    ChatUser(
        name: "Fredericking",
        message: "You've been invited.",
        profile_pic_URL: "https://img0.baidu.com/it/u=745053376,1504613451&fm=253&fmt=auto&app=138&f=PNG?w=582&h=500",
        time: "Yesterday"),
    ChatUser(
        name: "LINE USA",
        message: "Welcome to LINE!",
        profile_pic_URL: "https://img0.baidu.com/it/u=745053376,1504613451&fm=253&fmt=auto&app=138&f=PNG?w=582&h=500",
        time: "5/27"),
  ];
  Container _leading() {
    return Container(
      width: 50,
      color: Colors.yellow,
      child: SvgPicture.asset(
        "assets/icon/icon_logo.svg",
        color: Colors.grey,
      ),
    );
  }

  double _x = 120;
  double _y = 630;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Overlay.of(context)?.insert(_entry());
    });
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // iconTheme: IconThemeData(color: Color(0xFF1EA838)),
        // title: Text('Wallet', style: TextStyle(color: Colors.white),textAlign:TextAlign.center),
        elevation: 1,
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        actions: <Widget>[
          Builder(builder: (context) =>IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Add Alarm',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              })),
          // new IconButton(
          //     icon: new Icon(Icons.settings),
          //     tooltip: 'Add Alarm',
          //     onPressed: () {}),
        ],
        // leading: _leading(),
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListView.builder(
                itemCount: chat_users.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChatCard(
                    name: chat_users[index].name,
                    message: chat_users[index].message,
                    profile_pic_URL: chat_users[index].profile_pic_URL,
                    time: chat_users[index].time,
                    is_read: (index == 0 || index == 3) ? true : false,
                  );
                },
              ),
              //
            ],
          )),
    );
  }

  OverlayEntry _entry() {
    return OverlayEntry(builder: (ctx) {
      return Positioned(
        width: 48,
        height: 48,
        left: _x,
        top: _y,
        child: GestureDetector(
          onPanUpdate: (d) {
            setState(() {
              _x += d.delta.dx;
              _y += d.delta.dy;
            });
          },
          child: SvgPicture.asset(
            "assets/icon/icon_logo.svg",
            color: Colors.green,
          ),
        ),
      );
    });
  }
}
