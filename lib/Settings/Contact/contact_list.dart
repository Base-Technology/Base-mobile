import 'package:acy_ipay/Settings/Contact/add_contact.dart';
import 'package:acy_ipay/Constant/contact_data.dart';
import 'package:flutter/material.dart';

import '../../widget/CustomText.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddContact(
                        name: userList[index].username,
                        address: userList[index].address,
                      )));
            },
            leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(userList[index].profile_pic_URL)),
            title: Row(
              children: [
                CustomText(
                  userList[index].username,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                SizedBox(width: 12),
                CustomText(
                  userList[index].nickname,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ],
            ),
            subtitle: CustomText(
              userList[index].address,
              fontWeight: FontWeight.w400,
              textColor: Colors.grey.shade500,
              fontSize: 12,
            ),
          );
        });
  }
}
