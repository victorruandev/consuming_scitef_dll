import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get siTefEnderecoIp => _get('siTefEnderecoIp');
  static String get codigoEmpresa => _get('codigoEmpresa');
  static String get identificaoTerminal => _get('identificaoTerminal');
  static String get reservado => _get('reservado');

  static String _get(String name) => DotEnv().env[name] ?? '';
  // static int _getInt(String name) => int.parse(DotEnv().env[name]!);
}
