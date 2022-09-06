import 'package:consuming_scitef_dll/tef_controller.dart';
import 'package:consuming_scitef_dll/tef_model.dart';
import 'package:consuming_scitef_dll/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // await DotEnv().load(fileName:'.env');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TefModel>(
          create: (_) => TefModel(),
        ),
        ChangeNotifierProvider<TefController>(
          create: (_) => TefController(tefModel: TefModel()),
        ),
        // Provider<SomethingElse>(create: (_) => SomethingElse()),
        // Provider<AnotherThing>(create: (_) => AnotherThing()),
      ],
      child: const MyApp(),
    ),
  );
}
