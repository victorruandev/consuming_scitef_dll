import 'package:consuming_scitef_dll/page3/page3.dart';
import 'package:consuming_scitef_dll/tef_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late final TefController _tef;

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

  void _iniciaFuncaoSiTefInterativo() {
    if (_tef.resultConfig == 0) {
      String dataFiscalAaaaMmDd = formatDate(DateTime.now(), [yyyy, mm, dd]);
      String horaFiscalHhMmSs = formatDate(DateTime.now(), [HH, nn, ss]);
      String products =
          '[<Arroz>;<000001>;<1>;<5,00>];[<Feijão>;<000002>;<1>;<10,00>];';
      _tef.iniciaFuncaoSiTefInterativo(
          2,
          '15,00',
          '000000001',
          dataFiscalAaaaMmDd, // AAAAMMDD
          horaFiscalHhMmSs,
          'SGE Victor',
          '',
          products);
    }
    debugPrint('Função iniciada!');
  }

  void _comecaPagamentoDebito() {
    String products =
        '[<Arroz>;<000001>;<1>;<5,00>];[<Feijão>;<000002>;<1>;<10,00>];';
    _tef.comecarVendaPagamentoDebito(
        '15,00', '000000002', 'SGE Victor', products);
    debugPrint('Pagamento em débito iniciado!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implementação do SiTef2'),
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
          _comecaPagamentoDebito();
          if (_tef.resultStart == 10000) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Page3(title: 'some shit'),
              ),
            );
          }
        },
        tooltip: 'Funções!',
        child: const Icon(
          Icons.payment,
        ),
      ),
    );
  }
}
