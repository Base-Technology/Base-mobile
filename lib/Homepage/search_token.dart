import 'package:acy_ipay/Homepage/search_overall.dart';
import 'package:acy_ipay/Homepage/token_graph.dart';
import 'package:acy_ipay/Homepage/widget/token_details.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class SearchToken extends StatelessWidget {
  const SearchToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        body: Column(
          children: [
            const TopBarSimple(title: "Search", isContact: false, isReferral: false),
            GestureDetector(
              onTap: () {
                showSearch( 
                  context: context,
                  delegate: CustomSearchDelegate()
                );
              } ,
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width *0.9,
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode ? Color(0xF21B1D1C) : Colors.white,
                  border: Border.all(color: themeProvider.isDarkMode ? Colors.transparent : Colors.black),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CustomText("Search" , fontSize: 14,),
                  Icon(Icons.search_outlined, color: themeProvider.isDarkMode ? Color(0xFFF4F4F4): Colors.black,)
                ]),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.fromLTRB(0,25,0,15),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CustomText("Suggestion", fontSize:14),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      TokenDetails(tokenName: "ETH"),
                      TokenDetails(tokenName: "USDC"),
                      TokenDetails(tokenName: "USDT"),
                      TokenDetails(tokenName: "WBTC"),
                      TokenDetails(tokenName: "DAI"),
                      TokenDetails(tokenName: "UNI"),
                      TokenDetails(tokenName: "LINK"),
                      TokenDetails(tokenName: "AAVE"),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
