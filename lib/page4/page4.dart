import 'package:consuming_scitef_dll/tef_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  late final TefController _tef;

  String? confirma;

  @override
  void initState() {
    super.initState();
    _tef = context.read<TefController>();
  }

  @override
  void dispose() {
    super.dispose();
    _tef.dispose();
  }

  void _finalizaFuncaoSiTefInterativo() {
    _tef.finalizaFuncaoSiTefInterativo(
      '1',
      '0',
      '0',
      '0',
      '0',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finaliza Função'),
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
        onPressed: () => _finalizaFuncaoSiTefInterativo(),
        tooltip: 'Finaliza Função',
        child: const Icon(
          Icons.payment,
        ),
      ),
    );
  }
}
