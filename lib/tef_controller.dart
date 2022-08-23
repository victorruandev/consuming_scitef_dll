// ignore_for_file: non_constant_identifier_names

import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';
// import 'package:flutter/material.dart';

// typedef CConfiguraIntSiTefInterativo = ffi.Int32 Function(
//   ffi.Pointer<Utf8> codigoEmpresa,
//   ffi.Pointer<Utf8> identificaoTermina,
//   ffi.Pointer<Utf8> siTefEnderecoIp,
//   ffi.Pointer<Utf8> reservado,
// );

typedef CConfiguraIntSiTefInterativo = ffi.Int32 Function(
  ffi.Pointer<Utf8> IPSiTef, // endereço IP do servidor SiTef
  ffi.Pointer<Utf8> IdLoja, // XXnnnnnn
  ffi.Pointer<Utf8>
      IdTerminal, // Código da Empresa (no SiTef Demonstração este código é 00000000)
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
  ffi.Pointer<ffi.Int32> comando,
  ffi.Pointer<ffi.Long> tipoCampo,
  ffi.Pointer<Utf8> cupomFiscal,
  ffi.Pointer<Utf8> dataFiscal, // AAAAMMDD
  ffi.Pointer<Utf8> horaFiscal, // HHMMSS
  ffi.Pointer<Utf8> operador,
  ffi.Pointer<Utf8> paramAdic,
  ffi.Pointer<Utf8> produtos,
);
typedef DartContinuaFuncaoSiTefInterativo = int Function(
  int funcao,
  ffi.Pointer<Utf8> valor,
  ffi.Pointer<Utf8> cupomFiscal,
  ffi.Pointer<Utf8> dataFiscal, // AAAAMMDD
  ffi.Pointer<Utf8> horaFiscal, // HHMMSS
  ffi.Pointer<Utf8> operador,
  ffi.Pointer<Utf8> paramAdic,
  ffi.Pointer<Utf8> produtos,
);

const String siTefPathDll = 'assets/dlls/SiTef/CliSiTef64I.dll';

// int codigoEmpresa = 00000000;

// int identificaoTermina = 000001;

// String siTefEnderecoIp = '192.168.0.116';

class TefController {
  final tefLib = ffi.DynamicLibrary.open(siTefPathDll);
  // int codigoEmpresa = 00000000;
  // int identificaoTermina = 000001;
  // int siTefEnderecoIp = 192.168.0.116; 192.168.0.116

  /// ConfiguraIntSiTefInterativo: correga CliSiTef {chama-se uma vez apenas!}
  configuraIntSiTefInterativo(String siTefEnderecoIp, String codigoEmpresa,
      String identificacaoTerminal, String reservado) {
    // int ConfiguraIntSiTefInterativo (IPSiTef, IdLoja, IdTerminal, Reservado)
    // debugPrint(tefLib.toString());
    final configuraIntSiTefInterativo = tefLib.lookupFunction<
        CConfiguraIntSiTefInterativo,
        DartConfiguraIntSiTefInterativo>('ConfiguraIntSiTefInterativo');
    configuraIntSiTefInterativo(
      siTefEnderecoIp.toNativeUtf8(),
      codigoEmpresa.toNativeUtf8(),
      identificacaoTerminal.toNativeUtf8(),
      reservado.toNativeUtf8(),
      // '0'.toNativeUtf8(),
    );
    // return result.toInt();

    /// A rotina retorna um valor indicando se a configuração ocorreu com
    /// sucesso ou não. Caso retorne 0 (zero) o processo ocorreu de forma correta.
    // return 0;
  }

  /// int IniciaFuncaoSiTefInterativo (Funcao, Valor, CupomFiscal, DataFiscal, HoraFiscal, Operador, ParamAdic)
  iniciaFuncaoSiTefInterativo(
    int funcao,
    String valor,
    String cupomFiscal,
    String dataFiscal,
    String horaFiscal,
    String operador,
    String paramAdic,
    String produtos,
  ) {
    final configuraIntSiTefInterativo = tefLib.lookupFunction<
        CIniciaFuncaoAASiTefInterativo,
        DartIniciaFuncaoAASiTefInterativo>('ConfiguraIntSiTefInterativo');
    configuraIntSiTefInterativo(
      funcao,
      valor.toNativeUtf8(),
      cupomFiscal.toNativeUtf8(),
      dataFiscal.toNativeUtf8(), // AAAAMMDD
      horaFiscal.toNativeUtf8(), // HHMMSS
      operador.toNativeUtf8(),
      paramAdic.toNativeUtf8(),
      produtos.toNativeUtf8(),
    );
  }

  continuaFuncaoSiTefInterativo(
      comando, tipoCampo, tamMinimo, tamMaximo, buffer, tamBuffer, continua) {}

  // finalizaFuncaoSiTefInterativo() {
  //   // int
  //   /// confirmando ou não a transação dependendo, respectivamente, se o cupom
  //   /// foi impresso corretamente ou não.
  // }
}
