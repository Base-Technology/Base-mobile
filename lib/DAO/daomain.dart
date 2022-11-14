import 'package:acy_ipay/DAO/model/dao_proposal_card.dart';
import 'package:acy_ipay/DAO/model/dao_drawer.dart';
import 'package:acy_ipay/Homepage/navigation_drawer.dart';

import '../widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class DaoMain extends StatelessWidget {
  const DaoMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      drawer: const DaoDrawer(),
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () { Navigator.pop(context); },

            );
          },
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        title: CustomText("Discover DAO"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Tets")
          ],
        )
      )
    );
  }
}
