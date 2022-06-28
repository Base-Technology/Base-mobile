import 'package:acy_ipay/Settings/Contact/contact_main.dart';
import 'package:acy_ipay/Settings/wallet_guardian.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/CustomText.dart';
import 'security_box.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({Key? key}) : super(key: key);

  //@override
  //State<settingsMain> createState() => _settingsMainState();
//}

//class _settingsMainState extends State<settingsMain> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    Widget accountBox = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16,),
              CustomText(
                "Account",
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
              ),
            ],
          ),
          SizedBox(height: 5,),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_wallet.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Manage Wallets",
                fontWeight: FontWeight.w400,
                fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_recover.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Guardians",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WalletGuardian()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_contact.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Contacts",
                fontWeight: FontWeight.w400,
                fontSize: 16,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactMain()));
            },
          ),
        ],
      ),
    );

    Widget customTokensBox = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16,),
              CustomText(
                "Custom Tokens",
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ],
          ),
          SizedBox(height: 5),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_custom_token.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Add Custom Tokens",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_token_stack.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Manage Custom Tokens",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );

    _sendEmail() {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'test@base.com',
      );
      launch(emailLaunchUri.toString(), forceSafariVC: false);
    }

    Widget supportBox = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "Support",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_help.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Help Center",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_email.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Email",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            onTap: _sendEmail,
          ),
        ],
      ),
    );

    Widget othersBox = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "Others",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_contract.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Terms of Use",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_contract1.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_contract2.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Referral Policy",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_notification.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.fromLTRB(8, 25, 8, 0),
          color: Colors.white,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
                ]),
                accountBox,
                SizedBox(
                  height: 20,
                ),
                customTokensBox,
                SizedBox(
                  height: 20,
                ),
                SecurityBox(),
                SizedBox(
                  height: 20,
                ),
                supportBox,
                SizedBox(
                  height: 20,
                ),
                othersBox,
                SizedBox(
                  height: 20,
                ),
              ])),
    );
  }
}
