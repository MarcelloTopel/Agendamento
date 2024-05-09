-- Tabela para os clientes/tutores
CREATE TABLE clientes (
    cpf VARCHAR(14) PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    telefone_cliente VARCHAR(20) NOT NULL
);

-- Tabela para os animais
CREATE TABLE animais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_animal VARCHAR(100) NOT NULL,
    idade_animal INT,
    peso_animal DECIMAL(5,2),
    tipo_animal ENUM('Cão', 'Gato') NOT NULL,
    cpf_cliente VARCHAR(14) NOT NULL,
    FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf)
);

-- Tabela para os agendamentos
CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cliente VARCHAR(14) NOT NULL,
    id_animal INT NOT NULL,
    id_servico INT NOT NULL,
    id_horario INT NOT NULL,
    data_agendamento DATE NOT NULL,
    confirmacao_cirurgia BOOLEAN DEFAULT 0,
    FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf),
    FOREIGN KEY (id_animal) REFERENCES animais(id),
    FOREIGN KEY (id_servico) REFERENCES servicos(id),
    FOREIGN KEY (id_horario) REFERENCES horarios_disponiveis(id)
);