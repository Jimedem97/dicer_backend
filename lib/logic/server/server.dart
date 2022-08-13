import 'dart:convert';
import 'dart:io';

import 'package:dicer/logic/server/listeners/auto_run_listener.dart';
import 'package:dicer/logic/server/listeners/is_alive_listener.dart';
import 'package:dicer/logic/server/listeners/server_listener.dart';

class Server {
  HttpServer? _server;

  final Set<ServerListener> _listeners = {};

  void registerListener(ServerListener listener) {
    _listeners.add(listener);
  }

  Server._privateConstructor() {
    _startServer();
  }

  static final Server _instance = Server._privateConstructor();

  static Server get instance => _instance;

  void _startServer() async {
    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    registerListener(IsAliveListener());
    await _server?.forEach((HttpRequest request) async {
      final body = await utf8.decoder.bind(request).join();
      var match = _listeners.firstWhere((element) => element.doesMatch(request.uri.path, request.method), orElse: () => NotFoundListener());
      final responseCode = match.onMessageReceived(body);
      request.response.statusCode = responseCode;
      request.response.close();
    });
  }
}
