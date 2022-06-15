import 'package:acy_ipay/Swap/ExchangeBox.dart';
import 'package:acy_ipay/widget/button_scan_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddGuardianManually extends StatefulWidget {
  const AddGuardianManually({Key? key}) : super(key: key);

  @override
  State<AddGuardianManually> createState() => _AddGuardianManuallyState();
}

class _AddGuardianManuallyState extends State<AddGuardianManually> {
  @override
  Widget build(BuildContext context) {
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

    Widget topBar = Container(
      padding: const EdgeInsets.only(top: 25),
      margin: const EdgeInsets.only(bottom: 15),
      color: Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.black,
                )),
          ),
          const Text(
            'Add Guardian Manually',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.none,
                color: Colors.black),
          ),
        ],
      ),
    );

    Widget addGuardian = SizedBox(
      width: 150,
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.transparent)),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC000)),
          ),
          onPressed: (){},
          child: Center(
            child: Text("Add Guardian",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black)),
          )),
    );

    return Scaffold(
      body: Column(
          children: [
            topBar,
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
                      Text("Name: "),
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8),
                            hintText: "Please name this address",
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Divider(thickness: 0.5, color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 15,),
                  Text("Address: "),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: addressController,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          decoration: InputDecoration(
                            hintText: "0x, ENS or Base username",
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
    );
  }
}
