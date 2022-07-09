part of 'server_cubit.dart';

@immutable
abstract class ServerState {}

class ServerStarting extends ServerState {}

class ServerStarted extends ServerState {}
