import 'package:flutter/cupertino.dart';

class TefModel with ChangeNotifier {
  final String siTefEnderecoIp;
  final String codigoEmpresa;
  final String identificaoTerminal;
  final String reservado;

  TefModel({
    this.siTefEnderecoIp = '192.168.0.116',
    this.codigoEmpresa = '00000000',
    this.identificaoTerminal = 'SG000001',
    this.reservado = '0',
  });
}
