import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'server_state.dart';

class ServerCubit extends Cubit<ServerState> {
  ServerCubit() : super(ServerStarting());

  void onServerStarted() => emit(ServerStarted());
}
