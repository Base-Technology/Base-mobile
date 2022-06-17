import 'package:acy_ipay/Swap/button_swap_token.dart';
import 'package:acy_ipay/Swap/show_advanced_transaction.dart';
import 'package:acy_ipay/Swap/show_bacis_transaction.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/button_history.dart';
import '../widget/button_switch_chain.dart';
import '../widget/button_switch_wallet.dart';
import 'ExchangeBox.dart';

class SwapMain extends StatefulWidget {
  const SwapMain({Key? key}) : super(key: key);

  @override
  State<SwapMain> createState() => _SwapMainState();
}

class _SwapMainState extends State<SwapMain>
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

    Widget topBar = Container(
        padding: const EdgeInsets.only(top: 25, bottom: 15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                'Swap',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
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
          height: resHeight * 0.425,
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
                                  return Container(
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
              Center(
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icon/icon_swap_vert.svg",
                      height: 25,
                      width: 25,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 20),
                child: ExchangeBox(needMax: false),
              ),
              SwapToken(),
            ],
          ),
        ),
      ],
    );
  }
}
