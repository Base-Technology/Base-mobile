import 'package:acy_ipay/Homepage/token_graph.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:acy_ipay/Constant/token_data.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

final cities = ["KL", 'BANGKOK', 'LONDON', 'SEOUL', 'TOKYO'];

final sug = ['KL', 'SEOUL'];

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

    @override
    Widget buildResults(BuildContext context) {
      //show
      return SizedBox();
    }

    @override
    Widget buildSuggestions(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      final res = tokenList.where((p) => p.name.toLowerCase().startsWith(query.toLowerCase())).toList();
      return ListView.builder(
          itemCount: res.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor:  themeProvider.isDarkMode ? Colors.black : Colors.white,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TokenGraph(tokenName: res[index].symbol)));
                super.showResults(context);
              },
              leading: SvgPicture.asset(res[index].assetPath, width: 20, height: 20),
              title: CustomText(res[index].name),
            );
          });
    }
}
