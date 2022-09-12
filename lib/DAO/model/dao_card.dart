import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';

class DaoCard extends StatelessWidget {
  const DaoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0E0E0E),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 15),
              CustomText(
                "MetaCartel Ventures",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
            CustomText("\$9,032,305.41", fontSize: 16, fontWeight: FontWeight.w400,),
          ],),
          SizedBox(height: 5),
          Row(
            children: [
              CustomText("74 Members", textColor: Color(0xFFE38522), fontSize: 14,),
              SizedBox(width: 10),
              CustomText(" | ", textColor: Color(0xFFE38522), fontSize: 14,),
              SizedBox(width: 10),
              CustomText("2 Tokens", textColor: Color(0xFFE38522), fontSize: 14,)
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE38522))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CustomText("VENTURES", textColor: Color(0xFFE38522), fontSize: 12,),
                )
              ),
              SizedBox(width: 10),
              CustomText("MAINNET", textColor: Color(0xFFE38522), fontSize: 12,)
            ],
          ),
        ],
      ),
    );
  }
}
