import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecurityBox extends StatefulWidget {
  const SecurityBox({Key? key}) : super(key: key);

  @override
  State<SecurityBox> createState() => _SecurityBoxState();
}

class _SecurityBoxState extends State<SecurityBox> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xE60F0F0F),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16,),
              Text(
                "Security",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset("assets/icon/icon_password.svg",color: Colors.white,height: 20,width: 20,),
            title: Text("Change PIN",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),),
            onTap: (){},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset("assets/icon/icon_fingerprint.svg",color: Colors.white,height: 20,width: 20,),
            title: Text("Fingerprint",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),),
            onTap: (){},
            trailing: Switch(
              value: isSwitched,
              inactiveTrackColor: Color(0x26FFC000),
              activeTrackColor: Color(0x26FFC000),
              activeColor: Color(0xFFFFC000),
              inactiveThumbColor: Color(0xFFFFC000),
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
