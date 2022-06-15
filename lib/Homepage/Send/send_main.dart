import 'package:acy_ipay/Homepage/Send/button_send.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:acy_ipay/Swap/ExchangeBox.dart';
import 'package:acy_ipay/Swap/show_advanced_transaction.dart';
import 'package:acy_ipay/Swap/show_bacis_transaction.dart';
import 'package:acy_ipay/widget/button_history.dart';
import 'package:acy_ipay/widget/button_switch_chain.dart';
import 'package:acy_ipay/widget/button_switch_wallet.dart';

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
    double resWidth = MediaQuery.of(context).size.width;
    double resHeight = MediaQuery.of(context).size.height;
    const IconData arrow_back =
        IconData(0xe092, fontFamily: 'MaterialIcons', matchTextDirection: true);

    Widget topBar = Container(
        padding: const EdgeInsets.only(top: 25, bottom: 15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        arrow_back,
                        size: 20,
                      )),
                  Text(
                    'Transfer',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SwitchChain(),
                SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: SwitchWallet(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: GoToHistory(),
                ),
              ],
            ),
          ],
        ));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        topBar,
        Container(
          width: resWidth * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Enter the amount",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          color: Colors.black)),
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)),
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () async {
                            showModalBottomSheet(
                                enableDrag: false,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.79,
                                    child: Column(children: [
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text("Transaction Setting",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Karla',
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black))),
                                      Expanded(
                                        child: Container(
                                          color: Colors.white,
                                          child: DefaultTabController(
                                            length: 2,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30),
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      child: TabBar(
                                                          unselectedLabelColor:
                                                              Colors.black,
                                                          labelColor:
                                                              Colors.black,
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
                                                              text: "Advanced",
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
                                      ),
                                    ]),
                                  );
                                });
                          },
                          icon: SvgPicture.asset(
                            "assets/icon/icon_swap_settings.svg",
                            height: 20,
                            width: 20,
                            color: Colors.black,
                          )))
                ],
              ),
              ExchangeBox(
                needMax: true,
                isSend: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text("0 BTC",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Karla',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            color: Colors.grey.shade500)),
                  ),
                ],
              ),
              ExchangeBox(
                needMax: false,
                isSend: true,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Add Contact"),
                )
              ]),
              SizedBox(height: 15),
              SendButton(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Estimated fee",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.none,
                              color: Colors.grey.shade500)),
                      Text("≈ 0.005328 BNB",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.none,
                              color: Colors.grey.shade500)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Max gas fee",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.none,
                              color: Colors.grey.shade500)),
                      Text("≈ 0.009328 BNB",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.none,
                              color: Colors.grey.shade500)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
