import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeMoreIconButton extends StatelessWidget {
  final String titleText;
  final List<Widget> widgetList;
  const SeeMoreIconButton(
      {Key? key, required this.titleText, required this.widgetList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  child: Container(
                    color: Colors.white,
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              titleText,
                              style: TextStyle(
                                fontFamily: 'Karla',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 5),
                          child: Column(
                            children: [
                              ...widgetList,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        icon: SvgPicture.asset(
          "assets/icon/icon_more_vert.svg",
          color: Colors.black,
          height: 25,
          width: 25,
        ));
  }
}
