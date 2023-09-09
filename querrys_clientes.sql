SELECT * FROM tbcliente;

SELECT CPF, NOME, PRIMEIRA_COMPRA FROM tbcliente;

SELECT CPF, NOME, PRIMEIRA_COMPRA FROM tbcliente LIMIT 5;

SELECT NOME AS NOME_CLIENTE, CPF AS CPF_CLIENTE FROM tbcliente LIMIT 5;

SELECT CPF, NOME, SEXO FROM tbcliente;SELECT * FROM tbcliente;

SELECT CPF, NOME, PRIMEIRA_COMPRA FROM tbcliente;

SELECT CPF, NOME, PRIMEIRA_COMPRA FROM tbcliente LIMIT 5;

SELECT NOME AS NOME_CLIENTE, CPF AS CPF_CLIENTE FROM tbcliente LIMIT 5;

SELECT CPF, NOME, SEXO FROM tbcliente;

SELECT * FROM tbcliente;

SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro';

SELECT * FROM tbcliente WHERE IDADE > 22;

SELECT * FROM tbcliente WHERE IDADE < 22;

SELECT * FROM tbcliente WHERE IDADE <= 22;

/*SIMBOLO DE DIFERENTE NO SQL É <> */
SELECT * FROM tbcliente WHERE IDADE <> 22;

/*QUANDO SE APLICA > < <= >= A STRINGS, O SQL LEVA EM CONTA A ORDEM ALFABÉTICA*/
SELECT * FROM tbcliente WHERE NOME > "Fernando Cavalcante";

/*NO SQL NÃO É POSSÍVEL FAZER CERTAS OPERAÇÕES COM PONTO FLUTUANTE MUITO PRECISAMENTE, POR EXEMPLO NO COMANDO ABAIXO SERÁ SELECIONADO REGISTRO QUE POSSUA 16.008 MSM QUE NÃO SEJA O COMPORTAMENTE CORRETO DA QUERRY*/
SELECT * FROM tbproduto WHERE PRECO_LISTA <> 16.008;

SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO < '2000-02-12';

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO > '2000-02-12';

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO = '2000-02-12';

/*Esse year faz parte de um conjunto de funções para formatar data em inteiro, basicamente year como o nome fala retorna o numero equivalente ao ano da data, tambem existe o DAY e MONTH*/
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) BETWEEN 1990 AND 1999;

SELECT * FROM tbproduto WHERE PRECO_LISTA >= 16.007 AND PRECO_LISTA <= 16.009;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 20 AND SEXO = 'M';

SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins';

/*No sql também é possível utilizar parenteses igual em linguagem de programação normal*/
SELECT * FROM tbcliente WHERE (IDADE >= 18 AND IDADE <= 20 AND SEXO = 'M') OR (CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins');

/*Campo de somente 1 bit pode ser usado como booleano, então por exemplo para saber os que já fizeram a primeira_compra não é preciso igualar ele com 1, já que o campo em si já vale true (1) ou false (0)*/
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) < 2000 AND PRIMEIRA_COMPRA;
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) < 2000 AND NOT PRIMEIRA_COMPRA;

/*No sql é possível utilizar as mesmas clausulas do if de uma linguagem de programação normal basicamente*/
SELECT * FROM tbproduto WHERE SABOR IN ('Manga', 'Laranja') AND (PRECO_LISTA > 10);
SELECT * FROM tbproduto WHERE SABOR IN ('Manga', 'Laranja') AND NOT (PRECO_LISTA > 10);
SELECT * FROM tbcliente WHERE CIDADE IN ('São Paulo', 'Rio de Janeiro') AND (IDADE > 18 AND IDADE < 25);
SELECT * FROM tbcliente WHERE CIDADE IN ('São Paulo', 'Rio de Janeiro') AND (IDADE BETWEEN 18 AND 22); /*Between não coloca seus valores de comparação entre parênteses BETWEEN(18 AND 22)*/

/*No sql também existe o operador LIKE que aceita um input de texto com a possibilidade do uso de coringas, um dos coringas é o % que significa "tudo" basicamente*/
SELECT * FROM tbproduto WHERE SABOR LIKE "%Maça%" AND PRECO_LISTA > 10; /*Esse like vai retornar true para todos os elementos que possuem Maça localizado em qualque lugar na string do sabor*/
SELECT * FROM tbproduto WHERE SABOR LIKE "%Maça%" AND EMABALAGEM = "PET";
SELECT * FROM tbproduto WHERE SABOR LIKE "%Maça" AND PRECO_LISTA > 10; /*Esse like vai retornar true para todos os elementos que possuem Maça localizado no final da string do sabor*/
SELECT * FROM tbproduto WHERE SABOR LIKE "Maça" AND PRECO_LISTA > 10; /*Esse like vai retornar true para todos os elementos que tenham o sabor igual a string Maça*/
SELECT * FROM tbcliente WHERE NOME LIKE "P%" AND IDADE >= 18; /*Seleciona todos os clientes que o nome comece com P e que seja maior que idade*/

/*No sql existe um operador chamado distinct, ele serve para que na consulta não apareça linhas repetidas, não vou me aproximar muito pois os operadores e clausulas do SELECT continuam as mesmas*/
SELECT DISTINCT SABOR, EMBALAGEM FROM tbproduto; /*Nesse caso aqui ele vai fazer uma querry com as colunas SABOR e EMBALAGEM, caso exista combinações repetidas, 
                                                por exemplo, 'UVA' - 'PET' e 'UVA' - 'PET', só vai aparecer 1 única vez na querry em vez de 2 */
SELECT DISTINCT BAIRRO FROM tbcliente WHERE CIDADE = 'Rio de Janeiro';/*Querry para saber os bairros da cidade Rio de Janeiro que possuem clientes*/

/*No sql existe um operador chamado LIMIT utilizado para limitar a quantidade de Rows retornadas na querry basicamente*/
SELECT * FROM tbcliente LIMIT 4; /*Vai mostrar somente 4 linhas da querry total*/
SELECT * FROM tbcliente LIMIT 2,4; /*Vai mostrar da linha 2 da querry as 4 linhas seguintes a ela*/


/*No sql é possível ordenar as saídas da consulta utilizando o ORDER BY, ASC "Crescente" DESC "Decrescente"*/
SELECT * FROM tbproduto ORDER BY EMBALAGEM, PRECO_LISTA ASC; /*Quando o ORDER BY possui 2 campos ele ordena o campo 1 e depois o campo 2*/
/*
 Campo 1      Campo 2
    A           1
    A           6    output seria tipo esse aqui
    A           9
    B           2
    B           4
    C           6
    D           1
*/
/*Também é possível fazer ordenações opostas em 2 campos ao mesmo tempo*/
SELECT * FROM tbproduto ORDER BY EMBALAGEM ASC, PRECO_LISTA DESC;
/*
 Campo 1      Campo 2
    A           9
    A           6    output seria tipo esse aqui
    A           1
    B           6
    B           4
    C           2
    D           1
*/

/*
GROUP BY agrupa valores númericos por uma chave de critério que pode ser
SUM -> soma
MAX -> máximo
MIN -> mínimo
AVG -> média
COUNT -> contagem de ocorrências

A  1     GROUP BY SUM     GROUP BY MIN     GROUP BY COUNT      
A  2         A 5              A 1              A 3
A  2         B 7              B 3              B 2
B  4         C 1              C 1              C 1
B  3
C  1

*Se omitirmos o campo de agregação será agregado toda a tabela 
SELECT SUM(X) FROM tabela;
*/
    /*Quando usamos uma expressão como SUM(CAMPO) é recomendado usar o ALIAS pra formatar a saída*/
SELECT ESTADO, SUM(LIMITE_CREDITO) AS CREDITO_TOTAL FROM tbcliente GROUP BY ESTADO;/*Vai pegar a soma de limite de crédito de cada estado*/

SELECT EMBALAGEM, MAX(PRECO_LISTA) AS PRECO_MAXIMO FROM tbproduto GROUP BY EMBALAGEM;/*Valor mais caro de toda embalagem*/

/*É possível agrupar por mais de um campo e ainda adicionar filtragens na querry*/
SELECT CIDADE, BAIRRO, MAX(IDADE) AS MAIOR_IDADE FROM tbcliente WHERE (ESTADO = 'RJ' AND SEXO = 'M') GROUP BY CIDADE, BAIRRO;
/*
A  X  1
A  X  1
A  Z  2
B  Y  3
B  Y  4 
B  U  5
SELECT CAMPO1, CAMPO2, SUM(CAMPO3) FROM tabela GROUP BY CAMPO1, CAMPO2;
A X 2
A Z 2
B Y 7
B U 5
*/

/*É possível ainda utilizar o ORDER BY e fazer consultas mais complexas*/
SELECT CIDADE, BAIRRO, MAX(IDADE) AS MAIOR_IDADE 
FROM tbcliente WHERE (ESTADO = 'RJ' AND SEXO = 'M') 
GROUP BY CIDADE, BAIRRO ORDER BY MAIOR_IDADE;


/*No sql existe uma cláusula chamada HAVING que serve para impor condições nas agregações*/
/*Nesse exemplo aqui, ele só vai colocar no agrupamento as cidades e bairros que possuirem o limite de crédito total maior que 100000*/
SELECT CIDADE, BAIRRO, MAX(LIMITE_CREDITO) AS LIMITE_CREDITO FROM tbcliente 
WHERE (ESTADO = 'RJ' AND SEXO = 'M') 
GROUP BY CIDADE, BAIRRO HAVING SUM(LIMITE_CREDITO) > 100000;

/*É possível utilizar expressões lógicas dentro da cláusula having*/
SELECT EMBALAGEM, MAX(PRECO_LISTA) AS MAIOR_PRECO, MIN(PRECO_LISTA) AS MENOR_PRECO FROM tbproduto GROUP BY EMBALAGEM HAVING MENOR_PRECO > 2 AND MAIOR_PRECO < 5; 

/*A clausula CASE serve para classificar a saída de resultados, você basicamente pega um campo e faz operações lógicas nele, se ele corresponder a essa operação na saída ele recebe na visualização o valor daquela operação*/
SELECT NOME, 
CASE
	WHEN YEAR(DATA_NASCIMENTO) < 1990 THEN "VELHO"
    WHEN YEAR(DATA_NASCIMENTO) BETWEEN 1990 AND 1995 THEN "JOVEM"
    ELSE "CRIANÇA"
END , DATA_NASCIMENTO FROM tbcliente;

/*É possível utilizar filtros e GROUP BY, o case é como se fosse uma coluna extra, então todas as outras clausulas ainda funcionam*/
SELECT EMBALAGEM,
CASE 
	WHEN PRECO_LISTA >= 12 THEN 'Produto caro'
	WHEN PRECO_LISTA BETWEEN 8 AND 12 THEN 'Produto mediano'
	ELSE 'Produto barato' 
END AS STATUS_PRECO, AVG(PRECO_LISTA) AS PRECO_MEDIO FROM tbproduto /*É importante utilizar AS pois se não colocar o nome do campo será todo o código de case*/
WHERE SABOR = 'Manga'
GROUP BY EMBALAGEM,
CASE 
	WHEN PRECO_LISTA >= 12 THEN 'Produto caro'
	WHEN PRECO_LISTA BETWEEN 8 AND 12 THEN 'Produto mediano' /*Você pode agrupar por CASE também, eu escrevi isso aqui desse jeito mas eu poderia só colocar o ALIAS do case*/
	ELSE 'Produto barato' 
END;

/*Pra melhorar a visualização você pode usar o AS do case dentro do GROUP BY*/
SELECT EMBALAGEM,
CASE 
	WHEN PRECO_LISTA >= 12 THEN 'Produto caro'
	WHEN PRECO_LISTA BETWEEN 8 AND 12 THEN 'Produto mediano'
	ELSE 'Produto barato' 
END AS STATUS_PRECO, AVG(PRECO_LISTA) AS PRECO_MEDIO FROM tbproduto
    */
WHERE SABOR = 'Manga'
GROUP BY EMBALAGEM, STATUS_PRECO;