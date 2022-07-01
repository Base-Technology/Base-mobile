import 'package:acy_ipay/Settings/Contact/add_contact.dart';
import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:acy_ipay/theme_provider.dart';
import '../../widget/CustomText.dart';
import 'contact_list.dart';

class ContactMain extends StatelessWidget {
  const ContactMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Widget buttonAddContact = SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: themeProvider.isDarkMode ? BorderSide(color: Colors.white) :  BorderSide(color: Colors.black)),
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddContact()));
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.add_rounded,
              size: 16,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
            CustomText("Add Contact", fontSize: 16)
          ]),
        ));

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: [
          TopBarSimple(title: "Contacts", isContact: true, isReferral: false),
          ContactList(),
          SizedBox(height: 10),
          buttonAddContact,
        ],
      ),
    );
  }
}
