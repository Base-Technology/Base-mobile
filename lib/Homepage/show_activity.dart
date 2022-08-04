import 'package:acy_ipay/Homepage/zero_record.dart';
import 'package:acy_ipay/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:acy_ipay/Constant/activity_data.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'package:intl/intl.dart';

class ShowActivity extends StatelessWidget {
  const ShowActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }

    return Scaffold(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        body: Container(
            child: activityList.isEmpty
                ? const ZeroRecord()
                : SafeArea(
                  minimum: const EdgeInsets.only(bottom: 20),
                  child: StickyGroupedListView<dynamic, String>(
                      shrinkWrap: true,
                      elements: activityList,
                      groupBy: (element) => element['date'].substring(0, 10),
                      groupSeparatorBuilder: (dynamic element) => Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            color: themeProvider.isDarkMode
                                ? const Color(0xF264B6F7)
                                : const Color(0xF2FFCC00),
                          ),
                              child: Text( DateFormat.MMMd().format(DateTime.parse(element['date'])) + ', ' + element['date'].substring(0,4),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Karla',
                                      color: themeProvider.isDarkMode
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                          ]),
                      itemComparator: (item1, item2) =>
                          item1['date'].compareTo(item2['date']),
                      itemBuilder: (context, element) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                              leading: Icon(Icons.heat_pump),
                              tileColor: themeProvider.isDarkMode ? Color(0xFF2C303A) : Color(0xFFF8FDFB),
                              title: Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                CustomText(element['action']),
                                element['action'] == 'From' ||
                                        element['action'] == 'Send'
                                    ? CustomText(element['address'], fontWeight: FontWeight.w500, fontSize: 16,)
                                    : CustomText(element['tokenFrom'] + ' to ' + element['tokenTo'], fontSize: 14, textColor: Color(0XFF8F8E8C),)
                              ]),
                              trailing: element['action'] == 'From' ||
                                      element['action'] == 'Send'
                                  ? CustomText(element['amount'].toString())
                                  : SizedBox(width: 1)),
                        );
                      },
                      floatingHeader: true,
                      order: StickyGroupedListOrder.DESC,
                    ),
                )));
  }
}
