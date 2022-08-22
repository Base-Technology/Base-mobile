import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:acy_ipay/color/colors.dart';
import 'package:acy_ipay/chatnew/controller/chat_controller.dart';
import 'package:acy_ipay/chatnew/widget/press_record_widget.dart';
import 'package:acy_ipay/core.dart';
import 'package:acy_ipay/utils/utils.dart';

import '../../../../language/strings.dart';

class RecordPreviewWidget extends StatelessWidget {

  final ChatController _controller = Get.find();

  RecordPreviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      var value = _controller.recordStatus.value;
      if(value == PressRecordWidgetState.VOICE_STATUS_START){
        return Container();
      }
      return Center(
        child: Container(
          width: 250.w,
          height: 250.w,
          decoration: Colours.black_transparent.boxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset(Utils.getImgPath(value == PressRecordWidgetState.VOICE_STATUS_END?"record_power_6":"record_cancel",dir: Utils.DIR_CHAT),width: 150.w,height: 150.w,),
                Text(value == PressRecordWidgetState.VOICE_STATUS_END?Ids.up_for_cancel.str():Ids.loosen_to_cancle.str(),style: TextStyle(color: Colours.white,fontSize: 32.sp),)
            ],
          ),
        ),
      );
    });
  }
}
