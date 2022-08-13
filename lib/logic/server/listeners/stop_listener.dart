import 'dart:convert';

import 'package:dicer/dto/config_dto.dart';
import 'package:dicer/logic/server/listeners/server_listener.dart';

class DicerServerStopListener extends ServerListener{

  final DicerStopListener listener;

  DicerServerStopListener(this.listener);

  @override
  String getMethod() => "POST";

  @override
  String getPath() => "/dicer/stop";

  @override
  int onMessageReceived(String body) {
    listener.onStopReceived();
    return 201;
  }
}

abstract class DicerStopListener{

  void onStopReceived();
}

