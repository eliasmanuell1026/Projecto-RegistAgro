-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 23-Out-2025 às 18:51
-- Versão do servidor: 9.1.0
-- versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_registagro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_avaliacao`
--

DROP TABLE IF EXISTS `tb_avaliacao`;
CREATE TABLE IF NOT EXISTS `tb_avaliacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_avaliador` int NOT NULL,
  `id_avaliado` int NOT NULL,
  `id_pedido` int NOT NULL,
  `nota` decimal(10,2) NOT NULL DEFAULT '0.00',
  `comentario` text,
  `data_avaliacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_avaliador` (`id_avaliador`),
  KEY `id_avaliado` (`id_avaliado`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_chat_mensagem`
--

DROP TABLE IF EXISTS `tb_chat_mensagem`;
CREATE TABLE IF NOT EXISTS `tb_chat_mensagem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_remetente` int NOT NULL,
  `id_destinatario` int NOT NULL,
  `mensagem` text NOT NULL,
  `data_envio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_remetente` (`id_remetente`),
  KEY `id_destinatario` (`id_destinatario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_compatibilidade`
--

DROP TABLE IF EXISTS `tb_compatibilidade`;
CREATE TABLE IF NOT EXISTS `tb_compatibilidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_produto` enum('fruta','vegetal','cereal','carne','raiz') NOT NULL,
  `transporte_ideal` enum('frigorifico','fechado','aberto','aberto_coberto') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_favorito`
--

DROP TABLE IF EXISTS `tb_favorito`;
CREATE TABLE IF NOT EXISTS `tb_favorito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_consumidor` int NOT NULL,
  `id_produto` int NOT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_consumidor` (`id_consumidor`),
  KEY `id_produto` (`id_produto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fazenda`
--

DROP TABLE IF EXISTS `tb_fazenda`;
CREATE TABLE IF NOT EXISTS `tb_fazenda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `possui_transporte` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_historico_atividades`
--

DROP TABLE IF EXISTS `tb_historico_atividades`;
CREATE TABLE IF NOT EXISTS `tb_historico_atividades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `tipo_atividade` varchar(90) NOT NULL,
  `descricao` text NOT NULL,
  `data_atividade` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
CREATE TABLE IF NOT EXISTS `tb_pagamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `valor_total` int NOT NULL,
  `status` enum('sucesso','falha') DEFAULT NULL,
  `data_pagamento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
CREATE TABLE IF NOT EXISTS `tb_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_consumidor` int NOT NULL,
  `id_produto` int NOT NULL,
  `transporte_usado` enum('transpotadora','proprio','fazenda') DEFAULT NULL,
  `status` enum('pendente','aceito','em transporte','entregue','cancelado') DEFAULT NULL,
  `data_pedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_consumidor` (`id_consumidor`),
  KEY `id_produto` (`id_produto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
CREATE TABLE IF NOT EXISTS `tb_produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fazenda` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` enum('fruta','vegetal','cereal','carne','raiz') NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `unidade` varchar(20) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id`),
  KEY `id_fazenda` (`id_fazenda`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_restreamento`
--

DROP TABLE IF EXISTS `tb_restreamento`;
CREATE TABLE IF NOT EXISTS `tb_restreamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `link` varchar(80) NOT NULL,
  `latitude` decimal(10,2) NOT NULL,
  `altitude` decimal(10,2) NOT NULL,
  `hora_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rotas_disponiveis`
--

DROP TABLE IF EXISTS `tb_rotas_disponiveis`;
CREATE TABLE IF NOT EXISTS `tb_rotas_disponiveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_transportadora` int NOT NULL,
  `origem` varchar(100) NOT NULL,
  `destino` varchar(100) NOT NULL,
  `data_prevista` date DEFAULT NULL,
  `capacidade` decimal(10,2) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_transportadora` (`id_transportadora`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_transporte`
--

DROP TABLE IF EXISTS `tb_transporte`;
CREATE TABLE IF NOT EXISTS `tb_transporte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `tipo` enum('frigorifico','fechado','aberto','aberto coberto') DEFAULT NULL,
  `capacidade` decimal(10,2) DEFAULT NULL,
  `trasporte_proprio` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
CREATE TABLE IF NOT EXISTS `tb_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nif` int NOT NULL,
  `nome` varchar(90) NOT NULL,
  `tipo` enum('produtor','transportadora','consumidor') DEFAULT NULL,
  `localizacao` varchar(150) DEFAULT NULL,
  `contacto` int DEFAULT NULL,
  `reputacao` decimal(3,2) DEFAULT '0.00',
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`),
  UNIQUE KEY `contacto` (`contacto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
