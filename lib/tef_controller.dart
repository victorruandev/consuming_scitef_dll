class TefController {
  int codigoEmpresa = 00000000;

  /// ConfiguraIntSiTefInterativo: correga CliSiTef {chama-se uma vez apenas!}
  /// A não ser que se queira mudar os parâmetros de empresa, terminal ou IP
  configuraIntSiTefInterativo(
      // int
      int siTefEnderecoIp,
      int codigoEmpresa,
      int identificacaoTerminal) {
    /// A rotina retorna um valor indicando se a configuração ocorreu com
    /// sucesso ou não. Caso retorne 0 (zero) o processo ocorreu de forma correta.

    // return 0;
  }

  iniciaFuncaoSiTefInterativo() { // int
    /// No retorno, a ela devolve o valor 10000 para continuar a transação ou
    /// outro valor para encerrar.
  }
  continuaFuncaoSiTefInterativo(){ // int
  
  }

  finalizaFuncaoSiTefInterativo(){ // int
    /// confirmando ou não a transação dependendo, respectivamente, se o cupom 
    /// foi impresso corretamente ou não.
  }
  
}
