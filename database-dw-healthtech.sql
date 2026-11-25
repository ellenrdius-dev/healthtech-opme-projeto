-- ============================================================================
-- PROJETO HEALTHTECH - DATA WAREHOUSE (ESQUEMA ESTRELA - TABELAS DIMENSÃO)
-- Banco de Dados: healthTech_banco_de_dados (MySQL / phpMyAdmin)
-- ============================================================================

CREATE DATABASE IF NOT EXISTS `healthTech_banco_de_dados`;
USE `healthTech_banco_de_dados`;

-- ----------------------------------------------------------------------------
-- 1. Criação das Tabelas Dimensão
-- ----------------------------------------------------------------------------

CREATE TABLE dim_cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE dim_fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(20) NOT NULL UNIQUE,
    contato VARCHAR(100)
);

CREATE TABLE dim_local (
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    almoxarifado VARCHAR(100) NOT NULL,
    setor VARCHAR(100) NOT NULL
);

CREATE TABLE dim_produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    tecnologia VARCHAR(100) NOT NULL,
    preco_base DECIMAL(10,2) NOT NULL,
    prazo_validade DATE NOT NULL
);

CREATE TABLE dim_tempo (
    id_tempo INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL UNIQUE,
    Ano INT NOT NULL,
    Mes_Num INT NOT NULL,
    Mes VARCHAR(10) NOT NULL,
    Mes_Ano VARCHAR(20) NOT NULL,
    Dia INT NOT NULL
);

-- ----------------------------------------------------------------------------
-- 2. Carga Inicial de Dados (DML)
-- ----------------------------------------------------------------------------

INSERT INTO dim_cliente (id_cliente, nome, tipo) VALUES
(1, 'Hospital Santa Cruz', 'Hospital Privado'),
(2, 'Hospital Albert Einstein', 'Hospital Privado'),
(3, 'Hospital das Clínicas', 'Hospital Público'),
(4, 'Hospital Sírio-Libanês', 'Hospital Privado'),
(5, 'Hospital São Luiz', 'Hospital Privado'),
(6, 'Instituto do Coração (InCor)', 'Hospital Público'),
(7, 'Hospital Beneficência Portuguesa', 'Hospital Privado'),
(8, 'Clínica Ortopédica Especializada', 'Clínica'),
(9, 'Hospital Samaritano', 'Hospital Privado'),
(10, 'Hospital Nove de Julho', 'Hospital Privado'),
(11, 'Centro Cirúrgico Avançado', 'Clínica');

INSERT INTO dim_fornecedor (id_fornecedor, nome, CNPJ, contato) VALUES
(1, 'Medtronic Brasil', '60.870.804/0001-00', 'atendimento.brasil@medtronic.com'),
(2, 'DePuy Synthes', '52.224.288/0001-10', 'atendimento@its.jnj.com'),
(3, 'Arthrex', '02.966.202/0001-30', 'vendas@arthrex.com.br'),
(4, 'MasterMedbr', '01.513.946/0001-80', 'vendas@mastermedbr.com.br'),
(6, 'Nexomed', '17.085.673/0001-94', 'vendas@nexomed.com.br'),
(7, 'Simplex', '02.966.317/0001-02', 'faleconosco.brasil@stryker.com');

INSERT INTO dim_local (id_local, almoxarifado, setor) VALUES
(1, 'CD Principal - São Paulo', 'Logística Central'),
(2, 'Estoque Avançado - Zona Sul', 'Consignados Hospitalares'),
(3, 'Almoxarifado Central - Campinas', 'Distribuição Regional');

INSERT INTO dim_produto (id_produto, nome, tecnologia, preco_base, prazo_validade) VALUES
(101, 'Placas para membros Superiores (Rádio, Ulna, Clavícula, Úmero)', 'Convencional / (Aço Cirúrgico)', 250.00, '2027-03-16'),
(102, 'Placas para membros Superiores (Rádio, Ulna, Clavícula, Úmero)', 'Bloqueada / LCP (Titânio)', 800.00, '2027-09-12'),
(103, 'Placas para membros Inferiores (Tíbia, Fíbula, Fêmur)', 'Convencional / (Aço Cirúrgico)', 375.00, '2026-12-06'),
(104, 'Placas para membros Inferiores (Tíbia, Fíbula, Fêmur)', 'Bloqueada / LCP (Titânio)', 1650.00, '2027-09-12'),
(105, 'Parafusos Canulados', 'Aço inoxidável / Liga de titânio', 37.50, '2027-09-12'),
(106, 'Haste Intramedular de Tíbia', 'Convencional / (Aço Cirúrgico)', 1096.39, '2026-11-01'),
(107, 'Haste Intramedular Bloqueada de Fêmur', 'Convencional / (Aço Cirúrgico)', 1120.00, '2026-12-06'),
(108, 'Haste de Tíbia/Fêmur em Titânio', 'Liga de Titânio', 2200.00, '2026-12-06'),
(109, 'Cimento Ortopédico', 'Padrão Sem Antibiótico', 115.00, '2027-04-08'),
(110, 'Cimento Ortopédico', 'Com Antibiótico (Gentamicina)', 210.00, '2027-05-11');

INSERT INTO dim_tempo (Date, Ano, Mes_Num, Mes, Mes_Ano, Dia) VALUES
('2024-01-01', 2024, 1, 'jan', 'jan/2024', 1),
('2024-01-02', 2024, 1, 'jan', 'jan/2024', 2),
('2024-01-03', 2024, 1, 'jan', 'jan/2024', 3),
('2024-01-04', 2024, 1, 'jan', 'jan/2024', 4),
('2024-01-05', 2024, 1, 'jan', 'jan/2024', 5);

-- ----------------------------------------------------------------------------
-- 3. Consultas de Validação
-- ----------------------------------------------------------------------------

SHOW TABLES;
SELECT * FROM dim_cliente;
SELECT * FROM dim_produto;
