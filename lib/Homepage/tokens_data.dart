import 'package:acy_ipay/Homepage/show_activity.dart';
import 'package:acy_ipay/Homepage/show_assets.dart';
import 'package:acy_ipay/Homepage/show_market.dart';
import 'package:acy_ipay/Homepage/show_nft.dart';
import 'package:acy_ipay/Homepage/widget/SeeMoreIconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TokensData extends StatefulWidget {
  final int changeIndex;
  const TokensData({Key? key, required this.changeIndex}) : super(key: key);

  @override
  State<TokensData> createState() => _TokensDataState();
}

class _TokensDataState extends State<TokensData>
    with AutomaticKeepAliveClientMixin {
  int dataIndex = 0;
  final pController = PageController(initialPage: 0);
  final controller = PageController(initialPage: 0);

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      dataIndex = index;
    });
  }

  void onParentPageViewChanged(int index) {
    setState(() {
      index = widget.changeIndex;
      controller.animateToPage(
        index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget _buildListTile(String assetPath, String dataString, int index) {
      bool isSelected = dataIndex == index;

      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: isSelected ? Border.all(color: Color(0xB3FFC000)) : null,
        ),
        child: ListTile(
          leading: SvgPicture.asset(
            assetPath,
            width: 30,
            height: 30,
            color: Color(0xFFF2F1F2),
          ),
          title: Text(
            dataString,
            style: TextStyle(
              fontFamily: 'Karla',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xE6F2F1F2),
            ),
          ),
          onTap: () => setState(() {
            dataIndex = index;
            controller.animateToPage(
              index,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
            Navigator.pop(context);
            /*Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: dataIndex == 1 ? resSlide = ShowAssets() : dataIndex == 2 ? resSlide = ShowNFT() : resSlide = ShowMarket())
            );*/
          }),
          trailing: isSelected
              ? FaIcon(
                  FontAwesomeIcons.check,
                  color: Color(0xB3FFC000),
                  size: 20,
                )
              : null,
        ),
      );
    }

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.fromLTRB(2, 10, 2, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: Color(0xFF030203),
        ),
        child: widget.changeIndex == 1
            ? ShowActivity()
            : Column(children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Container(
                    height: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xE61B1D1C),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 22,
                            ),
                            Text(
                              "Assets",
                              style: TextStyle(
                                  fontFamily: 'Karla',
                                  fontSize: 16,
                                  color: Color(0xFFBDBDBD),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "\$0",
                              style: TextStyle(
                                  fontFamily: 'Karla',
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SeeMoreIconButton(
                            titleText: "Token Details",
                            widgetList: [
                              _buildListTile("assets/icon/icon_assets.svg",
                                  "Show Assets", 0),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.5),
                                child: Divider(
                                    indent: 2,
                                    endIndent: 2,
                                    thickness: 1,
                                    height: 0.1,
                                    color: Color(0x1ABDBDBD)),
                              ),
                              _buildListTile(
                                  "assets/icon/icon_nft.svg", "Show NFT", 1),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.5),
                                child: Divider(
                                    indent: 2,
                                    endIndent: 2,
                                    thickness: 1.5,
                                    height: 0.1,
                                    color: Color(0x1ABDBDBD)),
                              ),
                              _buildListTile("assets/icon/icon_market.svg",
                                  "Show Market", 2)
                            ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      onPageChanged: onPageChanged,
                      children: [
                        ShowAssets(),
                        ShowNFT(),
                        ShowMarket(),
                      ]),
                )
              ]),
      ),
    );
  }
}