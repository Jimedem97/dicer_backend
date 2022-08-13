import 'dart:convert';

import 'package:dicer/dto/config_dto.dart';
import 'package:dicer/logic/server/listeners/server_listener.dart';

class DicerServerAutorunListener extends ServerListener{

  final DicerAutorunListener listener;

  DicerServerAutorunListener(this.listener);

  @override
  String getMethod() => "POST";

  @override
  String getPath() => "/dicer/autorun";

  @override
  int onMessageReceived(String body) {
    listener.onStartAutorunReceived(ConfigDto.fromJson(json.decode(body)));
    return 201;
  }
}

abstract class DicerAutorunListener{

  void onStartAutorunReceived(ConfigDto dto);
}

