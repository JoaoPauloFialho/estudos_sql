CREATE TABLE IF NOT EXISTS tbnotas_fiscais(
NUMERO INT AUTO_INCREMENT PRIMARY KEY,
CPF VARCHAR(11),
MATRICULA INT(6) ZEROFILL,
DATA_VENDA DATE,
IMPOSTO INT(99),
VALOR_COMPRA FLOAT
);
