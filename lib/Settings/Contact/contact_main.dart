import 'package:acy_ipay/Settings/Contact/add_contact.dart';
import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';

import '../../widget/CustomText.dart';
import 'contact_list.dart';

class ContactMain extends StatelessWidget {
  const ContactMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonAddContact = SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black)),
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
              color: Colors.black,
            ),
            CustomText("Add Contact", fontSize: 16, fontWeight: FontWeight.w400)
          ]),
        ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopBarSimple(title: "Contacts", isContact: true),
          ContactList(),
          SizedBox(height: 10),
          buttonAddContact,
        ],
      ),
    );
  }
}
