-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 23-Out-2025 às 18:49
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
-- Banco de dados: `db_agt`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_empresas`
--

DROP TABLE IF EXISTS `tb_empresas`;
CREATE TABLE IF NOT EXISTS `tb_empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nif` int NOT NULL,
  `nome_empresa` varchar(90) NOT NULL,
  `tipo_empresa` enum('fazenda','transportadora','consumidor','outro') NOT NULL,
  `provincia` varchar(90) NOT NULL,
  `municipio` varchar(90) NOT NULL,
  `contacto` int DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `data_registo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `localizacao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`),
  UNIQUE KEY `contacto` (`contacto`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tb_empresas`
--

INSERT INTO `tb_empresas` (`id`, `nif`, `nome_empresa`, `tipo_empresa`, `provincia`, `municipio`, `contacto`, `email`, `data_registo`, `localizacao`) VALUES
(1, 500006789, 'Macon Transportes', 'transportadora', 'Luanda', 'Kilamba Kiaxi', 939999554, 'macontransp@macon.com', '2025-10-22 11:42:46', 'Gamek'),
(2, 500001259, 'REAL EXPRESS ANGOLA', 'transportadora', 'Luanda', 'Kilamba Kiaxi', 941731729, 'realexpress@realexpress.com', '2025-10-22 11:42:46', 'Frente ao Hotel FLEUMA, Av. 21 de Janeiro, Junto a Igreja universal, Luanda'),
(3, 500003647, 'Central de Logística e Transportes Lda', 'transportadora', 'Icolo e Bengo', 'Catete', 929439554, 'clt@clt.com', '2025-10-22 13:29:56', 'Estr. de Catete'),
(4, 500001234, 'Fazenda Verde Vida', 'fazenda', 'Icolo e Bengo', 'Bom Jesus do Cuanza', 923111222, 'fazendaverdevida@gmail.com', '2025-10-23 13:32:08', 'Bom Jesus do Cuanza'),
(5, 500002345, 'TransAgro Angola', 'transportadora', 'Icolo e Bengo', 'Cabiri', 923222333, 'transagroangola@transagro.com', '2025-10-23 13:32:08', 'Cabiri'),
(6, 500003456, 'AgroMarket Lda', 'consumidor', 'Luanda', 'Luanda', 923333444, 'agromarket@agromarket.com', '2025-10-23 13:32:08', 'Rangel'),
(7, 540001001, 'Fazenda Nova Esperança', 'fazenda', 'Luanda', 'Viana', 923111001, 'fazendaesperanca@gmail.com', '2025-10-23 13:54:12', 'Estrada do Zango 3'),
(8, 540002001, 'TransLuanda Logística', 'transportadora', 'Luanda', 'Talatona', 923222001, 'suporte@transluanda.co.ao', '2025-10-23 13:54:12', 'Rua da Samba, Ed. LogCom'),
(9, 540003001, 'AgroMarket Lda', 'consumidor', 'Luanda', 'Belas', 923333001, 'contato@agromarket.co.ao', '2025-10-23 13:54:12', 'Shopping Belas Center'),
(10, 540001002, 'AgroVerde Luanda', 'fazenda', 'Luanda', 'Belas', 923111002, 'contato@agroverdeluanda.co.ao', '2025-10-23 13:54:12', 'Bairro Benfica, km 30'),
(11, 540002002, 'AgroTrans Lda', 'transportadora', 'Icolo e Bengo', 'Catete', 923222002, 'agrotranslda@gmail.com', '2025-10-23 13:54:12', 'Zona Industrial do Catete'),
(12, 540003002, 'Cantina do Povo', 'consumidor', 'Luanda', 'Cacuaco', 923333002, 'cantinadopovo@gmail.com', '2025-10-23 13:54:12', 'Mercado do Kikolo'),
(13, 540001003, 'Fazenda Bela Terra', 'fazenda', 'Icolo e Bengo', 'Catete', 923111003, 'belaterra.ang@gmail.com', '2025-10-23 13:54:12', 'Rua Principal do Catete'),
(14, 540002003, 'Huambo Expresso Angola', 'transportadora', 'Luanda', 'Viana', 923222003, 'maconcargo@macon.co.ao', '2025-10-23 13:54:12', 'Parque Logístico Viana'),
(15, 540003003, 'Distribuidora Boa Safra', 'consumidor', 'Icolo e Bengo', 'Caboledo', 923333003, 'boasafra@distribuidora.co.ao', '2025-10-23 13:54:12', 'Bairro Central Catete'),
(16, 540001004, 'Campo do Futuro', 'fazenda', 'Luanda', 'Cacuaco', 923111004, 'campofuturo@gmail.com', '2025-10-23 14:16:15', 'Estrada da Mabunda'),
(17, 540002004, 'RapidCargo Express', 'transportadora', 'Luanda', 'Kilamba Kiaxi', 923222004, 'rapidcargo@gmail.com', '2025-10-23 14:16:15', 'Rua 21 do Kilamba'),
(18, 540003004, 'Mercado Verde Angola', 'consumidor', 'Luanda', 'Talatona', 923333004, 'mercadoverde@gmail.com', '2025-10-23 14:16:15', 'Rua dos Agricultores'),
(19, 540001005, 'AgroVale Angola', 'fazenda', 'Icolo e Bengo', 'Caculo Cahango', 923111005, 'agrovale.ao@gmail.com', '2025-10-23 14:16:15', 'Comunidade do Vale Verde'),
(20, 540002005, 'TransAgro Bengo', 'transportadora', 'Icolo e Bengo', 'Caculo Cahango', 923222005, 'transagrobengo@gmail.com', '2025-10-23 14:16:15', 'Estrada Nacional EN230'),
(21, 540003005, 'FrescoMais Angola', 'consumidor', 'Icolo e Bengo', 'Caculo Cahango', 923333005, 'frescomais@compras.co.ao', '2025-10-23 14:16:15', 'Comunidade de Mazozo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_impostos`
--

DROP TABLE IF EXISTS `tb_impostos`;
CREATE TABLE IF NOT EXISTS `tb_impostos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_empresa` int NOT NULL,
  `tipo_imposto` enum('iva','renda','industrial') DEFAULT 'iva',
  `valor_pago` decimal(10,2) NOT NULL,
  `data_pagamento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('regular','pendente','em atraso') DEFAULT 'regular',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
