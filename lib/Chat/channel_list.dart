import 'package:acy_ipay/Chat/proposal_main.dart';
import 'package:acy_ipay/Chat/vaults.dart';
import 'package:acy_ipay/Chat/widget/vault_line.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import '../Constant/channel_data.dart';

enum ChannelType { text, voice }

class ChannelList extends StatefulWidget {
  const ChannelList({Key? key}) : super(key: key);

  @override
  State<ChannelList> createState() => _ChannelListState();
}

class _ChannelListState extends State<ChannelList> {
  bool isPrivate = false;
  bool isExpanded = true;
  int selectedServer = 1;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    late TextEditingController userInput = TextEditingController(text: "");
    ChannelType? channelType = ChannelType.text;

    return Scaffold(
      body: Container(
        color: Color(0xD9212226),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              child: ListView(
                  children: servers.map((server) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedServer = server["channelNum"];
                        });
                      },
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor: selectedServer == server["channelNum"] ? Color(0xFF1EAA39) : Colors.transparent,
                          child: CircleAvatar(
                            radius: 30,
                            foregroundImage: NetworkImage(server["link"].toString()),
                          )
                        ),
                    ),
                  ))
                      .toList()),
            ),
            Expanded(
              child: SafeArea(
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xE6303136),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                      child: Text(
                                        "DAO Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.white,
                                        ),
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_vert_rounded, color: Colors.grey)
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Material(
                            color: Color(0xE6303136),
                            child: ListView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: ListTile(
                                    onTap: (){},
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth : 32,
                                    leading: Icon(Icons.person_add, color: Colors.grey),
                                    title: Text(
                                      'Invite friends',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ProposalMain()));
                                      },
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth : 32,
                                    leading: Icon(Icons.book_rounded, color: Colors.grey),
                                    title: Text(
                                      'Proposals',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => LineChartSample1()));
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth : 32,
                                    leading: SvgPicture.asset(
                                      "assets/icon/icon_bank.svg",
                                      color: Colors.grey,
                                      height: 28,
                                      width: 28,
                                    ),
                                    title: Text(
                                      'Vaults',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 14, 14, 0),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth : 5,
                                    leading: IconButton(
                                        onPressed:(){
                                          setState(() {
                                            isExpanded = !isExpanded;
                                          });
                                        },
                                        icon: isExpanded ? Icon(Icons.expand_more_rounded, color: Colors.grey) : Icon(Icons.chevron_right_rounded, color: Colors.grey,)
                                    ),
                                    title: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'CHANNELS',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Colors.grey
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              showModalBottomSheet(
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                  ),
                                                  barrierColor: Colors.white.withOpacity(0),
                                                  backgroundColor: const Color(0xD9212226),
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (BuildContext context) {
                                                    return SingleChildScrollView(
                                                      child: Container(
                                                        color:  const Color(0xF2363940),
                                                        child: Wrap(
                                                          children: <Widget>[
                                                            Container(
                                                              width: double.infinity,
                                                              padding: const EdgeInsets.all(20),
                                                              child: Center(
                                                                child: CustomText(
                                                                  "Create Channel",
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 20,
                                                                  textColor: Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: const EdgeInsets.all(10),
                                                              margin: const EdgeInsets.only(bottom: 5),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("CHANNEL NAME", style:TextStyle(color: Colors.white)),
                                                                  TextField(
                                                                    controller: userInput,
                                                                    decoration: InputDecoration(
                                                                        filled: true,
                                                                        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 6),
                                                                        hintText: "New channel",
                                                                        hintStyle: TextStyle(color: Color(0xF286898E), fontWeight: FontWeight.w400),
                                                                        fillColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.transparent,
                                                                        border: InputBorder.none
                                                                    ),
                                                                    style: TextStyle(
                                                                        fontFamily: 'Karla',
                                                                        fontWeight: FontWeight.w300,
                                                                        fontSize: 16,
                                                                        color: Colors.white
                                                                    ),
                                                                  ),
                                                                  Divider(height: 1,color: Colors.grey.shade400,),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(top: 20, bottom: 12),
                                                                    child: Text("CHANNEL TYPE", style:TextStyle(color: Color(0xFFBABBBF))),
                                                                  ),
                                                                  ListTile(
                                                                    contentPadding: EdgeInsets.zero,
                                                                    minLeadingWidth : 10,
                                                                    leading: Icon(Icons.text_snippet_rounded, color: Colors.grey, size: 22),
                                                                    title: Text("Text", style:TextStyle(color: Colors.white)),
                                                                    subtitle: Text("Post images, GIFs, stickers, opinions, and puns", style:TextStyle(color: Color(0xE6A3A6AB))),
                                                                    trailing: Radio(
                                                                      value: ChannelType.text,
                                                                      groupValue: channelType,
                                                                      onChanged: (ChannelType? value) {
                                                                        setState(() {
                                                                          channelType = value;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                  ListTile(
                                                                    contentPadding: EdgeInsets.zero,
                                                                    minLeadingWidth : 10,
                                                                    leading: Icon(Icons.text_snippet_rounded, color: Colors.grey, size: 22),
                                                                    subtitle: Text("Hang put together with voice, video and, screen share", style:TextStyle(color: Color(0xE6A3A6AB))),
                                                                    title: Text("Voice", style:TextStyle(color: Colors.white)),
                                                                    trailing: Radio(
                                                                      value: ChannelType.voice,
                                                                      groupValue: channelType,
                                                                      onChanged: (ChannelType? value) {
                                                                        setState(() {
                                                                          channelType = value;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 30),
                                                                    child: ListTile(
                                                                      contentPadding: EdgeInsets.zero,
                                                                      minLeadingWidth : 10,
                                                                      leading: Icon(Icons.lock_person_rounded, color: Colors.grey, size: 22),
                                                                      title: Text("Private Channel", style:TextStyle(color: Colors.white)),
                                                                      trailing: Switch.adaptive(
                                                                        value: isPrivate,
                                                                        inactiveTrackColor: themeProvider.isDarkMode ? Color(0xFF72777D) : Color(0xF2DADFE2),
                                                                        activeTrackColor: themeProvider.isDarkMode ? Color(0xFF1EAA39) : Color(0xF2DADFE2),
                                                                        activeColor: themeProvider.isDarkMode ? Color(0xFF39DC58) : Color(0xE682939D),
                                                                        inactiveThumbColor: themeProvider.isDarkMode ? Color(0xFFECECEC) : Color(0xE682939D),
                                                                        onChanged: (value) {
                                                                          setState(() {
                                                                            isPrivate = value;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        Container(
                                                                          height: 35,
                                                                          width: 180,
                                                                          margin: EdgeInsets.symmetric(vertical: 20),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(20),
                                                                            color: Color(0xDD1EAA39),
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              "CREATE",
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 18
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            icon: Icon(Icons.add_box_rounded, color: Colors.grey)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                 ...["general-chat", "create-a-ticket", "core-team", "self-introduction"].map((channel) => isExpanded ? ListTile(
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.chat_bubble_rounded, size: 21),
                                    ],
                                  ),
                                  horizontalTitleGap: 0,
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(channel),
                                    ],
                                  ),
                                  onTap: () {},
                                ): Row(
                                  children: [
                                    SizedBox(width: 1),
                                  ],
                                ) )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}