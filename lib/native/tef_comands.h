int ConfiguraIntSiTefInterativo(char* IPSiTef, char* IdLoja, char* IdTerminal, char* Reservado);

int IniciaFuncaoAASiTefInterativo(int Funcao, char* Valor, char* CupomFiscal, char* DataFiscal,
    char* HoraFiscal, char* Operador, char* ParamAdic, char* Produtos);

int ContinuaFuncaoSiTefInterativo(int* Comando, long* TipoCampo, short* TamMinimo, short* TamMaximo,
    char* Buffer, int TamBuffer, int Continua);

void FinalizaFuncaoSiTefInterativo(short Confirma, char* CupomFiscal, char* DataFiscal,
    char* HoraFiscal, char* ParamAdic);
