-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03-Nov-2015 às 19:23
-- Versão do servidor: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibliotecamusical`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL,
  `nomealb` varchar(45) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `artista_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `artista`
--

CREATE TABLE IF NOT EXISTS `artista` (
  `id` int(11) NOT NULL,
  `nomeart` varchar(100) NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `artista`
--

INSERT INTO `artista` (`id`, `nomeart`, `genero_id`) VALUES
(1, 'Oficina G3', 2),
(2, 'shonlock', 2),
(3, 'lecrae', 4),
(6, 'marvin', 8),
(7, 'mali', 9),
(8, 'jonathan', 10),
(9, 'tedashii', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `id` int(11) NOT NULL,
  `nomegen` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`id`, `nomegen`) VALUES
(1, 'rock'),
(2, 'hiphop'),
(3, 'samba'),
(4, 'rap'),
(8, 'pop'),
(9, 'jazz'),
(10, 'soul'),
(11, 'forro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `musica`
--

CREATE TABLE IF NOT EXISTS `musica` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `nota` int(11) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_album_artista1_idx` (`artista_id`);

--
-- Indexes for table `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_artista_genero_idx` (`genero_id`);

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `musica`
--
ALTER TABLE `musica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_musica_album1_idx` (`album_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `artista`
--
ALTER TABLE `artista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `musica`
--
ALTER TABLE `musica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `fk_album_artista1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `artista`
--
ALTER TABLE `artista`
  ADD CONSTRAINT `fk_artista_genero` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `musica`
--
ALTER TABLE `musica`
  ADD CONSTRAINT `fk_musica_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
