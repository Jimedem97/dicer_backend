abstract class ServerListener {
  String getPath() => "";

  String getMethod() => "";

  int onMessageReceived(String body) {
    return 404;
  }

  bool doesMatch(String requestPath, String requestMethod) {
    return requestMethod == getMethod() && requestPath == getPath();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerListener &&
          runtimeType == other.runtimeType &&
          getPath() == other.getPath();

  @override
  int get hashCode => 0;
}

class NotFoundListener extends ServerListener {
  @override
  int onMessageReceived(String body) => 404;
}
