import 'dart:convert';

import 'package:dicer/dto/config_dto.dart';
import 'package:dicer/logic/server/listeners/server_listener.dart';

class DicerServerStartListener extends ServerListener{

  final DicerStartListener listener;

  DicerServerStartListener(this.listener);

  @override
  String getMethod() => "POST";

  @override
  String getPath() => "/dicer/start";

  @override
  int onMessageReceived(String body) {
    listener.onStartReceived();
    return 201;
  }
}

abstract class DicerStartListener{

  void onStartReceived();
}

