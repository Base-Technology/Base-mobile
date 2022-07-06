import 'package:acy_ipay/Homepage/show_assets.dart';
import 'package:acy_ipay/Homepage/show_nft.dart';
import 'package:acy_ipay/Invest/show_deposit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import 'show_strategy.dart';

class EarnTabView extends StatefulWidget {
  const EarnTabView({Key? key}) : super(key: key);

  @override
  State<EarnTabView> createState() => _EarnTabViewState();
}

class _EarnTabViewState extends State<EarnTabView>
    with SingleTickerProviderStateMixin {
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                unselectedLabelColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black,
                labelColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black,
                controller: _tabController,
                indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFFFFC000)),
                    insets: EdgeInsets.symmetric(horizontal: 45)),
                tabs: [
                  Tab(text: "Deposit",),
                  Tab(
                    text: "Strategy",
                  )
                ]
            ),
            Flexible(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  SingleChildScrollView(child: ShowDeposit()),
                  ShowStrategy(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
