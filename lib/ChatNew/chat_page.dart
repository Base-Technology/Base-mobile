import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:acy_ipay/base/base_view.dart';
import 'package:acy_ipay/core.dart';
import 'package:acy_ipay/chatnew/controller/chat_controller.dart';
import 'package:acy_ipay/chatnew/widget/chat_input_widget.dart';
import 'package:acy_ipay/chatnew/widget/message/message_item.dart';
import 'package:acy_ipay/chatnew/widget/record_preview_widget.dart';
import 'package:acy_ipay/utils/navigator_utils.dart';
import 'package:acy_ipay/widget/base_scaffold.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:acy_ipay/widget/refresh/refresh_widget.dart';
import '../../../color/colors.dart';
import '../../../utils/utils.dart';
import '../../../widget/tap_widget.dart';
import 'chat_detail_page.dart';

class ChatPage extends BaseGetBuilder<ChatController>{

  static const String routeName = '/ChatPage';

  @override
  Widget controllerBuilder(BuildContext context, ChatController controller){
    return MyScaffold(
        title: controller.conversation?.title(showMember: true)??'',
        body: _buildBody(context),
      actions: [
        TapWidget(onTap: () async {
          if(controller.conversation != null){
            NavigatorUtils.toNamed(ChatDetailPage.routeName,arguments:controller.conversation);
          }
        }, child: Image.asset(Utils.getImgPath('ic_more_black',dir: Utils.DIR_ICON,),width: 40.w,height: 40.w,))
      ],
    );
  }

  @override
  ChatController? getController() => ChatController();

  _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildContent(),
        const ChatInputWidget(),
      ],
    );
  }

  _buildContent(){
    return Expanded(child: Stack(
      children: [
        Obx(()=> Container(color: Colours.c_EEEEEE,
          ///聊天列表需要反转，方便滚动到底部
          child: RefreshWidget(
            enablePullDown: false,
            onLoading: (_con) async {
              await controller.refreshMessage();
              return true;
            },
            onRefresh: (_con) async{
              return true;
            },
            child: ListView.builder(itemBuilder: (context , index){
              return AutoScrollTag(
                  controller: controller.listScrollerController,
                  index: index,
                  key: ValueKey(index),
                  child: MessageItem(message: controller.messages[index],lastMessage: controller.messages.safetyItem(index+1),));
            },itemCount: controller.messages.length,controller: controller.listScrollerController,reverse: true,),
          ),),
        ),
        RecordPreviewWidget()
      ],
    ));
  }

}