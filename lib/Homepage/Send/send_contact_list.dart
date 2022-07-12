import 'package:acy_ipay/Constant/contact_data.dart';
import 'package:acy_ipay/Settings/Contact/contact_main.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';

class SendContactList extends StatelessWidget {
  const SendContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                "Recent Contact",
                fontSize: 12,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ContactMain()));
                },
                child: CustomText(
                  "More",
                  fontSize: 12,
                  textColor: Color(0xFFFFCC00),
                ),
              )
            ],
          ),
        ),
        ListView.builder(
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            reverse: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: double.infinity,
                height: 45,
                child: ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              NetworkImage(userList[index].profile_pic_URL)),
                    ],
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        userList[index].username,
                        fontSize: 12,
                      ),
                      CustomText(
                        userList[index].address,
                        textColor: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
