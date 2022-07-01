import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../theme_provider.dart';
import '../../widget/CustomText.dart';

class SeeMoreIconButton extends StatelessWidget {
  final String titleText;
  final List<Widget> widgetList;
  const SeeMoreIconButton(
      {Key? key, required this.titleText, required this.widgetList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return IconButton(
        onPressed: () async {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  child: Container(
                    color: themeProvider.isDarkMode ? const Color(0xE6292D2C) : Colors.white,
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: CustomText(
                              titleText,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Column(
                            children: [
                              ...widgetList,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        icon: SvgPicture.asset(
          "assets/icon/icon_more_vert.svg",
          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          height: 25,
          width: 25,
        ));
  }
}
