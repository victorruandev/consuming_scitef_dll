import 'dart:async';

import 'package:consuming_scitef_dll/page2/page2.dart';
import 'package:consuming_scitef_dll/tef_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late final TefController _tef;

  String? confirma;

  @override
  void initState() {
    _tef = context.read<TefController>();
    // compute()
    // Isolate.spawn(_configuraIntSiTefInterativo, '0');
    super.initState();
  }

  @override
  void dispose() {
    _tef.dispose();
    super.dispose();
  }

  Future _configuraIntSiTefInterativo() async {
    var result;
    if (_tef.resultConfig == null || _tef.resultConfig != 0) {
      // só chama se o seu valor for null!
      var result = await _tef.configuraIntSiTefInterativo(
        _tef.tefModel.siTefEnderecoIp,
        _tef.tefModel.codigoEmpresa,
        _tef.tefModel.identificaoTerminal,
        _tef.tefModel.reservado,
      );
    }
    // return result;

    // debugPrint('Configurado!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implementação do SiTef'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Resultado das chamada das funções!',
          ),
          Consumer<TefController>(
            builder: (context, controller, child) {
              return Text(
                '''
                  Resultado da configuração: ${_tef.resultConfig},
                  Resultado da inicialização da funçao: ${_tef.resultStart},
                  Resultado da continuação: ${_tef.resultContinue},
                  Resultado da finalização: ${_tef.confirma},
                ''',
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final tef = TefLibrary(ffi.DynamicLibrary.open('assets/dlls/SiTef/CliSiTef64I.dll'));
          // await compute(
          //   _configuraIntSiTefInterativo,
          //   '0',
          // );
          _configuraIntSiTefInterativo();
          if (_tef.resultConfig == 0) {
            debugPrint('SiTef Configurado!');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Page2(title: 'shit'),
              ),
            );
          }
        },
        tooltip: 'Pagamento!',
        child: const Icon(
          Icons.payment,
        ),
      ),
    );
  }
}
