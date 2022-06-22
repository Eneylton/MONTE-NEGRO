-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Jun-2022 às 00:59
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_definitivo5`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nivel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nivel`) VALUES
(1, 'admin'),
(2, 'Assitente'),
(3, 'Coordenador'),
(4, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `backlog`
--

CREATE TABLE `backlog` (
  `id` int(11) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `ocorrencias_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `producao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(1, 'Asssistente de Logística'),
(2, 'Coordenadora de Logística'),
(3, 'Asssistente de Logística'),
(4, 'Supervisor de Operações Logísticas Interior'),
(5, 'Encarregada de Expedição'),
(6, 'Assistente da qualidade'),
(7, 'Auxiliar de Logística'),
(8, 'Diretora'),
(9, 'Assistente Financeiro'),
(10, 'Coordenadora de RH');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `data`, `telefone`, `email`, `cnpj`, `foto`, `usuarios_id`, `setores_id`) VALUES
(7, 'HAPVIDA', '2021-07-03 00:04:14', NULL, NULL, NULL, NULL, 7, 3),
(8, 'GFL', '2021-07-05 19:01:25', NULL, NULL, NULL, NULL, 7, 1),
(9, 'DBA', '2021-07-05 19:25:30', NULL, NULL, NULL, NULL, 7, 1),
(10, 'NT LOG', '2021-07-05 19:35:18', NULL, NULL, NULL, NULL, 7, 1),
(14, 'FLASH', '2022-04-20 17:37:34', NULL, NULL, NULL, NULL, 4, 3),
(15, 'VITALMED', '2022-04-20 17:38:00', NULL, NULL, NULL, NULL, 4, 3),
(16, 'ACM', '2022-04-20 17:38:13', NULL, NULL, NULL, NULL, 4, 3),
(17, 'UNIMED', '2022-04-20 17:38:26', NULL, NULL, NULL, NULL, 4, 3),
(18, 'HUMANA', '2022-04-20 17:38:40', NULL, NULL, NULL, NULL, 4, 3),
(19, 'ODORATA', '2022-04-20 17:38:54', NULL, NULL, NULL, NULL, 4, 3),
(20, 'ACOMAC', '2022-04-20 17:39:09', NULL, NULL, NULL, NULL, 4, 3),
(21, 'SINTEMA', '2022-04-20 17:39:21', NULL, NULL, NULL, NULL, 4, 3),
(22, 'MARY KAY', '2022-04-20 17:39:40', NULL, NULL, NULL, NULL, 4, 3),
(23, 'UNIHOSP', '2022-05-04 14:51:29', NULL, NULL, NULL, NULL, 4, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucao`
--

CREATE TABLE `devolucao` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `producao_id` int(11) NOT NULL,
  `ocorrencias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `devolucao`
--

INSERT INTO `devolucao` (`id`, `data`, `qtd`, `entregadores_id`, `producao_id`, `ocorrencias_id`) VALUES
(216, '2022-06-19 20:10:04', 20, 176, 1161, 6),
(217, '2022-06-19 20:10:16', 10, 176, 1161, 2),
(218, '2022-06-19 20:10:42', 20, 176, 1161, 1),
(219, '2022-06-22 13:18:19', 5, 175, 1162, 6),
(220, '2022-06-22 13:25:06', 5, 176, 1163, 6),
(221, '2022-06-22 15:30:49', 10, 175, 1168, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `qtd` varchar(45) DEFAULT NULL,
  `producao_id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entrega`
--

INSERT INTO `entrega` (`id`, `data`, `qtd`, `producao_id`, `entregadores_id`) VALUES
(1091, '2022-06-17', '10', 1154, 176),
(1092, '2022-06-17', '20', 1155, 175),
(1093, '2022-06-17', '10', 1156, 175),
(1094, '2022-06-17', '10', 1157, 175),
(1095, '2022-06-19', '50', 1158, 176),
(1096, '2022-06-19', '12', 1159, 175),
(1097, '2022-06-19', '70', 1160, 176),
(1098, '2022-06-19', '50', 1161, 176),
(1099, '2022-06-22', '10', 1162, 175),
(1100, '2022-06-22', '5', 1162, 175),
(1101, '2022-06-22', '20', 1161, 176),
(1102, '2022-06-22', '10', 1161, 176),
(1103, '2022-06-22', '20', 1161, 176),
(1104, '2022-06-22', '10', 1163, 176),
(1105, '2022-06-22', '10', 1167, 176),
(1106, '2022-06-22', '10', 1166, 175),
(1107, '2022-06-22', '5', 1165, 175),
(1108, '2022-06-22', '10', 1164, 176),
(1109, '2022-06-22', '40', 1168, 175),
(1110, '2022-06-22', '50', 1169, 175),
(1111, '2022-06-30', '10', 1168, 175),
(1112, '2022-06-25', '5', 1163, 176);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregadores`
--

CREATE TABLE `entregadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `agencia` varchar(45) DEFAULT NULL,
  `conta` varchar(45) DEFAULT NULL,
  `pix` varchar(100) DEFAULT NULL,
  `cnh` varchar(45) DEFAULT NULL,
  `renavam` varchar(45) DEFAULT NULL,
  `apelido` varchar(100) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `admissao` timestamp NULL DEFAULT NULL,
  `recisao` timestamp NULL DEFAULT NULL,
  `valor_boleto` decimal(10,2) DEFAULT NULL,
  `valor_cartao` decimal(10,2) DEFAULT NULL,
  `valor_pequeno` decimal(10,2) DEFAULT NULL,
  `valor_grande` decimal(10,2) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `forma_pagamento_id` int(11) NOT NULL,
  `veiculos_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregadores`
--

INSERT INTO `entregadores` (`id`, `nome`, `telefone`, `cpf`, `email`, `banco`, `agencia`, `conta`, `pix`, `cnh`, `renavam`, `apelido`, `tipo`, `status`, `admissao`, `recisao`, `valor_boleto`, `valor_cartao`, `valor_pequeno`, `valor_grande`, `usuarios_id`, `forma_pagamento_id`, `veiculos_id`, `regioes_id`) VALUES
(175, 'MARIA DE JOÃO', '(98) 99158-1962', '652.111.224-44', 'cliente@hotmail.com', 'CAIXA ECÔNOMICA FEDERAL', '8484515648', '888888-96', '89988544222', '05621877892', '8955442222', 'MARIA', 'CLT', 1, '2022-06-14 00:56:55', '2022-06-14 00:56:55', '1.00', '2.50', '3.50', '5.00', 4, 4, 1, 74),
(176, 'JEREMIAS', '(98) 99158-1962', '887.223.368-53', 'cliente@hotmail.com', 'CAIXA ECÔNOMICA FEDERAL', '6578-1', '9898898-52', '89988544222', '5555555', '5655555545', 'JEREMIAS', 'CLT', 1, '2022-06-14 21:48:04', '2022-06-14 21:48:04', '2.00', '4.00', '5.00', '6.00', 4, 4, 1, 77);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador_rota`
--

CREATE TABLE `entregador_rota` (
  `id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `rotas_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregador_rota`
--

INSERT INTO `entregador_rota` (`id`, `entregadores_id`, `rotas_id`, `regioes_id`) VALUES
(19, 175, 13, 74),
(20, 175, 15, 74),
(23, 176, 32, 77),
(24, 176, 34, 77);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador_servicos`
--

CREATE TABLE `entregador_servicos` (
  `id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregador_servicos`
--

INSERT INTO `entregador_servicos` (`id`, `entregadores_id`, `servicos_id`) VALUES
(310, 175, 3),
(311, 175, 4),
(312, 175, 5),
(313, 175, 1),
(318, 176, 3),
(319, 176, 4),
(320, 176, 5),
(321, 176, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador_setores`
--

CREATE TABLE `entregador_setores` (
  `id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregador_setores`
--

INSERT INTO `entregador_setores` (`id`, `entregadores_id`, `setores_id`, `valor`) VALUES
(191, 175, 1, 1),
(192, 175, 3, 1),
(195, 176, 1, 1),
(196, 176, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id`, `nome`) VALUES
(4, 'Dinheiro'),
(5, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gaiolas`
--

CREATE TABLE `gaiolas` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `nome` varchar(45) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `gaiolas`
--

INSERT INTO `gaiolas` (`id`, `data`, `nome`, `qtd`) VALUES
(39, '2022-01-27 23:00:54', 'ROTA 01 - PAÇO ', 6),
(40, '2022-02-04 23:07:54', 'ROTA 02 - ELDORADO', -1),
(41, '2022-02-04 23:07:54', 'ROTA 03 - RECANTO', 0),
(42, '2022-02-04 23:07:54', 'ROTA 04 - VINHAIS ', 0),
(43, '2022-02-04 23:07:54', 'ROTA 05 - ANIL ', 0),
(44, '2022-02-04 23:07:54', 'ROTA 06 - VILA PALMEIRA', 0),
(45, '2022-02-04 23:07:54', 'ROTA 07 - COROADINHO', 0),
(46, '2022-02-04 23:07:54', 'ROTA 08 - SÃO FRANCISCO', 0),
(47, '2022-02-04 23:07:54', 'ROTA 09 - PONTA DO FAROL ', 0),
(48, '2022-02-04 23:07:54', 'ROTA 10 - CIDADE OPERÁRIA', 0),
(49, '2022-02-04 23:07:54', 'ROTA 100 - BACABAL', 0),
(50, '2022-02-04 23:07:54', 'ROTA 101 - LAGO DA PEDRA', 0),
(51, '2022-02-04 23:07:54', 'ROTA 102 - BARRA DO CORDA', 0),
(52, '2022-02-04 23:07:54', 'ROTA 103 - COROATÁ ', 0),
(53, '2022-02-04 23:07:54', 'ROTA 104 - COLINAS', 0),
(54, '2022-02-04 23:07:54', 'ROTA 105 - DOM PEDRO ', 0),
(55, '2022-02-04 23:07:54', 'ROTA 106 - PRES. DUTRA/TUNTUM', 0),
(56, '2022-02-04 23:07:54', 'ROTA 107 - PEDREIRAS/TRIZIDELA', 0),
(57, '2022-02-04 23:07:54', 'ROTA 108 - SÃO MATEUS ', 0),
(58, '2022-02-04 23:07:54', 'ROTA 109 - ROSÁRIO', 0),
(59, '2022-02-04 23:07:54', 'ROTA 11 - COHATRAC', 0),
(60, '2022-02-04 23:07:54', 'ROTA 110 - BARREIRINHAS', 0),
(61, '2022-02-04 23:07:54', 'ROTA 111 - ZÉ DOCA', 0),
(62, '2022-02-04 23:07:54', 'ROTA 112 - SANTA INÊ', 0),
(63, '2022-02-04 23:07:54', 'ROTA 113 - SANTA LUZIA', 0),
(64, '2022-02-04 23:07:54', 'ROTA 114 - VIANA/ARARI', 0),
(65, '2022-02-04 23:07:54', 'ROTA 115 - SÃO BENTO ', 0),
(66, '2022-02-04 23:07:54', 'ROTA 116 - PINHEIRO', 0),
(67, '2022-02-04 23:07:54', 'ROTA 117 - CURURUPU', 0),
(68, '2022-02-04 23:07:54', 'ROTA 12 - LIBERDADE/CENTRO ', 0),
(69, '2022-02-04 23:07:54', 'ROTA 121 - CAROLINA/ESTREITO/GRAJAÚ/J.LISBOA', 0),
(70, '2022-02-04 23:07:54', 'ROTA 122 - IMPERATRIZ', 0),
(71, '2022-02-04 23:07:54', 'ROTA 123 - BALSAS', 0),
(72, '2022-02-04 23:07:54', 'ROTA 124 - AÇAILÂNDIA', 0),
(73, '2022-02-04 23:07:54', 'ROTA 13 - COHAB', 0),
(74, '2022-02-04 23:07:54', 'ROTA 14 - ARAÇAGY', 0),
(75, '2022-02-04 23:07:54', 'ROTA 15 - BR', 0),
(76, '2022-02-04 23:07:54', 'ROTA 16 - SÃO CRISTÓVÃO', 0),
(77, '2022-02-04 23:07:54', 'ROTA 17 - ANJO DA GUARDA', 0),
(78, '2022-02-04 23:07:54', 'ROTA 18 - RENASCENÇA', 0),
(79, '2022-02-04 23:07:54', 'ROTA 19 - TURU', 0),
(80, '2022-02-04 23:07:54', 'ROTA 20 - OLHO DÁGUA', 0),
(81, '2022-02-04 23:07:54', 'ROTA 50 - CANTINHO DO CÉU', 0),
(82, '2022-02-04 23:07:54', 'ROTA 51 - DIVINÉIA ', 0),
(83, '2022-02-04 23:07:54', 'ROTA 52 - CENTRO', 0),
(84, '2022-02-04 23:07:54', 'ROTA 53 - VILA EMBRATE', 0),
(85, '2022-02-04 23:07:54', 'ROTA 54 - TIRIRICAL', 0),
(86, '2022-02-04 23:07:54', 'ROTA 55 - PONTA DA AREIA', 0),
(87, '2022-02-04 23:07:54', 'ROTA 56 - FORQUILHA', 0),
(88, '2022-02-04 23:07:54', 'ROTA 57 - CIDADE OLÍMPICA', 0),
(89, '2022-02-04 23:07:54', 'ROTA 58 - SÃO JOSÉ DE RIBAMAR', 0),
(90, '2022-02-22 16:32:27', 'ROTA 500', 0),
(91, '2022-02-22 16:33:10', 'ROTA 501', 0),
(92, '2022-02-22 16:33:46', 'ROTA 502', 0),
(93, '2022-02-22 16:34:12', 'ROTA 503', 150),
(94, '2022-02-22 16:34:30', 'ROTA 504', 0),
(95, '2022-02-22 16:34:59', 'ROTA 505', 0),
(96, '2022-02-22 16:35:20', 'ROTA 506', 0),
(97, '2022-02-22 16:35:42', 'ROTA 507', 0),
(98, '2022-02-22 16:36:07', 'ROTA 508', 0),
(99, '2022-02-22 16:36:33', 'ROTA 509', 0),
(100, '2022-02-22 16:36:54', 'ROTA 510', 0),
(101, '2022-02-22 16:37:17', 'ROTA 511', 0),
(102, '2022-02-22 16:37:45', 'ROTA 512', 0),
(103, '2022-02-22 16:38:08', 'ROTA 513', 0),
(104, '2022-02-22 16:38:32', 'ROTA 514', 0),
(105, '2022-02-22 16:38:59', 'ROTA 515', 0),
(106, '2022-02-22 16:39:27', 'ROTA 516', 0),
(107, '2022-02-22 16:39:47', 'ROTA 517', 0),
(108, '2022-02-22 16:40:17', 'ROTA 518', 0),
(109, '2022-02-22 16:40:46', 'ROTA 519', 0),
(110, '2022-02-22 16:41:20', 'ROTA 520', 0),
(111, '2022-02-22 17:31:19', 'ROTA 21 - RIBAMAR', 0),
(112, '2022-02-22 17:31:35', 'ROTA 22 - SHOPPING', 0),
(113, '2022-02-22 17:32:55', 'ROTA 118 - itapecuru', 0),
(114, '2022-02-22 17:33:16', 'rota 119 - chapadinha', 0),
(115, '2022-02-22 17:33:28', 'ROTA 120 - tutóia', 0),
(116, '2022-06-22 15:18:22', 'central de entregas', -100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ocorrencias`
--

INSERT INTO `ocorrencias` (`id`, `nome`) VALUES
(1, 'Endereço não encotrado'),
(2, 'Dificil acesso'),
(3, 'Moto apreendida'),
(6, 'Ausente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `producao`
--

CREATE TABLE `producao` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `receber_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL,
  `rotas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `producao`
--

INSERT INTO `producao` (`id`, `data`, `data_inicio`, `data_fim`, `qtd`, `status`, `entregadores_id`, `receber_id`, `regioes_id`, `usuarios_id`, `setores_id`, `servicos_id`, `rotas_id`) VALUES
(1156, '2022-06-17 17:49:35', '2022-06-17', '2022-06-19', 0, 2, 175, 1172, 74, 4, 1, 5, 15),
(1157, '2022-06-17 17:55:26', '2022-06-17', '2022-06-19', 0, 2, 175, 1173, 74, 4, 3, 4, 13),
(1158, '2022-06-19 18:51:39', '2022-06-19', '2022-06-26', 0, 2, 176, 1174, 77, 4, 1, 1, 32),
(1159, '2022-06-19 18:53:33', '2022-06-19', '2022-06-21', 0, 2, 175, 1175, 74, 4, 1, 1, 13),
(1160, '2022-06-19 18:55:44', '2022-06-19', '2022-06-26', 0, 2, 176, 1176, 77, 4, 3, 3, 32),
(1161, '2022-06-19 20:09:50', '2022-06-19', '2022-06-26', 0, 2, 176, 1177, 77, 4, 3, 4, 32),
(1162, '2022-06-22 13:13:52', '2022-06-22', '2022-06-24', 0, 2, 175, 1178, 74, 4, 3, 4, 15),
(1163, '2022-06-22 13:24:22', '2022-06-22', '2022-06-29', 0, 2, 176, 1179, 77, 14, 3, 4, 32),
(1164, '2022-06-22 13:33:16', '2022-06-22', '2022-06-29', 0, 2, 176, 1180, 77, 4, 3, 3, 32),
(1165, '2022-06-22 13:34:13', '2022-06-22', '2022-06-24', 0, 2, 175, 1180, 74, 4, 3, 3, 15),
(1166, '2022-06-22 15:08:30', '2022-06-22', '2022-06-24', 0, 2, 175, 1181, 74, 4, 3, 3, 15),
(1167, '2022-06-22 15:08:54', '2022-06-22', '2022-06-29', 0, 2, 176, 1181, 77, 4, 1, 4, 32),
(1168, '2022-06-22 15:30:35', '2022-06-22', '2022-06-24', 0, 2, 175, 1182, 74, 4, 3, 3, 13),
(1169, '2022-06-22 22:25:41', '2022-06-22', '2022-06-24', 0, 2, 175, 1183, 74, 4, 3, 3, 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `receber`
--

CREATE TABLE `receber` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `disponivel` int(11) DEFAULT NULL,
  `clientes_id` int(11) NOT NULL,
  `gaiolas_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `receber`
--

INSERT INTO `receber` (`id`, `data`, `qtd`, `disponivel`, `clientes_id`, `gaiolas_id`, `usuarios_id`, `servicos_id`, `setores_id`) VALUES
(1172, '2022-06-17 17:48:58', 10, 0, 14, 39, 4, 5, 1),
(1173, '2022-06-17 17:54:54', 10, 0, 17, 39, 4, 4, 3),
(1174, '2022-06-19 18:50:51', 50, 0, 8, 39, 4, 1, 1),
(1175, '2022-06-19 18:52:49', 12, 0, 14, 40, 4, 1, 1),
(1176, '2022-06-19 18:54:53', 70, 0, 7, 39, 4, 3, 3),
(1177, '2022-06-19 20:09:02', 100, 0, 9, 39, 4, 4, 3),
(1178, '2022-06-22 13:10:14', 15, 0, 7, 39, 4, 4, 3),
(1179, '2022-06-22 13:22:08', 15, 0, 7, 39, 14, 4, 3),
(1180, '2022-06-22 13:31:36', 15, 0, 7, 39, 4, 3, 3),
(1181, '2022-06-22 15:04:31', 20, 0, 8, 39, 4, 3, 3),
(1182, '2022-06-22 15:27:12', 50, 0, 7, 116, 4, 5, 1),
(1183, '2022-06-22 22:25:01', 50, 0, 8, 116, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `regioes`
--

CREATE TABLE `regioes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `regioes`
--

INSERT INTO `regioes` (`id`, `nome`) VALUES
(74, 'GRANDE ILHA'),
(76, 'COCAIS'),
(77, 'LENÇÓIS'),
(78, 'CENTRAL'),
(79, 'BAIXADA'),
(80, 'PARNAÍBA'),
(81, 'SUL DO MARANHÃO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `retorno`
--

CREATE TABLE `retorno` (
  `id` int(11) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `ocorrencias_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `producao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `retorno`
--

INSERT INTO `retorno` (`id`, `data`, `qtd`, `status`, `entregadores_id`, `ocorrencias_id`, `tipo_id`, `producao_id`) VALUES
(182, '2022-01-29 00:00:46', 1, 0, 73, 6, 1, 214),
(183, '2022-01-13 13:15:51', 1, 0, 96, 6, 1, 247),
(184, '2022-01-26 13:25:07', 3, 0, 96, 1, 2, 248),
(185, '2022-04-27 15:41:12', 0, 1, 96, 6, 1, 250),
(197, '2022-05-05 09:54:38', 0, 1, 83, 1, 2, 939),
(200, '2022-05-05 10:26:55', 0, 1, 78, 6, 1, 941),
(201, '2022-05-14 09:50:02', 2, 0, 97, 1, 2, 967),
(202, '2022-06-13 21:47:04', 5, 0, 70, 2, 2, 1120),
(203, '2022-06-14 19:41:48', 5, 0, 0, 6, 1, 1135),
(204, '2022-06-14 19:42:24', 5, 0, 0, 2, 2, 1135),
(205, '2022-06-14 23:38:01', 25, 0, 175, 2, 2, 1137),
(206, '2022-06-15 19:25:45', 0, 1, 175, 6, 1, 1140),
(207, '2022-06-22 10:19:58', 0, 1, 176, 6, 1, 1161),
(208, '2022-06-22 10:19:49', 0, 1, 176, 2, 2, 1161),
(209, '2022-06-22 10:19:42', 0, 1, 176, 1, 2, 1161),
(210, '2022-06-22 10:19:15', 0, 1, 175, 6, 1, 1162),
(211, '2022-06-25 19:56:38', 0, 1, 176, 6, 1, 1163),
(212, '2022-06-30 19:56:24', 0, 1, 175, 6, 1, 1168);

-- --------------------------------------------------------

--
-- Estrutura da tabela `retorno_gaiola`
--

CREATE TABLE `retorno_gaiola` (
  `id` int(11) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `ocorrencias_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `producao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rotas`
--

CREATE TABLE `rotas` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `nome` varchar(45) DEFAULT NULL,
  `regioes_id` int(11) NOT NULL,
  `gaiolas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `rotas`
--

INSERT INTO `rotas` (`id`, `data`, `nome`, `regioes_id`, `gaiolas_id`) VALUES
(13, '2022-02-04 22:48:05', 'ROTA 01 - PAÇO ', 74, 39),
(14, '2022-02-04 22:48:05', 'ROTA 02 - ELDORADO', 74, 40),
(15, '2022-02-04 22:48:05', 'ROTA 03 - RECANTO', 74, 41),
(16, '2022-02-04 22:48:05', 'ROTA 04 - VINHAIS', 74, 42),
(17, '2022-02-04 22:48:05', 'ROTA 05 - ANIL  ', 74, 43),
(18, '2022-02-04 22:48:05', 'ROTA 06 - VILA PALMEIRA', 74, 44),
(19, '2022-02-04 22:48:05', 'ROTA 07 - COROADINHO', 74, 45),
(20, '2022-02-04 22:48:05', 'ROTA 08 - SÃO FRANCISCO', 74, 46),
(21, '2022-02-04 22:48:05', 'ROTA 09 - PONTA DO FAROL', 74, 47),
(22, '2022-02-04 22:48:05', 'ROTA 10 - CIDADE OPERÁRIA', 74, 48),
(23, '2022-02-04 22:48:05', 'ROTA 100 - BACABAL', 76, 49),
(24, '2022-02-04 22:48:05', 'ROTA 101 - LAGO DA PEDRA', 76, 50),
(25, '2022-02-04 22:48:05', 'ROTA 102 - BARRA DO CORDA', 76, 51),
(26, '2022-02-04 22:48:05', 'ROTA 103 - COROATÁ', 76, 52),
(27, '2022-02-04 22:48:05', 'ROTA 104 - COLINAS', 76, 53),
(28, '2022-02-04 22:48:05', 'ROTA 105 - DOM PEDRO', 76, 54),
(29, '2022-02-04 22:48:05', 'ROTA 106 - PRES. DUTRA / TUMTUM', 76, 55),
(30, '2022-02-04 22:48:05', 'ROTA 107 - PEDREIRAS / TRIZIDELA', 76, 56),
(31, '2022-02-04 22:48:05', 'ROTA 108 - SÃO MATEUS', 76, 57),
(32, '2022-02-04 22:48:05', 'ROTA 109 - ROSÁRIO', 77, 58),
(33, '2022-02-04 22:48:05', 'ROTA 11 - COHATRAC ', 74, 59),
(34, '2022-02-04 22:48:05', 'Rota 110 - BARRERINHAS', 77, 60),
(35, '2022-02-04 22:48:05', 'ROTA 111 - ZÉ DOCA', 78, 61),
(36, '2022-02-04 22:48:05', 'ROTA 112 - SANTA INÊS', 78, 62),
(37, '2022-02-04 22:48:05', 'ROTA 113 - SANTA LUZIA', 78, 63),
(38, '2022-02-04 22:48:05', 'ROTA 114 - VIANA / ARARI', 79, 64),
(39, '2022-02-04 22:48:05', 'ROTA 115 - SÃO BENTO', 79, 65),
(40, '2022-02-04 22:48:05', 'ROTA 116 - PINHEIRO', 79, 66),
(41, '2022-02-04 22:48:05', 'ROTA 117 - CURURUPU', 79, 67),
(42, '2022-02-04 22:48:05', 'ROTA 12 - LIBERDADE', 74, 68),
(43, '2022-02-04 22:48:05', 'ROTA 121 - CAROLINA/ESTREITO/GRAJAÚ/J.LISBOA/', 81, 69),
(44, '2022-02-04 22:48:05', 'ROTA 122 - IMPERATRIZ', 81, 70),
(45, '2022-02-04 22:48:05', 'ROTA 123 - BALSAS', 81, 71),
(46, '2022-02-04 22:48:05', 'ROTA 122 - IMPERATRIZ', 81, 70),
(47, '2022-02-04 22:48:05', 'ROTA 124 - AÇAILÂNDIA ', 81, 72),
(48, '2022-02-04 22:48:05', 'ROTA 13 - COHAB', 74, 73),
(49, '2022-02-04 22:48:05', 'ROTA 14 - ARAÇAGY', 74, 74),
(50, '2022-02-04 22:48:05', 'ROTA 15 - BR', 74, 75),
(51, '2022-02-04 22:48:05', 'ROTA 16 - SÃO CRISTÓVÃO', 74, 76),
(52, '2022-02-04 22:48:05', 'ROTA 17 - ANJO DA GUARDA', 74, 77),
(53, '2022-02-04 22:48:05', 'ROTA 18 - RENASCENÇA', 74, 78),
(54, '2022-02-04 22:48:05', 'ROTA 19 - TURU ', 74, 79),
(55, '2022-02-04 22:48:05', 'ROTA 20 - OLHO DÁGUA', 74, 80),
(56, '2022-02-04 22:48:05', 'ROTA 50 - CANTINHO DO CÉU ', 74, 81),
(57, '2022-02-04 22:48:05', 'ROTA 51 - DIVINÉIA', 74, 82),
(58, '2022-02-04 22:48:05', 'ROTA 52 - CENTRO', 74, 83),
(59, '2022-02-04 22:48:05', 'ROTA 53 - VILA EMBRATEL', 74, 84),
(60, '2022-02-04 22:48:05', 'ROTA 54 - TIRIRICAL', 74, 85),
(61, '2022-02-04 22:48:05', 'ROTA 55 - PONTA DA AREIA', 74, 86),
(62, '2022-02-04 22:48:05', 'ROTA 56 - FORQUILHA', 74, 87),
(63, '2022-02-04 22:48:05', 'ROTA 57 - CIDADE OLÍMPICA', 74, 88),
(64, '2022-02-04 22:48:05', 'ROTA 58 - SÃO JOSÉ DE RIBAMAR', 74, 89),
(66, '2022-02-22 16:44:38', 'ROTA 500 - ARLEAN', 74, 90),
(67, '2022-02-22 16:45:10', 'ROTA 501 - ANTONIO JOSE', 74, 91),
(68, '2022-02-22 16:45:32', 'ROTA 502 - JOSÉ CARLOS', 74, 92),
(69, '2022-02-22 16:50:13', 'ROTA 503 - GILMAR', 74, 93),
(70, '2022-02-22 16:52:44', 'ROTA 504 - VITAL', 74, 94),
(71, '2022-02-22 16:54:20', 'ROTA 505 - EDSON', 74, 95),
(72, '2022-02-22 16:55:02', 'ROTA 506 - ROBERTO', 74, 96),
(73, '2022-02-22 16:55:43', 'ROTA 507 - ANTONIO JOSE', 74, 97),
(74, '2022-02-22 16:58:44', 'ROTA 508 - DENILSON COSTA', 74, 98),
(75, '2022-02-22 16:59:23', 'ROTA 509 - NATAN', 74, 99),
(76, '2022-02-22 17:00:34', 'ROTA 510 - MARTINS', 74, 100),
(77, '2022-02-22 17:03:01', 'ROTA 511 - CLAUDENILSON', 74, 101),
(78, '2022-02-22 17:04:51', 'ROTA 512 - CARLINHOS', 74, 102),
(79, '2022-02-22 17:07:41', 'ROTA 513 - SERGIO', 74, 103),
(80, '2022-02-22 17:09:52', 'ROTA 514 - MAURO', 74, 104),
(81, '2022-02-22 17:11:06', 'ROTA 515 - WILLIAN', 74, 105),
(82, '2022-02-22 17:11:50', 'ROTA 516 - JAILSON', 74, 106),
(83, '2022-02-22 17:14:40', 'ROTA 517 - JORGE LUIS', 74, 107),
(84, '2022-02-22 17:15:37', 'ROTA 518 - CLODOALDO', 74, 108),
(85, '2022-02-22 17:17:31', 'ROTA 519 - ARAÇAGI - MARCOS FONSECA', 74, 109),
(86, '2022-02-22 17:19:33', 'ROTA 520 - DELNILSON BRANDÃO', 74, 110),
(87, '2022-02-22 17:36:02', 'ROTA 21 - RIBAMAR', 74, 111),
(88, '2022-02-22 17:37:25', 'ROTA 22 - SHOPPING', 74, 112),
(89, '2022-02-22 17:40:46', 'ROTA 118 - itapecuru', 80, 113),
(90, '2022-02-22 17:41:40', 'rota 119 - chapadinha', 80, 114),
(91, '2022-02-22 17:43:59', 'ROTA 120 - tutóia', 80, 115),
(92, '2022-02-22 17:43:59', 'ROTA  - NAO IDENTIFICADA', 79, 115),
(93, '2022-06-22 15:19:02', 'CENTRAL DE ENTREGAS', 74, 116);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `setores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `setores_id`) VALUES
(1, 'Pequenos volumes', 1),
(3, 'Boletos', 3),
(4, 'Cartões', 3),
(5, 'Grandes volumes', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `setores`
--

CREATE TABLE `setores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `setores`
--

INSERT INTO `setores` (`id`, `nome`) VALUES
(1, 'E- commerce'),
(3, 'Editorial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`id`, `nome`) VALUES
(1, 'RETORNO A GAIOLA'),
(2, 'BACK LOG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargos_id` int(11) NOT NULL,
  `acessos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cargos_id`, `acessos_id`) VALUES
(4, 'admin', 'admin@eneylton.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 1),
(7, 'ene', 'eneylton@hotmail.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 2),
(13, 'enexs', 'enex@gmail.com.br', '202cb962ac59075b964b07152d234b70', 1, 3),
(14, 'Eneylton-Asistente', 'asistente@eneylton.com', '$2y$10$AytleJyxH9KKPEg2CJ.UxO5AkmfJqZwmY8owNHiwjr4ke/XewmGLq', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `nome`) VALUES
(1, 'MOTO'),
(2, 'CARRO'),
(3, 'CAMINHÃO'),
(5, 'BIKE');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `backlog`
--
ALTER TABLE `backlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retorno_ocorrencias1_idx1` (`ocorrencias_id`),
  ADD KEY `fk_retorno_entregadores1_idx1` (`entregadores_id`),
  ADD KEY `fk_retorno_tipo1_idx1` (`tipo_id`),
  ADD KEY `fk_backlog_producao1_idx` (`producao_id`);

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_clientes_setores1_idx` (`setores_id`);

--
-- Índices para tabela `devolucao`
--
ALTER TABLE `devolucao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_devolucao_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_devolucao_producao1_idx` (`producao_id`),
  ADD KEY `fk_devolucao_ocorrencias1_idx` (`ocorrencias_id`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entrega_producao1_idx` (`producao_id`),
  ADD KEY `fk_entrega_entregadores1_idx` (`entregadores_id`);

--
-- Índices para tabela `entregadores`
--
ALTER TABLE `entregadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregadores_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_entregadores_forma_pagamento1_idx` (`forma_pagamento_id`),
  ADD KEY `fk_entregadores_veiculos1_idx` (`veiculos_id`),
  ADD KEY `fk_entregadores_regioes1_idx` (`regioes_id`);

--
-- Índices para tabela `entregador_rota`
--
ALTER TABLE `entregador_rota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregador_rota_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_entregador_rota_rotas1_idx` (`rotas_id`),
  ADD KEY `fk_entregador_rota_regioes1_idx` (`regioes_id`);

--
-- Índices para tabela `entregador_servicos`
--
ALTER TABLE `entregador_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregador_servicos_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_entregador_servicos_servicos1_idx` (`servicos_id`);

--
-- Índices para tabela `entregador_setores`
--
ALTER TABLE `entregador_setores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregador_setores_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_entregador_setores_setores1_idx` (`setores_id`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `gaiolas`
--
ALTER TABLE `gaiolas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `producao`
--
ALTER TABLE `producao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producao_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_producao_receber1_idx` (`receber_id`),
  ADD KEY `fk_producao_regioes1_idx` (`regioes_id`),
  ADD KEY `fk_producao_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_producao_setores1_idx` (`setores_id`),
  ADD KEY `fk_producao_servicos1_idx` (`servicos_id`),
  ADD KEY `fk_producao_rotas1_idx` (`rotas_id`);

--
-- Índices para tabela `receber`
--
ALTER TABLE `receber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_receber_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_receber_gaiolas1_idx` (`gaiolas_id`),
  ADD KEY `fk_receber_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_receber_servicos1_idx` (`servicos_id`),
  ADD KEY `fk_receber_setores1_idx` (`setores_id`);

--
-- Índices para tabela `regioes`
--
ALTER TABLE `regioes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `retorno`
--
ALTER TABLE `retorno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retorno_ocorrencias1_idx1` (`ocorrencias_id`),
  ADD KEY `fk_retorno_producao1_idx` (`producao_id`),
  ADD KEY `fk_retorno_entregadores1_idx1` (`entregadores_id`),
  ADD KEY `fk_retorno_tipo1_idx1` (`tipo_id`);

--
-- Índices para tabela `retorno_gaiola`
--
ALTER TABLE `retorno_gaiola`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retorno_ocorrencias1_idx1` (`ocorrencias_id`),
  ADD KEY `fk_retorno_entregadores1_idx1` (`entregadores_id`),
  ADD KEY `fk_retorno_tipo1_idx1` (`tipo_id`),
  ADD KEY `fk_retorno_gaiola_producao1_idx` (`producao_id`);

--
-- Índices para tabela `rotas`
--
ALTER TABLE `rotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rotas_regioes1_idx` (`regioes_id`),
  ADD KEY `fk_rotas_gaiolas1_idx` (`gaiolas_id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servicos_setores1_idx` (`setores_id`);

--
-- Índices para tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuarios_cargos_idx` (`cargos_id`),
  ADD KEY `fk_usuarios_acessos1_idx` (`acessos_id`);

--
-- Índices para tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `backlog`
--
ALTER TABLE `backlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `devolucao`
--
ALTER TABLE `devolucao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1113;

--
-- AUTO_INCREMENT de tabela `entregadores`
--
ALTER TABLE `entregadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT de tabela `entregador_rota`
--
ALTER TABLE `entregador_rota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `entregador_servicos`
--
ALTER TABLE `entregador_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT de tabela `entregador_setores`
--
ALTER TABLE `entregador_setores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `gaiolas`
--
ALTER TABLE `gaiolas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `producao`
--
ALTER TABLE `producao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1170;

--
-- AUTO_INCREMENT de tabela `receber`
--
ALTER TABLE `receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1184;

--
-- AUTO_INCREMENT de tabela `regioes`
--
ALTER TABLE `regioes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de tabela `retorno`
--
ALTER TABLE `retorno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT de tabela `retorno_gaiola`
--
ALTER TABLE `retorno_gaiola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de tabela `rotas`
--
ALTER TABLE `rotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `backlog`
--
ALTER TABLE `backlog`
  ADD CONSTRAINT `fk_backlog_producao1` FOREIGN KEY (`producao_id`) REFERENCES `producao` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_retorno_entregadores10` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_retorno_ocorrencias10` FOREIGN KEY (`ocorrencias_id`) REFERENCES `ocorrencias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_retorno_tipo10` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_setores1` FOREIGN KEY (`setores_id`) REFERENCES `setores` (`id`),
  ADD CONSTRAINT `fk_clientes_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `devolucao`
--
ALTER TABLE `devolucao`
  ADD CONSTRAINT `fk_devolucao_entregadores1` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_devolucao_ocorrencias1` FOREIGN KEY (`ocorrencias_id`) REFERENCES `ocorrencias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_devolucao_producao1` FOREIGN KEY (`producao_id`) REFERENCES `producao` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `entregadores`
--
ALTER TABLE `entregadores`
  ADD CONSTRAINT `fk_entregadores_forma_pagamento1` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`id`),
  ADD CONSTRAINT `fk_entregadores_regioes1` FOREIGN KEY (`regioes_id`) REFERENCES `regioes` (`id`),
  ADD CONSTRAINT `fk_entregadores_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_entregadores_veiculos1` FOREIGN KEY (`veiculos_id`) REFERENCES `veiculos` (`id`);

--
-- Limitadores para a tabela `entregador_rota`
--
ALTER TABLE `entregador_rota`
  ADD CONSTRAINT `fk_entregador_rota_entregadores1` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entregador_rota_regioes1` FOREIGN KEY (`regioes_id`) REFERENCES `regioes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entregador_rota_rotas1` FOREIGN KEY (`rotas_id`) REFERENCES `rotas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `entregador_servicos`
--
ALTER TABLE `entregador_servicos`
  ADD CONSTRAINT `fk_entregador_servicos_entregadores1` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_entregador_servicos_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `entregador_setores`
--
ALTER TABLE `entregador_setores`
  ADD CONSTRAINT `fk_entregador_setores_entregadores1` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_entregador_setores_setores1` FOREIGN KEY (`setores_id`) REFERENCES `setores` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `producao`
--
ALTER TABLE `producao`
  ADD CONSTRAINT `fk_producao_rotas1` FOREIGN KEY (`rotas_id`) REFERENCES `rotas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producao_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producao_setores1` FOREIGN KEY (`setores_id`) REFERENCES `setores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `receber`
--
ALTER TABLE `receber`
  ADD CONSTRAINT `fk_receber_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receber_setores1` FOREIGN KEY (`setores_id`) REFERENCES `setores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
