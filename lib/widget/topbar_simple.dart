import 'package:flutter/material.dart';

class TopBarSimple extends StatelessWidget {
  final String title;
  final bool isContact;
  const TopBarSimple({Key? key, required this.title, required this.isContact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
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
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.none,
                color: Colors.black),
          ),
          isContact ? Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Icon(
                Icons.add_circle_outline_rounded,
                size: 25,
                color: Colors.black,
              ),
            ),
          ) : SizedBox(
            height: 30,
            width: 20,
          ),
        ],
      ),
    );
  }
}
