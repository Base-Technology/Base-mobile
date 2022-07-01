import 'package:acy_ipay/widget/button_scan_address.dart';
import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import '../widget/CustomText.dart';

class AddGuardianManually extends StatefulWidget {
  const AddGuardianManually({Key? key}) : super(key: key);

  @override
  State<AddGuardianManually> createState() => _AddGuardianManuallyState();
}

class _AddGuardianManuallyState extends State<AddGuardianManually> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double resWidth = MediaQuery.of(context).size.width;

    // Text field controller
    final nameController = TextEditingController();
    final addressController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      nameController.dispose();
      addressController.dispose();
      super.dispose();
    }

    Widget addGuardian = SizedBox(
      width: 150,
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.transparent)),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFFC000)),
          ),
          onPressed: () {},
          child: Center(
            child: CustomText(
              "Add Guardian",
              fontSize: 16,
              textColor: Colors.black,
          )))
    );

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            TopBarSimple(title: "Add Guardian", isContact: false, isReferral: false),
            Container(
              width: resWidth * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        "Name: ",
                        fontSize: 16,
                      ),
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 8),
                            hintText: "Please name this address",
                            hintStyle: TextStyle(color: themeProvider.isDarkMode ? Color(0xFF979797) : Colors.grey.shade700),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Divider(thickness: 0.5, color: themeProvider.isDarkMode ? Color(0xFF979797) : Colors.grey.shade500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    "Address: ",
                    fontSize: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: addressController,
                          style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            hintText: "0x, ENS or Base username",
                            hintStyle: TextStyle(color: themeProvider.isDarkMode ? Color(0xFF979797) : Colors.grey.shade700),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      ScanAddress(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                addGuardian,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
