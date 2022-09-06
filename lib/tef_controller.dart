// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:ffi' as ffi;

import 'package:date_format/date_format.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/cupertino.dart';

import 'package:consuming_scitef_dll/tef_model.dart';

typedef CConfiguraIntSiTefInterativo = ffi.Int32 Function(
  ffi.Pointer<Utf8> IPSiTef, // endereço IP do servidor SiTef
  ffi.Pointer<Utf8> IdLoja, // XXnnnnnn
  ffi.Pointer<Utf8> IdTerminal, // Código da Empresa ( este código é 00000000)
  ffi.Pointer<Utf8> Reservado, // Deve ser passado com 0
);

typedef DartConfiguraIntSiTefInterativo = int Function(
  ffi.Pointer<Utf8> siTefEnderecoIp,
  ffi.Pointer<Utf8> codigoEmpresa,
  ffi.Pointer<Utf8> identificaoTerminal,
  ffi.Pointer<Utf8> reservado,
);

typedef CIniciaFuncaoAASiTefInterativo = ffi.Int32 Function(
  ffi.Int32 funcao,
  ffi.Pointer<Utf8> valor,
  ffi.Pointer<Utf8> cupomFiscal,
  ffi.Pointer<Utf8> dataFiscal, // AAAAMMDD
  ffi.Pointer<Utf8> horaFiscal, // HHMMSS
  ffi.Pointer<Utf8> operador,
  ffi.Pointer<Utf8> paramAdic,
  ffi.Pointer<Utf8> produtos,
);
typedef DartIniciaFuncaoAASiTefInterativo = int Function(
  int funcao,
  ffi.Pointer<Utf8> valor,
  ffi.Pointer<Utf8> cupomFiscal,
  ffi.Pointer<Utf8> dataFiscal, // AAAAMMDD
  ffi.Pointer<Utf8> horaFiscal, // HHMMSS
  ffi.Pointer<Utf8> operador,
  ffi.Pointer<Utf8> paramAdic,
  ffi.Pointer<Utf8> produtos,
);

typedef CContinuaFuncaoSiTefInterativo = ffi.Int32 Function(
  // ffi.Pointer<ffi.Int32> Comando,
  // ffi.Pointer<ffi.Long> TipoCampo,
  // ffi.Pointer<ffi.Short> TamMinimo,
  // ffi.Pointer<ffi.Short> TamMaximo,
  // ffi.Pointer<ffi.Char> Buffer,
  // ffi.Int32 TamBuffer,
  // ffi.Int32 Continua,
  ffi.Pointer<Utf8> Comando,
  ffi.Pointer<Utf8> TipoCampo,
  ffi.Pointer<Utf8> TamMinimo,
  ffi.Pointer<Utf8> TamMaximo,
  ffi.Pointer<Utf8> Buffer,
  ffi.Pointer<Utf8> TamBuffer,
  ffi.Pointer<Utf8> Continua,
);

typedef DartContinuaFuncaoSiTefInterativo = int Function(
  // int comando,
  // int tipoCampo,
  // int tamMinimo,
  // int tamMaximo,
  // String buffer,
  // int tamBuffer,
  // int continua,
  ffi.Pointer<Utf8> comando,
  ffi.Pointer<Utf8> tipoCampo,
  ffi.Pointer<Utf8> tamMinimo,
  ffi.Pointer<Utf8> tamMaximo,
  ffi.Pointer<Utf8> buffer,
  ffi.Pointer<Utf8> tamBuffer,
  ffi.Pointer<Utf8> continua,
);

// void FinalizaFuncaoSiTefInterativo (Confirma, CupomFiscal, DataFiscal,
// HoraFiscal, ParamAdic);

typedef CFinalizaFuncaoSiTefInterativo = ffi.Void Function(
  // ffi.Pointer<ffi.Int32> Comando,
  // ffi.Pointer<ffi.Long> TipoCampo,
  // ffi.Pointer<ffi.Short> TamMinimo,
  // ffi.Pointer<ffi.Short> TamMaximo,
  // ffi.Pointer<ffi.Char> Buffer,
  // ffi.Int32 TamBuffer,
  // ffi.Int32 Continua,
  ffi.Pointer<Utf8> Confirma,
  ffi.Pointer<Utf8> CupomFiscal,
  ffi.Pointer<Utf8> DataFiscal,
  ffi.Pointer<Utf8> HoraFiscal,
  ffi.Pointer<Utf8> ParamAdic,
);

typedef DartFinalizaFuncaoSiTefInterativo = void Function(
  // int comando,
  // int tipoCampo,
  // int tamMinimo,
  // int tamMaximo,
  // String buffer,
  // int tamBuffer,
  // int continua,
  ffi.Pointer<Utf8> Confirma,
  ffi.Pointer<Utf8> CupomFiscal,
  ffi.Pointer<Utf8> DataFiscal,
  ffi.Pointer<Utf8> HoraFiscal,
  ffi.Pointer<Utf8> ParamAdic,
);

const String siTefPathDll = 'assets/dlls/SiTef/CliSiTef64I.dll';

// int codigoEmpresa = 00000000;

// int identificaoTermina = 000001;

// String siTefEnderecoIp = '192.168.0.116';

final tefLib = ffi.DynamicLibrary.open(siTefPathDll);

// String dataFiscalAaaaMmDd = formatDate(DateTime.now(), [yyyy, mm, dd]);
// String horaFiscalHhMmSs = formatDate(DateTime.now(), [HH, nn, ss]);

class TefController with ChangeNotifier {
  int? resultConfig;
  int? resultStart;
  int? resultContinue;
  // String? confirma;
  String confirma = '0';

  String? siTefEnderecoIp;
  String? codigoEmpresa;
  String? identificaoTerminal;
  String? reservado;

  final TefModel tefModel;
  TefController({
    this.resultConfig,
    this.resultStart,
    this.resultContinue,
    this.siTefEnderecoIp,
    this.codigoEmpresa,
    this.identificaoTerminal,
    this.reservado,
    required this.tefModel,
  });

  Future configuraIntSiTefInterativo(
    String siTefEnderecoIp,
    String codigoEmpresa,
    String identificacaoTerminal,
    String reservado,
  ) async {
    final configuraIntSiTefInterativo = tefLib.lookupFunction<
        CConfiguraIntSiTefInterativo,
        DartConfiguraIntSiTefInterativo>('ConfiguraIntSiTefInterativo');
    var result = configuraIntSiTefInterativo(
      siTefEnderecoIp.toNativeUtf8(),
      codigoEmpresa.toNativeUtf8(),
      identificacaoTerminal.toNativeUtf8(),
      reservado.toNativeUtf8(),
    );

    resultConfig = result.toInt();
    notifyListeners();
    // return result.toInt();
  }

  // / int IniciaFuncaoSiTefInterativo (Funcao, Valor, CupomFiscal, DataFiscal, HoraFiscal, Operador, ParamAdic)
  Future<void> iniciaFuncaoSiTefInterativo(
      int funcao,
      String valor,
      String cupomFiscal,
      String dataFiscal,
      String horaFiscal,
      String operador,
      String paramAdic,
      String produtos) async {
    final iniciaFuncaoAASiTefInterativo = tefLib.lookupFunction<
        CIniciaFuncaoAASiTefInterativo,
        DartIniciaFuncaoAASiTefInterativo>('IniciaFuncaoAASiTefInterativo');

    var result = iniciaFuncaoAASiTefInterativo(
      funcao,
      valor.toNativeUtf8(),
      cupomFiscal.toNativeUtf8(),
      dataFiscal.toNativeUtf8(), // AAAAMMDD
      horaFiscal.toNativeUtf8(), // HHMMSS
      operador.toNativeUtf8(),
      paramAdic.toNativeUtf8(),
      produtos.toNativeUtf8(),
    );
    // return result.toInt();
    resultStart = result.toInt();
    notifyListeners();
  }

  continuaFuncaoSiTefInterativo(
    String comando,
    String tipoCampo,
    String tamMinimo,
    String tamMaximo,
    String buffer,
    String tamBuffer,
    String continua,
  ) {
    final continuaFuncaoSiTefInterativo = tefLib.lookupFunction<
        CContinuaFuncaoSiTefInterativo,
        DartContinuaFuncaoSiTefInterativo>('ContinuaFuncaoSiTefInterativo');

    var result = continuaFuncaoSiTefInterativo(
      comando.toNativeUtf8(),
      tipoCampo.toNativeUtf8(),
      tamMinimo.toNativeUtf8(),
      tamMaximo.toNativeUtf8(),
      buffer.toNativeUtf8(),
      tamBuffer.toNativeUtf8(),
      continua.toNativeUtf8(),
    );
    resultContinue = result.toInt();
    notifyListeners();
  }

  Future<void> finalizaFuncaoSiTefInterativo(
    String Confirma,
    String CupomFiscal,
    String DataFiscal,
    String HoraFiscal,
    String ParamAdic,
  ) async {
    final finalizaFuncaoSiTefInterativo = tefLib.lookupFunction<
        CFinalizaFuncaoSiTefInterativo,
        DartFinalizaFuncaoSiTefInterativo>('FinalizaFuncaoSiTefInterativo');

    finalizaFuncaoSiTefInterativo(
      Confirma.toNativeUtf8(),
      CupomFiscal.toNativeUtf8(),
      DataFiscal.toNativeUtf8(),
      HoraFiscal.toNativeUtf8(),
      ParamAdic.toNativeUtf8(),
    );
    confirma = Confirma;

    /// confirmando ou não a transação dependendo, respectivamente, se o cupom
    /// foi impresso corretamente ou não.
  }

  void comecarVendaPagamentoDebito(
    String valor,
    String cupomFiscal,
    String operador,
    String produtos,
  ) {
    String dataFiscalAaaaMmDd = formatDate(DateTime.now(), [yyyy, mm, dd]);
    String horaFiscalHhMmSs = formatDate(DateTime.now(), [HH, nn, ss]);
    iniciaFuncaoSiTefInterativo(
      2,
      valor,
      cupomFiscal,
      dataFiscalAaaaMmDd,
      horaFiscalHhMmSs,
      operador,
      '', // passado como "vazio"
      produtos,
    );
  }

  void cancelarVendaPagamentoDebito(
    String valor,
    String cupomFiscal,
    String operador,
    String produtos,
  ) {
    String dataFiscalAaaaMmDd = formatDate(DateTime.now(), [yyyy, mm, dd]);
    String horaFiscalHhMmSs = formatDate(DateTime.now(), [HH, nn, ss]);
    iniciaFuncaoSiTefInterativo(
      211,
      valor,
      cupomFiscal,
      dataFiscalAaaaMmDd,
      horaFiscalHhMmSs,
      operador,
      '', // passado como "vazio"
      produtos,
    );
    
  }

  // void cancelarVendaPagamentoDebito() {}
}
