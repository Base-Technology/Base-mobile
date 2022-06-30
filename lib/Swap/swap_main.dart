import 'package:acy_ipay/Swap/button_swap_token.dart';
import 'package:acy_ipay/Swap/show_advanced_transaction.dart';
import 'package:acy_ipay/Swap/show_bacis_transaction.dart';
import 'package:acy_ipay/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/CustomText.dart';
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopBar(title: "Swap"),
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
                    const CustomText("Enter the amount",
                        fontSize: 15, fontWeight: FontWeight.w300),
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
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.79,
                                      child: Column(children: [
                                        const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: CustomText(
                                              "Transaction Settings",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: Colors.white,
                                            child: DefaultTabController(
                                              length: 2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        child: TabBar(
                                                            unselectedLabelColor:
                                                                Colors.black,
                                                            labelColor: Colors.black,
                                                            controller: _tabController,
                                                            indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 1.5, color: Color(0xFFFFC000)), insets: EdgeInsets.symmetric(horizontal: 10)),
                                                            tabs: [
                                                              Tab(
                                                                  text:
                                                                      "Basic"),
                                                              Tab(
                                                                  text:
                                                                      "Advanced")
                                                            ]),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      //height: 500,
                                                      //width: double.infinity,
                                                      child: TabBarView(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
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
                      child: CustomText("0 BTC",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.grey.shade500),
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
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 20),
                  child: ExchangeBox(
                    needMax: false,
                    isSend: false,
                  ),
                ),
                SwapToken(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
