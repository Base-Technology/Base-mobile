import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:acy_ipay/Constant/token_data.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import '../widget/CustomText.dart';

class ShowAssets extends StatefulWidget {
  const ShowAssets({Key? key}) : super(key: key);

  @override
  State<ShowAssets> createState() => _ShowAssetsState();
}

class _ShowAssetsState extends State<ShowAssets> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ListView.separated(
        primary: false,
        padding: const EdgeInsets.only(bottom: 1),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: tokenList.length,
        separatorBuilder: (context, index) => Divider(
              indent: 0,
              endIndent: 0,
              thickness: 0.25,
              height: 0.1,
              color: themeProvider.isDarkMode ? Color(0xFF979797): Colors.grey.shade300,
            ),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
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
                        tokenList[index].assetPath,
                        height: 30,
                        width: 30,
                      ),
                    ]),
              ),
            ),
            title: CustomText(
              tokenList[index].symbol,
              fontSize: 16,
            ),
            trailing: SizedBox(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    "0.25",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  CustomText(
                    "\$732.5",
                    fontSize: 12,
                  )
                ],
              ),
            ),
          );
        });
  }
}
