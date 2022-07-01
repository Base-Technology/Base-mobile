import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:acy_ipay/theme_provider.dart';
import '../../widget/CustomText.dart';

class AddContact extends StatefulWidget {
  final String? name;
  final String? address;
  const AddContact({Key? key, this.name, this.address}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  late TextEditingController userInput =
      TextEditingController(text: widget.name ?? "");
  late TextEditingController tokenAddressInput =
      TextEditingController(text: widget.address ?? "");

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Widget nameInput = Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "Name",
            fontSize: 14,
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black),
              color: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.transparent,
            ),
            child: TextField(
              controller: userInput,
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 6),
                  hintText: "Name",
                  hintStyle: TextStyle(color: themeProvider.isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700, fontWeight: FontWeight.w400),
                  fillColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.transparent,
                  border: InputBorder.none
                  ),
              style: TextStyle(
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );

    Widget addressInput = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          "Address",
          fontSize: 14,
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black),
            color: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: tokenAddressInput,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.transparent,
                      contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 6),
                      hintText: "Address",
                      hintStyle: TextStyle(color: themeProvider.isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700, fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                    ),
                  style: TextStyle(
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 45,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFFFC000)),
                        ),
                        onPressed: () {
                          FlutterClipboard.paste().then((value) {
                            setState(() {
                              tokenAddressInput.text = value;
                            });
                          });
                        },
                        child: Center(
                          child: CustomText(
                            "Paste",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code_scanner_outlined,
                      size: 25,
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );

    Widget addButton = Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        height: 45,
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
          child: CustomText(
            widget.name != null ? "Update" : "Add",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ));

    Widget deleteButton = Container(
        height: 45,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.transparent)),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icon/icon_delete.svg",
                  color: Colors.red.shade500),
              CustomText(
                "Delete Contact",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: Colors.red.shade500,
              ),
            ],
          ),
        ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBarSimple(
                title: widget.name != null || widget.address != null
                    ? "Edit Contact"
                    : "Add Contact",
                isContact: false,
                isReferral: false),
            nameInput,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: addressInput,
            ),
            Divider(
                height: 45,
                thickness: 0.5,
                indent: 25,
                endIndent: 25,
                color: Colors.grey.shade600),
            widget.name != null || widget.address != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: deleteButton,
                  )
                : SizedBox(height: 1),
            addButton
          ],
        ),
      ),
    );
  }
}
