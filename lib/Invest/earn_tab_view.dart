import 'package:acy_ipay/Invest/show_deposit.dart';
import 'package:flutter/material.dart';

import 'earn_strategy_box.dart';

class EarnTabView extends StatefulWidget {
  const EarnTabView({Key? key}) : super(key: key);

  @override
  State<EarnTabView> createState() => _EarnTabViewState();
}

class _EarnTabViewState extends State<EarnTabView> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF030203),
        child: DefaultTabController(
            length: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBar(
                      unselectedLabelColor: Colors.white,
                      labelColor: Color(0xFFFFC000),
                      controller: _tabController,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 1.5, color: Color(0xFFFFC000)),
                          insets: EdgeInsets.symmetric(horizontal: 45)
                          ),
                        tabs: [
                          Tab(
                            text: "Deposit",
                          ),
                          Tab(
                            text: "Strategy",
                          )
                        ]
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                            ShowDeposit(),
                            EarnStrategyBox(),
                        ],
                  ))
                ],
              ),
            ),
        ),
      ),
    );
  }
}
