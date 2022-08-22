import 'package:acy_ipay/core.dart';

class Constant{

  Constant._();

  static const String JMESSAGE_APP_KEY = '2bb8339fd8bddd6634505ab6';///极光appkey
  static const String JMESSAGE_MASTER_SECRET = '6f1be8e4bd1cfa39ea3d8bcd';///极光appkey

  static const String SP_COLOR_THEME = 'SP_COLOR_THEME';///主题色
  static const String SP_KEY_LANGUAGE = 'SP_KEY_LANGUAGE';///多语言
  static const String SP_LAST_LOCATION = 'SP_LAST_LOCATION';///上次定位

  static const String QRCODE_TYPE_BUSINESS_CARD = 'QRCODE_TYPE_BUSINESS_CARD';///个人二维码
  static const String QRCODE_TYPE_BUSINESS_CHAT = 'QRCODE_TYPE_BUSINESS_CHAT';///群聊二维码

  static const double MAP_ZOOM = 16.0;
  static const int PAGE_SIZE = 20;


  static const String OBJECT_NAME_RED_PACKET = 'redPacket';
  static const String OBJECT_NAME_FRIEND_CIRCLE = 'friendCircle';
  static const String OBJECT_NAME_CHANNLES = 'channles';
  static const String OBJECT_NAME_CHANNLES_COMMENTS = 'channlesComments';

  static final  double MAX_PHOTO_WIDTH = 600.w;
  static final double MAX_PHOTO_HEIGHT = 600.w;
  static final double MIN_PHOTO_WIDTH = 300.w;
  static final double MIN_PHOTO_HEIGHT = 300.w;

}