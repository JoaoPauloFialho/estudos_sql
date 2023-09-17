def gerarInsert(nomeTabela, listaColunas, listaValores):
    insert = f'INSERT INTO {nomeTabela}';
    for i in range(len(listaColunas)):
        if(i):
            insert += " , " + listaColunas[i];
            if(i == len(listaColunas)-1):
                insert += " ) "
        else:
            insert += " ( " + listaColunas[i];
    insert += "VALUES";
    for i in range(len(listaValores)):
        valor = f'"{listaValores[i]}"' if (type(listaValores[i]) == str) else f'{listaValores[i]}';
        if(i):
            insert += " , " + valor;
            if(i == len(listaValores)-1):
                insert += " )"
        else:
            insert += " ( " + valor;
    
    return insert+";"