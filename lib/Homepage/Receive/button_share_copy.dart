import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShareCopyButton extends StatelessWidget {
  final String text;
  final String address;
  const ShareCopyButton({Key? key, required this.text, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void share() => {};
    void copy() => {
          Clipboard.setData(ClipboardData(text: address)).then((value) {
            //only if ->
            final snackBar = SnackBar(
              duration: Duration(seconds: 3),
              padding: EdgeInsets.only(bottom: 10),
              content: SizedBox(
                  height: 25,
                  child: Center(child: Text('Copied to Clipboard'))),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          })
        };

    return SizedBox(
      width: 125,
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
          onPressed: text == "Share" ? share : copy,
          child: Text(text,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  color: Colors.black))),
    );
  }
}
