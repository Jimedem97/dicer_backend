import 'dart:io';

import 'package:dicer/bloc/dice_cubit.dart';
import 'package:dicer/bloc/server_cubit.dart';
import 'package:dicer/logic/server/server.dart';
import 'package:dicer/logic/server/listeners/server_listener.dart';
import 'package:dicer/widget/dice/five.dart';
import 'package:dicer/widget/dice/four.dart';
import 'package:dicer/widget/dice/one.dart';
import 'package:dicer/widget/dice/three.dart';
import 'package:dicer/widget/dice/two.dart';
import 'package:dicer/widget/dice_screen.dart';
import 'package:dicer/widget/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fela Würfel',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => DiceCubit()),
            BlocProvider(create: (_) => ServerCubit())
          ],
          child: const MainScreen(),
        ));
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerCubit, ServerState>(
      builder: (context, state) {
        if (state is ServerStarted) {
          return const DiceScreen();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
