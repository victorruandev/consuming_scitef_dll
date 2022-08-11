// import 'dart:ffi';
// import 'dart:io';

import 'package:consuming_scitef_dll/view.dart';
import 'package:flutter/material.dart';

// FFI signature of the hello_world C function
// typedef HelloWorldFunc = Int32 Function();
// Dart type definition for calling the C foreign function
// typedef HelloWorld = int Function();

// gcc -shared -fPIC -o libadd.dll assets/main.c -- > gera uma .dll
// gcc --share print.c -o print.dll
void main() {
  // String path = 'assets/dlls/SciTef/CliSiTef64I.dll';
  // assets\sumTwoElements.dll

  // var dll = DynamicLibrary.open(path);

  // final add =
  //     dll.lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>(
  //         'add');
  // // Call the function
  // add(1, 2);

  runApp(const MyApp());
}

// import 'package:call/core.dart';
// import 'package:flutter/material.dart';

// import 'dart:ffi' as ffi;
// // import 'package:call/call.dart';

// typedef FuncNative = ffi.Int32 Function(ffi.Int32, ffi.Int32);
// typedef FuncDart = int Function(int, int);

// void main() => runApp(const App());

// class App extends StatefulWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     String path = Windows().getCurrentPath();
//     debugPrint(path);

//     return Text(
//       path,
//       textDirection: TextDirection.ltr,
//       style: const TextStyle(color: Colors.white),
//     );
//   }
// }
