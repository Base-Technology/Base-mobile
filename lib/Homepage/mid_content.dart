import 'package:acy_ipay/Homepage/show_balance.dart';
import 'package:acy_ipay/Homepage/widget/ColumnIconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class midContent extends StatefulWidget {
  const midContent({Key? key}) : super(key: key);

  @override
  State<midContent> createState() => _midContentState();
}

class _midContentState extends State<midContent> {
  String qrCode = '';
  bool showBalance = false;
  @override
  Widget build(BuildContext context) {
    double resWidth = MediaQuery.of(context).size.width;

    //TO-DO: Handle situation for deposit/withdrawal
    Future<void> scanQrCode() async {
      try {
        final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ffffff',
          "Cancel",
          true,
          ScanMode.QR,
        );
        if (!mounted) return;
        setState(() {
          this.qrCode = qrCode.isEmpty
              ? ''
              : qrCode == '-1'
                  ? ''
                  : qrCode;
        });
      } on PlatformException {
        qrCode = 'Failed to get platform version';
      }
    }

    Widget fourButtonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ColumnIconButton(
          buttonText: "Buy",
          assetPath: "assets/icon/icon_buy.svg",
          onClicked: () {},
          color: Color(0xFFBDBDBD),
        ),
        ColumnIconButton(
          buttonText: 'Receive',
          assetPath: "assets/icon/icon_down.svg",
          onClicked: () {},
          color: Color(0xFFBDBDBD),
        ),
        ColumnIconButton(
          buttonText: 'Send',
          assetPath: "assets/icon/icon_up.svg",
          onClicked: () {},
          color: Color(0xFFBDBDBD),
        ),
        ColumnIconButton(
          buttonText: 'Scan QR',
          assetPath: "assets/icon/icon_scan.svg",
          onClicked: () => scanQrCode(),
          color: Color(0xFFBDBDBD),
        ),
      ],
    );

    Widget tapToBuy = Container(
        width: resWidth * 0.75,
        margin: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.5)),
          color: Colors.white,
        ),
        child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color(0xF2FFC000),
                  radius: 28,
                  child: FaIcon(FontAwesomeIcons.creditCard,
                      color: Colors.white, size: 22),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Buy crypto for free',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              )
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Your first crypto purchase is on us.',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Tap here to buy.',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                      ],
                    ))
              ],
            )));

    Widget tapToShowBalance = GestureDetector(
      onTap: () {
        showBalance = !showBalance;
      },
      child: Container(
        width: resWidth * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.ellipsis,
                      color: Colors.white, size: 55),
                  Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: FaIcon(FontAwesomeIcons.ellipsis,
                          color: Colors.white, size: 55))
                ]),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                  width: 28.0,
                  child: SvgPicture.asset(
                      showBalance
                          ? "assets/icon/icon_visibility_on.svg"
                          : "assets/icon/icon_visibility_off.svg",
                      height: 10,
                      width: 10,
                      color: Color(0xE6BDBDBD)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.8),
                  child: Text(
                    showBalance ? "Hide Balance" : 'Show Balance',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 10,
                        color: Color(0xE6BDBDBD),
                        decoration: TextDecoration.none),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

    return Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ShowBalance(),
            fourButtonSection,
          ],
        ));
  }
}
