-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 31, 2017 at 07:06 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `sgc_development`
--
CREATE DATABASE IF NOT EXISTS `sgc_development` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sgc_development`;

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2017-10-15 20:25:18', '2017-10-15 20:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `caixas`
--

CREATE TABLE `caixas` (
  `id` bigint(20) NOT NULL,
  `data` datetime DEFAULT NULL,
  `responsavel` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `caixas`
--

INSERT INTO `caixas` (`id`, `data`, `responsavel`, `status`, `created_at`, `updated_at`) VALUES
(2, '2017-10-22 22:03:00', 'dfa', 1, '2017-10-23 00:03:44', '2017-10-23 00:03:44'),
(3, '2017-10-23 00:00:00', 'hghgf', 1, '2017-10-23 00:18:39', '2017-10-23 00:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `endereco_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `celular`, `telefone`, `email`, `cpf`, `endereco_id`, `created_at`, `updated_at`) VALUES
(1, 'Elias', '51 997997972', '', 'elias@elias.com', '11111111111', 1, '2017-10-15 22:35:49', '2017-10-15 22:35:49'),
(2, 'Tatiane', '71 988890890', '', '', '', 1, '2017-10-29 17:14:46', '2017-10-29 17:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `enderecos`
--

CREATE TABLE `enderecos` (
  `id` bigint(20) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enderecos`
--

INSERT INTO `enderecos` (`id`, `endereco`, `numero`, `complemento`, `cidade`, `estado`, `cep`, `created_at`, `updated_at`) VALUES
(1, 'Av Ceres', 129, 'APT 311', 'Porto Alegre', 'RS', '91530030', '2017-10-15 20:44:43', '2017-10-15 20:44:43'),
(2, 'Cairu', 1, '', '', '', '', '2017-10-29 22:42:23', '2017-10-29 22:42:23'),
(3, 'Wei', NULL, '', '', '', '', '2017-10-29 22:42:30', '2017-10-29 22:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `fornecedors`
--

CREATE TABLE `fornecedors` (
  `id` bigint(20) NOT NULL,
  `tipo_pessoa` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `ramal` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `endereco_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fornecedors`
--

INSERT INTO `fornecedors` (`id`, `tipo_pessoa`, `nome`, `documento`, `telefone`, `ramal`, `celular`, `email`, `site`, `endereco_id`, `created_at`, `updated_at`) VALUES
(1, 'F', 'Fornecedor 1', '', '', '', '', '', '', 1, '2017-10-22 18:50:01', '2017-10-22 18:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `orcamentos`
--

CREATE TABLE `orcamentos` (
  `id` bigint(20) NOT NULL,
  `emissao` datetime DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` decimal(6,2) DEFAULT NULL,
  `fornecedor_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `fornecedor_id`, `created_at`, `updated_at`) VALUES
(1, 'Meia', 'Meia', '2.00', 1, '2017-10-22 18:50:05', '2017-10-22 18:50:05'),
(2, 'Calça', 'Calça', '1.00', 1, '2017-10-22 18:50:18', '2017-10-22 18:50:18'),
(3, 'Camisa', 'Camisa', '4.00', 1, '2017-10-22 18:50:28', '2017-10-22 18:50:28'),
(4, 'Meia', NULL, NULL, NULL, '2017-10-29 15:45:20', '2017-10-29 15:45:20'),
(5, 'Meia', NULL, NULL, NULL, '2017-10-29 15:56:08', '2017-10-29 15:56:08'),
(6, 'Meia', NULL, NULL, NULL, '2017-10-29 16:51:22', '2017-10-29 16:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `produto_orcamentos`
--

CREATE TABLE `produto_orcamentos` (
  `id` bigint(20) NOT NULL,
  `produto_id` bigint(20) DEFAULT NULL,
  `orcamento_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produto_vendas`
--

CREATE TABLE `produto_vendas` (
  `id` bigint(20) NOT NULL,
  `produto_id` bigint(20) DEFAULT NULL,
  `venda_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produto_vendas`
--

INSERT INTO `produto_vendas` (`id`, `produto_id`, `venda_id`) VALUES
(1, 4, 6),
(2, 5, 7),
(3, 6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20170917192134'),
('20170917192413'),
('20170917192938'),
('20170917193120'),
('20170917193340'),
('20170917193506'),
('20170917194037'),
('20170918193843'),
('20170918193908'),
('20170918194136'),
('20171028212217'),
('20171028212220'),
('20171028213302'),
('20171028213306');

-- --------------------------------------------------------

--
-- Table structure for table `vendas`
--

CREATE TABLE `vendas` (
  `id` bigint(20) NOT NULL,
  `data` datetime DEFAULT NULL,
  `preco_total` decimal(6,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendas`
--

INSERT INTO `vendas` (`id`, `data`, `preco_total`, `status`, `cliente_id`, `created_at`, `updated_at`) VALUES
(1, '2017-10-22 16:32:00', '200.00', 0, 1, '2017-10-22 18:32:43', '2017-10-22 18:32:43'),
(2, '2017-10-29 14:06:00', '100.00', 0, 1, '2017-10-29 14:06:29', '2017-10-29 14:06:29'),
(3, '2017-10-29 15:36:00', '111.00', 0, 1, '2017-10-29 15:36:10', '2017-10-29 15:36:47'),
(4, '2017-10-29 15:38:00', '999.00', 0, 1, '2017-10-29 15:38:31', '2017-10-29 15:38:31'),
(5, '2017-10-29 15:39:00', '888.00', 0, 1, '2017-10-29 15:39:37', '2017-10-29 15:39:37'),
(6, '2017-10-29 15:45:00', '3333.00', 0, 1, '2017-10-29 15:45:20', '2017-10-29 15:45:20'),
(7, '2017-10-29 15:56:00', '66.00', 0, 1, '2017-10-29 15:56:08', '2017-10-29 15:56:08'),
(8, '2017-10-29 16:51:00', '123.00', 0, 1, '2017-10-29 16:51:22', '2017-10-29 16:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `venda_caixas`
--

CREATE TABLE `venda_caixas` (
  `id` bigint(20) NOT NULL,
  `venda_id` bigint(20) DEFAULT NULL,
  `caixa_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `caixas`
--
ALTER TABLE `caixas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_clientes_on_endereco_id` (`endereco_id`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fornecedors`
--
ALTER TABLE `fornecedors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_fornecedors_on_endereco_id` (`endereco_id`);

--
-- Indexes for table `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_orcamentos_on_cliente_id` (`cliente_id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_produtos_on_fornecedor_id` (`fornecedor_id`);

--
-- Indexes for table `produto_orcamentos`
--
ALTER TABLE `produto_orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_produto_orcamentos_on_orcamento_id` (`orcamento_id`) USING BTREE,
  ADD KEY `index_produto_orcamentos_on_produto_id` (`produto_id`) USING BTREE;

--
-- Indexes for table `produto_vendas`
--
ALTER TABLE `produto_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_produto_vendas_on_produto_id` (`produto_id`) USING BTREE,
  ADD KEY `index_produto_vendas_on_venda_id` (`venda_id`) USING BTREE;

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_vendas_on_cliente_id` (`cliente_id`);

--
-- Indexes for table `venda_caixas`
--
ALTER TABLE `venda_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_venda_caixas_on_caixa_id` (`caixa_id`) USING BTREE,
  ADD KEY `index_venda_caixas_on_venda_id` (`venda_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caixas`
--
ALTER TABLE `caixas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fornecedors`
--
ALTER TABLE `fornecedors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `orcamentos`
--
ALTER TABLE `orcamentos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `produto_orcamentos`
--
ALTER TABLE `produto_orcamentos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produto_vendas`
--
ALTER TABLE `produto_vendas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `venda_caixas`
--
ALTER TABLE `venda_caixas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_rails_dd8c0b6cbd` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`);

--
-- Constraints for table `fornecedors`
--
ALTER TABLE `fornecedors`
  ADD CONSTRAINT `fk_rails_9e65bcae7a` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`);

--
-- Constraints for table `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD CONSTRAINT `fk_rails_6bbdcd64be` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Constraints for table `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_rails_5bd1ca51a7` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`);

--
-- Constraints for table `produto_orcamentos`
--
ALTER TABLE `produto_orcamentos`
  ADD CONSTRAINT `orcamentos_produtos_fk` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `produtos_orcamentos_fk` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`);

--
-- Constraints for table `produto_vendas`
--
ALTER TABLE `produto_vendas`
  ADD CONSTRAINT `produtos_vendas_fk` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `vendas_produtos_fk` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`);

--
-- Constraints for table `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_rails_bad5fec6e4` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Constraints for table `venda_caixas`
--
ALTER TABLE `venda_caixas`
  ADD CONSTRAINT `caixas_venda_fk` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`),
  ADD CONSTRAINT `vendas_caixas_fk` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`);
