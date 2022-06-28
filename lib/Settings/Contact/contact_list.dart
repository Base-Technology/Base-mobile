import 'package:acy_ipay/Settings/Model/UserCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widget/CustomText.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userList = [
      UserCard(
        profile_pic_URL: "https://storageapi.fleek.co/5bec74db-774b-4b8a-b735-f08a5ec1c1e6-bucket/icon_acy.svg",
        username: "john123",
        nickname: "John",
        address: "USA"
      )
    ];

    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
      return ListTile(
        tileColor: Colors.white,
        leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(userList[index].profile_pic_URL, scale: 1)
        ),
        title: Row(
          children: [
            CustomText(
              userList[index].username,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
            ),
            SizedBox(width: 12),
            CustomText(
              userList[index].nickname,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ],
        ),
        subtitle: CustomText(
          userList[index].address,
          fontWeight: FontWeight.w400,
          textColor: Colors.grey.shade500,
          fontSize: 12,
        ),
      );}
    );
  }
}
