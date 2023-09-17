from geradorScript import gerarInsert
from dataFunctions import *

if(__name__ == "__main__"):

    QUANTIDADE_INSERTS = 1000

    for i in range(QUANTIDADE_INSERTS):
        MATRICULA = [233, 234, 235, 236, 237];
        NOME_TABELA = "tbnotas_fiscais";
        COLUNAS = ["CPF", "MATRICULA", "DATA_VENDA", "IMPOSTO", "VALOR_COMPRA"];
        VALUES = [geradorCpf("str"), pegarDadoAletorioLista(MATRICULA), gerarData(2020, 2023), gerarInteiros(1, 20), gerarFloats(10.00, 10000.00)];
        print(gerarInsert(NOME_TABELA, COLUNAS, VALUES));    
