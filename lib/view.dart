import 'package:consuming_scitef_dll/tef_controller.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late String _response;

  // void _showResult() {
  //   setState(() {
  //     _response;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Resultado da chamada da função!',
            ),
            Text(
              'some shit',
              // "a resposta é: $_response:",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final tef = TefController();
          // int codigoEmpresa = 00000000;
          // int identificaoTermina = 000001;
          // int siTefEnderecoIp = 192.168.0.116;
          // setState(() {
          //   _response = tef.configuraIntSiTefInterativo(
          //       "192.168.0.116", "00000000", "000001", "0");
          // });

          debugPrint(tef.configuraIntSiTefInterativo(
              "192.168.0.116", "00000000", "000001", "0"));
        },
        tooltip: 'Função',
        child: const Icon(Icons.add),
      ),
    );
  }
}
