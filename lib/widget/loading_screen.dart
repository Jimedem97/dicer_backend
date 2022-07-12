import 'package:dicer/bloc/server_cubit.dart';
import 'package:dicer/logic/server/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  void startServer(BuildContext context) async {
    Server.instance;
    context.read<ServerCubit>().onServerStarted();
  }

  @override
  Widget build(BuildContext context) {
    startServer(context);
    return const Center(child: SizedBox(child: CircularProgressIndicator()));
  }
}
