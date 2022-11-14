import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';

class DaoCard extends StatelessWidget {
  final String type;
  final String name;
  final String amount;
  final String date;
  const DaoCard({Key? key, required this.type, required this.name, required this.amount, required this.date}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            type,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white,
          ),
          SizedBox(height: 8),
          CustomText(name, fontSize: 16, fontWeight: FontWeight.w400, textColor: Color(0xFFBABBBF),),
          SizedBox(height: 5),
          CustomText("Requesting for " + amount, textColor: Color(0xFFE38522), fontSize: 14,),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE38522))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CustomText("Submitted on " + date, textColor: Color(0xFFE38522), fontSize: 12,),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
