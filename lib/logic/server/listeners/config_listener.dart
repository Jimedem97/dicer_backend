import 'dart:convert';

import 'package:dicer/dto/config_dto.dart';
import 'package:dicer/logic/server/listeners/server_listener.dart';

class DicerServerConfigListener extends ServerListener {
  final DicerConfigListener listener;

  DicerServerConfigListener(this.listener);

  @override
  String getMethod() => "POST";

  @override
  String getPath() => "/dicer/config";

  @override
  int onMessageReceived(String body) {
    final success =
        listener.onConfigReceived(ConfigDto.fromJson(json.decode(body)));
    if (success) {
      return 201;
    } else {
      return 406;
    }
  }
}

abstract class DicerConfigListener {
  bool onConfigReceived(ConfigDto dto);
}
