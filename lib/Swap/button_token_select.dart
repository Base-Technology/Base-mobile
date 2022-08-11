import 'package:acy_ipay/Constant/token_data.dart';
import 'package:acy_ipay/widget/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import '../Model/token.dart';
import '../widget/CustomText.dart';

class TokenSelect extends StatefulWidget {
  final Function(double) callback;
  const TokenSelect({Key? key, required this.callback,}) : super(key: key);

  @override
  State<TokenSelect> createState() => _TokenSelectState();
}

class _TokenSelectState extends State<TokenSelect> {
  late List<Token> resTokens;
  String query = '';

  @override
  void initState() {
    super.initState();
    resTokens = tokenList;
  }

  void searchToken(String userInput) {
    final filteredTokens = tokenList.where((token) {
      // TO-DO: Add search using token address
      final symbolLower = token.symbol.toLowerCase(); // Search using symbol
      final nameLower = token.name.toLowerCase(); // Search using name
      final searchLower = userInput.toLowerCase();

      return symbolLower.contains(searchLower) ||
          nameLower.contains(searchLower);
    }).toList();

    setState(() {
      query = userInput;
      resTokens = filteredTokens;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Widget buildToken(Token token) => ListTile(
          onTap: () {
            Navigator.pop(context);
            widget.callback(0.25);
          },
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: SizedBox(
              height: 32,
              width: 32,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      token.assetPath,
                      height: 30,
                      width: 30,
                    ),
                  ]),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                token.symbol,
                fontSize: 18,
              ),
              CustomText(
                token.name,
                fontSize: 16,
                textColor: Colors.grey.shade500
              ),
            ],
          ),
          trailing: CustomText(
            "0.25",
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        );

    return TextButton(
        onPressed: () async {
          showModalBottomSheet(
              elevation: 0,
              backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
              barrierColor: Colors.white.withOpacity(0),
              enableDrag: false,
              context: context,
              isScrollControlled: true,
              //isDismissible: true,
              //backgroundColor: Colors.white,
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                  ),
                  child: Container(
                    color: themeProvider.isDarkMode ? const Color(0xE6292D2C) : Colors.white,
                    child: DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.8,
                      minChildSize: 0.71,
                      maxChildSize: 0.8,
                      builder: (context, scrollController) {
                        return Column(
                          children: <Widget>[
                            SearchWidget(
                                text: query,
                                onChanged: searchToken,
                                hintText: "Enter name or paste address"),
                            Expanded(
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: resTokens.length,
                                shrinkWrap: true,
                                itemBuilder: (context, int index) {
                                  final token = resTokens[index];
                                  return buildToken(token);
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                );
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
              "BTC",
                  fontSize: 16,
                  fontWeight: FontWeight.w500
            ),
            SvgPicture.asset(
              "assets/icon/icon_expand.svg",
              height: 20,
              width: 15,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            )
          ],
        ));
  }
}
