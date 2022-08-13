import 'package:dicer/logic/server/listeners/server_listener.dart';

class IsAliveListener extends ServerListener {
  @override
  String getPath() => "/isAlive";

  @override
  String getMethod() => "GET";

  @override
  int onMessageReceived(String body) => 200;
}
