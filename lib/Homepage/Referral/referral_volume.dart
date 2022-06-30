import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';

class ReferralVolume extends StatelessWidget {
  const ReferralVolume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget referralContainer = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
        child: DataTable(
        columnSpacing: 35,
        decoration: BoxDecoration(
        color: const Color(0xE61B1D1C),
      ),
      headingRowColor: MaterialStateProperty.all<Color>(Color(0xE6292D2C)),
      columns: [
        DataColumn(
            label: Text(
          "Referral Code",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xF2979797)),
          softWrap: true,
          textAlign: TextAlign.center,
        )),
        DataColumn(
            label: Text(
          "Share (%)\nYou-Friend",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xF2979797)),
          softWrap: true,
          textAlign: TextAlign.center,
        )),
        DataColumn(
            label: Text("Friends",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xF2979797)))),
        DataColumn(
            label: Text("Vol. (USD)",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xF2979797)))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text(
            'ADHJKGO',
            style: TextStyle(color: Color(0xFFFFC000)),
          )),
          DataCell(Text('100-0',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('0',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('100',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797))))
        ]),
        DataRow(cells: [
          DataCell(Text('CXMDJEO', style: TextStyle(color: Color(0xFFFFC000)))),
          DataCell(Text('50-50',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('0',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('2000',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797))))
        ]),
        DataRow(cells: [
          DataCell(Text('CXMDJEO', style: TextStyle(color: Color(0xFFFFC000)))),
          DataCell(Text('25-75',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('0',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('2000',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797))))
        ]),
        DataRow(cells: [
          DataCell(Text('CXMDJEO', style: TextStyle(color: Color(0xFFFFC000)))),
          DataCell(Text('75-25',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('0',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('2000',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797))))
        ]),
        DataRow(cells: [
          DataCell(Text('CXMDJEO', style: TextStyle(color: Color(0xFFFFC000)))),
          DataCell(Text('0-100',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('0',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797)))),
          DataCell(Text('2000',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xF2979797))))
        ]),
      ],
    ));

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Color(0xE61B1D1C),
      child: Column(
        children: [
          referralContainer,
          Divider(height: 35, thickness: 0.5, indent: 10,endIndent: 10,color: Color(0xF2979797)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    "Referral Volume",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: Color(0xF2979797),
                ),
                Row(
                  children: [
                    CustomText(
                      "0",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: Color(0xF2979797),
                    ),
                    SizedBox(width: 45)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
