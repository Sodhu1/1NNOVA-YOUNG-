-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2024 at 11:24 PM
-- Server version: 8.0.30
-- PHP Version: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_sodhu`
--

-- --------------------------------------------------------

--
-- Table structure for table `Azienda`
--

CREATE TABLE `Azienda` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Indirizzo` varchar(100) NOT NULL,
  `Foto` varchar(70) NOT NULL,
  `Descrizione` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Categorie`
--

CREATE TABLE `Categorie` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descrizione` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CategorieAziende`
--

CREATE TABLE `CategorieAziende` (
  `ID` int NOT NULL,
  `ID_Azienda` int NOT NULL,
  `ID_Categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CategorieStudente`
--

CREATE TABLE `CategorieStudente` (
  `ID` int NOT NULL,
  `ID_Categoria` int NOT NULL,
  `ID_Studente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Corsi`
--

CREATE TABLE `Corsi` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descrizione` varchar(120) NOT NULL,
  `Foto` varchar(100) NOT NULL,
  `Durata` int NOT NULL,
  `ID_Azienda` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CorsoStudente`
--

CREATE TABLE `CorsoStudente` (
  `ID` int NOT NULL,
  `ID_Studente` int NOT NULL,
  `ID_Corso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Esperienze`
--

CREATE TABLE `Esperienze` (
  `ID` int NOT NULL,
  `ID_Azienda` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descrizione` varchar(250) NOT NULL,
  `MaxPersone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Follow`
--

CREATE TABLE `Follow` (
  `ID` int NOT NULL,
  `ID_Studente` int NOT NULL,
  `ID_Azienda` int NOT NULL,
  `DaStudente` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Scuole`
--

CREATE TABLE `Scuole` (
  `Meccanografico` varchar(10) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `citta` varchar(60) NOT NULL,
  `provincia` varchar(60) NOT NULL,
  `indirizzo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StoricoCorsi`
--

CREATE TABLE `StoricoCorsi` (
  `ID` int NOT NULL,
  `Meccanografico_Scuola` varchar(10) NOT NULL,
  `ID_Corso` int NOT NULL,
  `Inizio` date NOT NULL,
  `Fine` date NOT NULL,
  `AnnoScolastico` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StoricoEsperienze`
--

CREATE TABLE `StoricoEsperienze` (
  `ID` int NOT NULL,
  `ID_Studente` int NOT NULL,
  `ID_Esperienza` int NOT NULL,
  `Inizio` date NOT NULL,
  `Fine` date NOT NULL,
  `Anno` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Studente`
--

CREATE TABLE `Studente` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Cognome` varchar(60) NOT NULL,
  `Foto` varchar(100) NOT NULL,
  `Interno` tinyint NOT NULL,
  `Email` int NOT NULL,
  `Telefono` int NOT NULL,
  `ID_Tutori` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tutor`
--

CREATE TABLE `Tutor` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Cognome` varchar(60) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TutorScuole`
--

CREATE TABLE `TutorScuole` (
  `ID` int NOT NULL,
  `ID_Tutor` int NOT NULL,
  `Meccanografico_Scuola` varchar(10) NOT NULL,
  `Specializzazione` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Azienda`
--
ALTER TABLE `Azienda`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `CategorieAziende`
--
ALTER TABLE `CategorieAziende`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Azienda` (`ID_Azienda`,`ID_Categoria`),
  ADD KEY `ID_Azienda_2` (`ID_Azienda`,`ID_Categoria`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indexes for table `CategorieStudente`
--
ALTER TABLE `CategorieStudente`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Categoria` (`ID_Categoria`,`ID_Studente`),
  ADD KEY `ID_Categoria_2` (`ID_Categoria`,`ID_Studente`),
  ADD KEY `ID_Studente` (`ID_Studente`);

--
-- Indexes for table `Corsi`
--
ALTER TABLE `Corsi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Azienda` (`ID_Azienda`);

--
-- Indexes for table `CorsoStudente`
--
ALTER TABLE `CorsoStudente`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Studente_2` (`ID_Studente`,`ID_Corso`),
  ADD KEY `ID_Studente` (`ID_Studente`,`ID_Corso`),
  ADD KEY `ID_Corso` (`ID_Corso`);

--
-- Indexes for table `Esperienze`
--
ALTER TABLE `Esperienze`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Azienda` (`ID_Azienda`);

--
-- Indexes for table `Follow`
--
ALTER TABLE `Follow`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Studente` (`ID_Studente`,`ID_Azienda`,`DaStudente`),
  ADD KEY `ID_Studente_2` (`ID_Studente`,`ID_Azienda`),
  ADD KEY `ID_Azienda` (`ID_Azienda`);

--
-- Indexes for table `Scuole`
--
ALTER TABLE `Scuole`
  ADD PRIMARY KEY (`Meccanografico`);

--
-- Indexes for table `StoricoCorsi`
--
ALTER TABLE `StoricoCorsi`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Scuola_2` (`Meccanografico_Scuola`,`ID_Corso`,`AnnoScolastico`),
  ADD KEY `ID_Scuola` (`Meccanografico_Scuola`,`ID_Corso`),
  ADD KEY `ID_Corso` (`ID_Corso`);

--
-- Indexes for table `StoricoEsperienze`
--
ALTER TABLE `StoricoEsperienze`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Studente_2` (`ID_Studente`,`ID_Esperienza`,`Anno`),
  ADD KEY `ID_Studente` (`ID_Studente`,`ID_Esperienza`),
  ADD KEY `ID_Esperienza` (`ID_Esperienza`);

--
-- Indexes for table `Studente`
--
ALTER TABLE `Studente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Tutori` (`ID_Tutori`);

--
-- Indexes for table `Tutor`
--
ALTER TABLE `Tutor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TutorScuole`
--
ALTER TABLE `TutorScuole`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Tutor_2` (`ID_Tutor`,`Meccanografico_Scuola`,`Specializzazione`),
  ADD KEY `ID_Tutor` (`ID_Tutor`),
  ADD KEY `ID_Scuola` (`Meccanografico_Scuola`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Azienda`
--
ALTER TABLE `Azienda`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CategorieAziende`
--
ALTER TABLE `CategorieAziende`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CategorieStudente`
--
ALTER TABLE `CategorieStudente`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Corsi`
--
ALTER TABLE `Corsi`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CorsoStudente`
--
ALTER TABLE `CorsoStudente`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Esperienze`
--
ALTER TABLE `Esperienze`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Follow`
--
ALTER TABLE `Follow`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `StoricoCorsi`
--
ALTER TABLE `StoricoCorsi`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `StoricoEsperienze`
--
ALTER TABLE `StoricoEsperienze`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Studente`
--
ALTER TABLE `Studente`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tutor`
--
ALTER TABLE `Tutor`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TutorScuole`
--
ALTER TABLE `TutorScuole`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Azienda`
--
ALTER TABLE `Azienda`
  ADD CONSTRAINT `Azienda_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Corsi` (`ID_Azienda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD CONSTRAINT `Categorie_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `CategorieStudente` (`ID_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CategorieAziende`
--
ALTER TABLE `CategorieAziende`
  ADD CONSTRAINT `CategorieAziende_ibfk_1` FOREIGN KEY (`ID_Azienda`) REFERENCES `Azienda` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CategorieAziende_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categorie` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CategorieStudente`
--
ALTER TABLE `CategorieStudente`
  ADD CONSTRAINT `CategorieStudente_ibfk_1` FOREIGN KEY (`ID_Studente`) REFERENCES `Studente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CorsoStudente`
--
ALTER TABLE `CorsoStudente`
  ADD CONSTRAINT `CorsoStudente_ibfk_1` FOREIGN KEY (`ID_Studente`) REFERENCES `Studente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CorsoStudente_ibfk_2` FOREIGN KEY (`ID_Corso`) REFERENCES `StoricoCorsi` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Esperienze`
--
ALTER TABLE `Esperienze`
  ADD CONSTRAINT `Esperienze_ibfk_1` FOREIGN KEY (`ID_Azienda`) REFERENCES `Azienda` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Follow`
--
ALTER TABLE `Follow`
  ADD CONSTRAINT `Follow_ibfk_1` FOREIGN KEY (`ID_Studente`) REFERENCES `Studente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Follow_ibfk_2` FOREIGN KEY (`ID_Azienda`) REFERENCES `Azienda` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Scuole`
--
ALTER TABLE `Scuole`
  ADD CONSTRAINT `Scuole_ibfk_1` FOREIGN KEY (`Meccanografico`) REFERENCES `TutorScuole` (`Meccanografico_Scuola`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `StoricoCorsi`
--
ALTER TABLE `StoricoCorsi`
  ADD CONSTRAINT `StoricoCorsi_ibfk_1` FOREIGN KEY (`Meccanografico_Scuola`) REFERENCES `Scuole` (`Meccanografico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `StoricoCorsi_ibfk_2` FOREIGN KEY (`ID_Corso`) REFERENCES `Corsi` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `StoricoEsperienze`
--
ALTER TABLE `StoricoEsperienze`
  ADD CONSTRAINT `StoricoEsperienze_ibfk_1` FOREIGN KEY (`ID_Esperienza`) REFERENCES `Esperienze` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Studente`
--
ALTER TABLE `Studente`
  ADD CONSTRAINT `Studente_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `StoricoEsperienze` (`ID_Studente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Tutor`
--
ALTER TABLE `Tutor`
  ADD CONSTRAINT `Tutor_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `TutorScuole` (`ID_Tutor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `TutorScuole`
--
ALTER TABLE `TutorScuole`
  ADD CONSTRAINT `TutorScuole_ibfk_1` FOREIGN KEY (`ID_Tutor`) REFERENCES `Tutor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
