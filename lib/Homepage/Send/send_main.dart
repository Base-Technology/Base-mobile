import 'package:acy_ipay/Homepage/Send/button_send.dart';
import 'package:acy_ipay/Homepage/Send/send_contact_list.dart';
import 'package:acy_ipay/Settings/Contact/add_contact.dart';
import 'package:acy_ipay/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:acy_ipay/Swap/ExchangeBox.dart';
import 'package:acy_ipay/Swap/show_advanced_transaction.dart';
import 'package:acy_ipay/Swap/show_bacis_transaction.dart';
import 'package:provider/provider.dart';

import 'package:acy_ipay/theme_provider.dart';
import '../../widget/CustomText.dart';

class SendMain extends StatefulWidget {
  const SendMain({Key? key}) : super(key: key);

  @override
  State<SendMain> createState() => _SendMainState();
}

class _SendMainState extends State<SendMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double resWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: [
          const TopBar(title: "Transfer"),
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: resWidth * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      "Enter the amount",
                      fontSize: 15
                    ),
                    Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            border: themeProvider.isDarkMode ? null : Border.all(color: Colors.black),
                            color: themeProvider.isDarkMode ? Color(0xF23C3E3D) : Colors.transparent,
                            shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () async {
                              showModalBottomSheet(
                                  enableDrag: false,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.79,
                                      child: Column(children: [
                                        const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: CustomText(
                                                "Transaction Setting",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                        Expanded(
                                          child: DefaultTabController(
                                            length: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 30),
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: SizedBox(
                                                      width: MediaQuery.of(context).size.width / 2,
                                                      child: TabBar(
                                                          unselectedLabelColor:Colors.black,
                                                          labelColor:Colors.black,
                                                          controller:
                                                              _tabController,
                                                          indicator: UnderlineTabIndicator(
                                                              borderSide: BorderSide(
                                                                  width: 1.5,
                                                                  color: Color(
                                                                      0xFFFFC000)),
                                                              insets: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10)),
                                                          tabs: [
                                                            Tab(
                                                              text: "Basic",
                                                            ),
                                                            Tab(
                                                              text:
                                                                  "Advanced",
                                                            )
                                                          ]),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    //height: 500,
                                                    //width: double.infinity,
                                                    child: TabBarView(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      controller:
                                                          _tabController,
                                                      children: [
                                                        BasicTransactionPage(),
                                                        AdvancedTransactionPage(),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    );
                                  });
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/icon_swap_settings.svg",
                              height: 20,
                              width: 20,
                              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            )))
                  ],
                ),
                ExchangeBox(needMax: true, isSend: false),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: CustomText("0 BTC",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor:  themeProvider.isDarkMode ? Color(0xF2B3B3B3) : Colors.black),
                    ),
                  ],
                ),
                ExchangeBox(needMax: false, isSend: true),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddContact()));
                    },
                    child: CustomText(
                      "Add Contact",
                      fontSize: 12,
                      textColor: Color(0XFFFFCC00),
                    ),
                  )
                ]),
                const SizedBox(height: 15),
                SendButton(),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText("Estimated fee",
                            fontSize: 14,
                        ),
                        CustomText("≈ 0.005328 BNB",
                            fontSize: 14
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText("Max gas fee",
                            fontSize: 14,),
                        CustomText("≈ 0.009328 BNB",
                            fontSize: 14,),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.fromLTRB(15,15,15,0),
              child: SendContactList()
          )
        ],
      ),
    );
  }
}
