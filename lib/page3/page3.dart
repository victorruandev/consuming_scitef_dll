import 'package:consuming_scitef_dll/page4/page4.dart';
import 'package:consuming_scitef_dll/tef_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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

  void _continuaFuncaoSiTefInterativo() {
    _tef.continuaFuncaoSiTefInterativo(
      '0',
      '0',
      '0',  
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
        title: const Text('Implementação do SiTef3'),
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
        onPressed: () {
          _continuaFuncaoSiTefInterativo();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Page4(title: 'omg'),
            ),
          );
          debugPrint('Continuando função!');
        },
        tooltip: 'Continuar!',
        child: const Icon(
          Icons.payment,
        ),
      ),
    );
  }
}
