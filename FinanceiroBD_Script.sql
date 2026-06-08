-- ========================
-- CRIAÇÃO DO BANCO
-- ========================
CREATE DATABASE FinanceiroBD;
USE FinanceiroBD;

-- ========================
-- CRIAÇÃO DAS TABELAS
-- ========================

CREATE TABLE Contas (
    id_conta INT PRIMARY KEY IDENTITY,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(30),
    saldo_inicial DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY IDENTITY,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(10) NOT NULL
);

CREATE TABLE Transacoes (
    id_transacao INT PRIMARY KEY IDENTITY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    data_transacao DATE NOT NULL,
    id_conta INT FOREIGN KEY REFERENCES Contas(id_conta),
    id_categoria INT FOREIGN KEY REFERENCES Categorias(id_categoria)
);

CREATE TABLE Metas (
    id_meta INT PRIMARY KEY IDENTITY,
    id_categoria INT FOREIGN KEY REFERENCES Categorias(id_categoria),
    mes INT NOT NULL,
    ano INT NOT NULL,
    valor_planejado DECIMAL(10,2) NOT NULL
);

CREATE TABLE Calendario (
    data DATE PRIMARY KEY,
    ano INT,
    mes INT,
    nome_mes VARCHAR(20),
    trimestre INT,
    dia_semana VARCHAR(20)
);

-- ========================
-- INSERÇÃO DE DADOS
-- ========================

INSERT INTO Contas (nome, tipo, saldo_inicial) VALUES
('Conta Corrente', 'Banco', 5000.00),
('Cartão de Crédito', 'Crédito', 0.00),
('Dinheiro', 'Espécie', 500.00),
('Poupança', 'Banco', 10000.00);

INSERT INTO Categorias (nome, tipo) VALUES
('Salário', 'Receita'),
('Freelance', 'Receita'),
('Investimentos', 'Receita'),
('Alimentação', 'Despesa'),
('Transporte', 'Despesa'),
('Moradia', 'Despesa'),
('Saúde', 'Despesa'),
('Lazer', 'Despesa'),
('Educação', 'Despesa'),
('Vestuário', 'Despesa');

INSERT INTO Transacoes (descricao, valor, tipo, data_transacao, id_conta, id_categoria) VALUES
-- Janeiro
('Salário Janeiro', 5500.00, 'Receita', '2026-01-05', 1, 1),
('Freelance Site', 1200.00, 'Receita', '2026-01-10', 1, 2),
('Aluguel', 1500.00, 'Despesa', '2026-01-10', 1, 6),
('Supermercado', 650.00, 'Despesa', '2026-01-15', 2, 4),
('Uber/Gasolina', 280.00, 'Despesa', '2026-01-18', 3, 5),
('Academia', 120.00, 'Despesa', '2026-01-20', 2, 7),
('Netflix/Spotify', 85.00, 'Despesa', '2026-01-22', 2, 8),
('Curso Online', 197.00, 'Despesa', '2026-01-25', 2, 9),
-- Fevereiro
('Salário Fevereiro', 5500.00, 'Receita', '2026-02-05', 1, 1),
('Dividendos', 320.00, 'Receita', '2026-02-08', 4, 3),
('Aluguel', 1500.00, 'Despesa', '2026-02-10', 1, 6),
('Supermercado', 710.00, 'Despesa', '2026-02-14', 2, 4),
('Uber/Gasolina', 310.00, 'Despesa', '2026-02-18', 3, 5),
('Farmácia', 95.00, 'Despesa', '2026-02-20', 3, 7),
('Restaurante', 180.00, 'Despesa', '2026-02-24', 2, 8),
('Roupa', 350.00, 'Despesa', '2026-02-26', 2, 10),
-- Março
('Salário Março', 5500.00, 'Receita', '2026-03-05', 1, 1),
('Freelance App', 2000.00, 'Receita', '2026-03-12', 1, 2),
('Aluguel', 1500.00, 'Despesa', '2026-03-10', 1, 6),
('Supermercado', 590.00, 'Despesa', '2026-03-15', 2, 4),
('Uber/Gasolina', 260.00, 'Despesa', '2026-03-18', 3, 5),
('Consulta Médica', 250.00, 'Despesa', '2026-03-20', 3, 7),
('Cinema/Lazer', 150.00, 'Despesa', '2026-03-23', 2, 8),
('Livros', 120.00, 'Despesa', '2026-03-28', 2, 9),
-- Abril
('Salário Abril', 5500.00, 'Receita', '2026-04-05', 1, 1),
('Dividendos', 380.00, 'Receita', '2026-04-08', 4, 3),
('Aluguel', 1500.00, 'Despesa', '2026-04-10', 1, 6),
('Supermercado', 680.00, 'Despesa', '2026-04-14', 2, 4),
('Uber/Gasolina', 290.00, 'Despesa', '2026-04-17', 3, 5),
('Academia', 120.00, 'Despesa', '2026-04-20', 2, 7),
('Viagem', 800.00, 'Despesa', '2026-04-22', 2, 8),
('Curso Online', 297.00, 'Despesa', '2026-04-25', 2, 9),
-- Maio
('Salário Maio', 5500.00, 'Receita', '2026-05-05', 1, 1),
('Freelance Logo', 800.00, 'Receita', '2026-05-14', 1, 2),
('Aluguel', 1500.00, 'Despesa', '2026-05-10', 1, 6),
('Supermercado', 620.00, 'Despesa', '2026-05-15', 2, 4),
('Uber/Gasolina', 270.00, 'Despesa', '2026-05-18', 3, 5),
('Farmácia', 75.00, 'Despesa', '2026-05-20', 3, 7),
('Netflix/Spotify', 85.00, 'Despesa', '2026-05-22', 2, 8),
('Tênis', 399.00, 'Despesa', '2026-05-27', 2, 10),
-- Junho
('Salário Junho', 5500.00, 'Receita', '2026-06-05', 1, 1),
('Dividendos', 410.00, 'Receita', '2026-06-08', 4, 3),
('Aluguel', 1500.00, 'Despesa', '2026-06-10', 1, 6),
('Supermercado', 700.00, 'Despesa', '2026-06-14', 2, 4),
('Uber/Gasolina', 300.00, 'Despesa', '2026-06-17', 3, 5),
('Academia', 120.00, 'Despesa', '2026-06-20', 2, 7),
('Show/Evento', 220.00, 'Despesa', '2026-06-22', 2, 8),
('Livros', 89.00, 'Despesa', '2026-06-28', 2, 9);

INSERT INTO Metas (id_categoria, mes, ano, valor_planejado) VALUES
-- Alimentação
(4, 1, 2026, 600.00), (4, 2, 2026, 600.00), (4, 3, 2026, 600.00),
(4, 4, 2026, 600.00), (4, 5, 2026, 600.00), (4, 6, 2026, 600.00),
-- Transporte
(5, 1, 2026, 250.00), (5, 2, 2026, 250.00), (5, 3, 2026, 250.00),
(5, 4, 2026, 250.00), (5, 5, 2026, 250.00), (5, 6, 2026, 250.00),
-- Lazer
(8, 1, 2026, 200.00), (8, 2, 2026, 200.00), (8, 3, 2026, 200.00),
(8, 4, 2026, 200.00), (8, 5, 2026, 200.00), (8, 6, 2026, 200.00),
-- Educação
(9, 1, 2026, 150.00), (9, 2, 2026, 150.00), (9, 3, 2026, 150.00),
(9, 4, 2026, 150.00), (9, 5, 2026, 150.00), (9, 6, 2026, 150.00),
-- Moradia
(6, 1, 2026, 1500.00), (6, 2, 2026, 1500.00), (6, 3, 2026, 1500.00),
(6, 4, 2026, 1500.00), (6, 5, 2026, 1500.00), (6, 6, 2026, 1500.00),
-- Saúde
(7, 1, 2026, 200.00), (7, 2, 2026, 200.00), (7, 3, 2026, 200.00),
(7, 4, 2026, 200.00), (7, 5, 2026, 200.00), (7, 6, 2026, 200.00),
-- Vestuário
(10, 1, 2026, 200.00), (10, 2, 2026, 200.00), (10, 3, 2026, 200.00),
(10, 4, 2026, 200.00), (10, 5, 2026, 200.00), (10, 6, 2026, 200.00);

-- ========================
-- TABELA CALENDÁRIO
-- ========================
INSERT INTO Calendario (data, ano, mes, nome_mes, trimestre, dia_semana)
SELECT
    CAST(DATEADD(DAY, number, '2026-01-01') AS DATE),
    YEAR(DATEADD(DAY, number, '2026-01-01')),
    MONTH(DATEADD(DAY, number, '2026-01-01')),
    DATENAME(MONTH, DATEADD(DAY, number, '2026-01-01')),
    DATEPART(QUARTER, DATEADD(DAY, number, '2026-01-01')),
    DATENAME(WEEKDAY, DATEADD(DAY, number, '2026-01-01'))
FROM master..spt_values
WHERE type = 'P' AND number BETWEEN 0 AND 364;
