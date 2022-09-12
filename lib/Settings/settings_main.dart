import 'package:acy_ipay/Homepage/NavigationDrawer.dart';
import 'package:acy_ipay/Settings/Contact/contact_main.dart';
import 'package:acy_ipay/Settings/display_box.dart';
import 'package:acy_ipay/Settings/wallet_guardian.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import '../widget/CustomText.dart';
import 'security_box.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isSwitched = false;

    Widget accountBox = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Color(0xF20F0F0F) : Colors.white,
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
              CustomText(
                "Account",
                fontSize: 18,
              ),
            ],
          ),
          SizedBox(height: 5,),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_wallet.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Manage Wallets",
              fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_recover.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Guardians",
              fontSize: 16,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WalletGuardian()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_contact.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Contacts",
              fontSize: 16,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ContactMain()));
            },
          ),
        ],
      ),
    );

    Widget customTokensBox = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Color(0xF20F0F0F) : Colors.white,
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
              CustomText(
                "Custom Tokens",
                fontSize: 18,
              ),
            ],
          ),
          SizedBox(height: 5),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_custom_token.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Add Custom Tokens",
              fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_token_stack.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Manage Custom Tokens",
                fontSize: 16,
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Color(0xF20F0F0F) : Colors.white,
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
              CustomText(
                "Support",
                  fontSize: 18,
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
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Help Center",
              fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_email.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Email",
              fontSize: 16,
            ),
            onTap: _sendEmail,
          ),
        ],
      ),
    );

    Widget othersBox = Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Color(0xF20F0F0F) : Colors.white,
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
              CustomText(
                "Others",
                fontSize: 18,
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
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Terms of Use",
              fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_contract1.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Privacy Policy",
              fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_contract2.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Referral Policy",
              fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_notification.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Notifications",
              fontSize: 16,
            ),
            onTap: () {},
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF1EA838)),
        title: CustomText('Settings'),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(8, 25, 8, 0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  accountBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: customTokensBox,
                  ),
                  SecurityBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: DisplayBox(),
                  ),
                  supportBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: othersBox,
                  ),
                ])),
      ),
    );
  }
}
