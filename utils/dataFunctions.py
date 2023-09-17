from random import randint, uniform;
from calendar import isleap

def geradorCpf(type = "str"):
    while True:
        cpf = [randint(0, 9) for i in range(9)]
        if cpf != cpf[::-1]:
            break

    #  Gera os dois dígitos verificadores
    for i in range(9, 11):
        value = sum((cpf[num] * ((i + 1) - num) for num in range(0, i)))
        digit = ((value * 10) % 11) % 10
        cpf.append(digit)

    #  Pega cada dado da lista e joga numa string
    result = ''.join(map(str, cpf))
    if(type == "str"):
        return result;
    elif(type == "int"):
        return int(result);
    else:
        raise TypeError("Tipos aceitos no parâmetro type -> str e int");


def gerarNomes():    
    NOMES = ['Miguel', 'Arthur', 'Gael', 'Théo', 'Heitor', 'Ravi', 'Davi', 'Bernardo', 'Noah', 'Gabriel', 'Samuel', 'Pedro', 'Anthony', 'Isaac', 'Benício', 'Benjamin', 'Matheus', 'Lucas', 'Joaquim', 'Nicolas', 'Lucca', 'Lorenzo', 'Henrique', 'João Miguel', 'Rafael', 
            'Henry', 'Murilo', 'Levi', 'Guilherme', 'Vicente', 'Felipe', 'Bryan', 'Matteo', 'Bento', 'João Pedro', 'Pietro', 'Leonardo', 'Daniel', 'Gustavo', 'Pedro Henrique', 'João Lucas', 'Emanuel', 'João', 'Caleb', 'Davi Lucca', 'Antônio', 'Eduardo', 'Enrico', 'Caio', 
            'José', 'Enzo Gabriel', 'Augusto', 'Mathias', 'Vitor', 'Enzo', 'Cauã', 'Francisco', 'Rael', 'João Guilherme', 'Thomas', 'Yuri', 'Yan', 'Anthony Gabriel', 'Oliver', 'Otávio', 'João Gabriel', 'Nathan', 'Davi Lucas', 'Vinícius', 'Theodoro', 'Valentim', 'Ryan', 
            'Luiz Miguel', 'Arthur Miguel', 'João Vitor', 'Léonovo', 'Ravi Lucca', 'Apollo', 'Thiago', 'Tomás', 'Martin', 'José Miguel', 'Erick', 'Liam', 'Josué', 'Luan', 'Asafe', 'Raul', 'José Pedro', 'Dominic', 'Kauê', 'Kalel', 'Luiz Henrique', 'Dom', 'Davi Miguel', 
            'Estevão', 'Breno', 'Davi Luiz', 'Thales', 'Israel', 'Helena', 'Alice', 'Laura', 'Maria Alice', 'Sophia', 'Manuela', 'Maitê', 'Liz', 'Cecília', 'Isabella', 'Luísa', 'Eloá', 'Heloísa', 'Júlia', 'Ayla', 'Maria Luísa', 'Isis', 'Elisa', 'Antonella', 'Valentina', 
            'Maya', 'Maria Júlia', 'Aurora', 'Lara', 'Maria Clara', 'Lívia', 'Esther', 'Giovanna', 'Sarah', 'Maria Cecília', 'Lorena', 'Beatriz', 'Rebeca', 'Luna', 'Olívia', 'Maria Helena', 'Mariana', 'Isadora', 'Melissa', 'Maria', 'Catarina', 'Lavínia', 'Alícia', 
            'Maria Eduarda', 'Agatha', 'Ana Liz', 'Yasmin', 'Emanuelly', 'Ana Clara', 'Clara', 'Ana Júlia', 'Marina', 'Stella', 'Jade', 'Maria Liz', 'Ana Laura', 'Maria Isis', 'Ana Luísa', 'Gabriela', 'Alana', 'Rafaela', 'Vitória', 'Isabelly', 'Bella', 'Milena', 'Clarice',
            'Mirella', 'Ana', 'Emilly', 'Betina', 'Mariah', 'Zoe', 'Maria Vitória', 'Nicole', 'Laís', 'Melina', 'Bianca', 'Louise', 'Ana Beatriz', 'Heloíse', 'Malu', 'Melinda', 'Letícia', 'Maria Valentina', 'Chloe', 'Maria Elisa', 'Maria Heloísa', 'Maria Laura', 
            'Maria Fernanda', 'Ana Cecília', 'Hadassa', 'Ana Vitória', 'Diana', 'Ayla Sophia', 'Eduarda', 'Ana Lívia', 'Isabel', 'Elis', 'Pérola', 'Joana'];

    SOBRENOMES = ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin', 'Thompson', 'Garcia', 'Martinez', 'Robinson', 'Clark', 'Rodriguez', 'Lewis', 'Lee', 
                'Walker', 'Hall', 'Allen', 'Young', 'Hernandez', 'King', 'Wright', 'Lopez', 'Hill', 'Scott', 'Green', 'Adams', 'Baker', 'Gonzalez', 'Nelson', 'Carter', 'Mitchell', 'Perez', 'Roberts', 'Turner', 'Phillips', 'Campbell', 'Parker', 'Evans', 'Edwards', 
                'Collins', 'Stewart', 'Sanchez', 'Morris', 'Rogers', 'Reed', 'Cook', 'Morgan', 'Bell', 'Murphy', 'Bailey', 'Rivera', 'Cooper', 'Richardson', 'Cox', 'Howard', 'Ward', 'Torres', 'Peterson', 'Gray', 'Ramirez', 'James', 'Watson', 'Brooks', 'Kelly', 'Sanders', 
                'Price', 'Bennett', 'Wood', 'Barnes', 'Ross', 'Henderson', 'Coleman', 'Jenkins', 'Perry', 'Powell', 'Long', 'Patterson', 'Hughes', 'Flores', 'Washington', 'Butler', 'Simmons', 'Foster', 'Gonzales', 'Bryant', 'Alexander', 'Russell', 'Griffin', 'Diaz', 'Hayes English'];

    return f'{NOMES[randint(0, NOMES.__len__()-1)]} {SOBRENOMES[randint(0, SOBRENOMES.__len__()-1)]}'


def gerarData(min_year, max_year):
    ano = randint(min_year, max_year);
    mes = randint(1, 12);

    if (mes == 2):
        # Checando se é um ano bissexto
        if(isleap(ano)):
            dia = randint(1, 29);
        else:
            dia = randint(1,28);
    elif(mes in [4, 6, 11, 9]):
            dia = randint(1, 30);
    else:
        dia = randint(1, 31);
    
    return f'{ano}-{mes:02}-{dia:02}';

def gerarInteiros(min, max):
    return randint(min, max);

def gerarFloats(min, max):
    return round(uniform(min, max), 2)

def pegarDadoAletorioLista(list):
    return list[randint(0, list.__len__()-1)]