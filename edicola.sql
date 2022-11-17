-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 17, 2022 alle 12:36
-- Versione del server: 10.4.25-MariaDB
-- Versione PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edicola`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `abbonamenti`
--

CREATE TABLE `abbonamenti` (
  `cliente` varchar(50) NOT NULL,
  `rivista` varchar(20) NOT NULL,
  `dataA` date NOT NULL,
  `periodo` varchar(30) NOT NULL,
  `metodo` varchar(30) NOT NULL,
  `costo` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `email` varchar(50) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `inidrizzo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `riviste`
--

CREATE TABLE `riviste` (
  `titolo` varchar(20) NOT NULL,
  `periodicità` varchar(30) NOT NULL,
  `prezzo` decimal(4,2) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `abbonamenti`
--
ALTER TABLE `abbonamenti`
  ADD PRIMARY KEY (`cliente`,`rivista`),
  ADD KEY `rivista` (`rivista`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `riviste`
--
ALTER TABLE `riviste`
  ADD PRIMARY KEY (`titolo`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `abbonamenti`
--
ALTER TABLE `abbonamenti`
  ADD CONSTRAINT `abbonamenti_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clienti` (`email`),
  ADD CONSTRAINT `abbonamenti_ibfk_2` FOREIGN KEY (`rivista`) REFERENCES `riviste` (`titolo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
