import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:acy_ipay/Constant/token_data.dart';

class ShowAssets extends StatefulWidget {
  const ShowAssets({Key? key}) : super(key: key);

  @override
  State<ShowAssets> createState() => _ShowAssetsState();
}

class _ShowAssetsState extends State<ShowAssets> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          primary: false,
          padding: EdgeInsets.only(bottom: 1),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: tokenList.length,
          separatorBuilder: (context, index) => Divider(
                indent: 0,
                endIndent: 0,
                thickness: 0.25,
                height: 0.1,
                color: Colors.grey.shade300,
              ),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          tokenList[index].assetPath,
                          height: 30,
                          width: 30,
                        ),
                      ]),
                ),
              ),
              title: Text(
                tokenList[index].symbol,
                style: TextStyle(
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black),
              ),
              trailing: SizedBox(
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "0.25",
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black), //
                    ),
                    Text(
                      "\$732.5",
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
