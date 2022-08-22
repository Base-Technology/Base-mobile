import 'package:flutter/material.dart';
import 'package:acy_ipay/core.dart';
import 'package:acy_ipay/utils/utils.dart';
import 'package:acy_ipay/widget/tap_widget.dart';

class CommonSwitch extends StatelessWidget {

  bool status;
  ValueChanged<bool> onChange;

  CommonSwitch({required this.status,required this.onChange,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapWidget(onTap: () {
      onChange.call(!status);
    },
    child: Image.asset(Utils.getIconImgPath(status?'switch_open':'switch_close'),width: 100.w,height: 80.w,));
  }
}
