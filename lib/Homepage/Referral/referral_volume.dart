import 'package:acy_ipay/widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:acy_ipay/theme_provider.dart';
class ReferralVolume extends StatelessWidget {
  const ReferralVolume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final style1 = TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xF2979797));
    final style2 = TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black);
    final  resStyle = themeProvider.isDarkMode ? style1 : style2;

    Widget referralContainer = Stack(children: [
      Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        // set height 40
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)
        ),
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTable(
            headingRowHeight: 60,
            columnSpacing: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeProvider.isDarkMode ? const Color(0xE61B1D1C) : Colors.white,
            ),
            headingRowColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            columns: [
              DataColumn(
                  label: Text(
                "Referral Code",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: themeProvider.isDarkMode ? Color(0xF2979797) : Colors.black),
                softWrap: true,
                textAlign: TextAlign.center,
              )),
              DataColumn(
                  label: Text(
                "Share (%)\nYou-Friend",
                style: resStyle,
                softWrap: true,
                textAlign: TextAlign.center,
              )),
              DataColumn(
                  label: Text("Friends",
                      style: resStyle)),
              DataColumn(
                  label: Text("Vol. (USD)",
                      style: resStyle)),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text(
                  'ADHJKGO',
                  style: TextStyle(color: Color(0xFFFFC000)),
                )),
                DataCell(Text('100-0',
                    style: resStyle)),
                DataCell(Text('0',
                    style: resStyle)),
                DataCell(Text('100',
                    style: resStyle))
              ]),
              DataRow(cells: [
                DataCell(Text('CXMDJEO',
                    style: TextStyle(color: Color(0xFFFFC000)))),
                DataCell(Text('50-50',
                    style: resStyle)),
                DataCell(Text('0',
                    style: resStyle)),
                DataCell(Text('2000',
                    style: resStyle))
              ]),
              DataRow(cells: [
                DataCell(Text('CXMDJEO',
                    style: TextStyle(color: Color(0xFFFFC000)))),
                DataCell(Text('25-75',
                    style: resStyle)),
                DataCell(Text('0',
                    style: resStyle)),
                DataCell(Text('2000',
                    style: resStyle))
              ]),
              DataRow(cells: [
                DataCell(Text('CXMDJEO',
                    style: TextStyle(color: Color(0xFFFFC000)))),
                DataCell(Text('75-25',
                    style: resStyle)),
                DataCell(Text('0',
                    style: resStyle)),
                DataCell(Text('2000',
                    style: resStyle))
              ]),
              DataRow(cells: [
                DataCell(Text('CXMDJEO',
                    style: TextStyle(color: Color(0xFFFFC000)))),
                DataCell(Text('0-100',
                    style: resStyle)),
                DataCell(Text('0',
                    style: resStyle)),
                DataCell(Text('2000',
                    style: resStyle))
              ]),
            ],
          ))
    ]);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      color:  themeProvider.isDarkMode ? Color(0xE61B1D1C) : Colors.white,
      child: Column(
        children: [
          referralContainer,
          Divider(
              height: 35,
              thickness: 0.5,
              indent: 10,
              endIndent: 10,
              color: themeProvider.isDarkMode ? Color(0xF2979797) : Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Referral Volume",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: themeProvider.isDarkMode ? Color(0xF2979797) : Colors.black
                ),
                Row(
                  children: [
                    CustomText(
                      "0",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: themeProvider.isDarkMode ? Color(0xF2979797) : Colors.black
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
