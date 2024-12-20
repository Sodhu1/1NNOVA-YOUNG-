-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Dic 20, 2024 alle 07:27
-- Versione del server: 8.0.30
-- Versione PHP: 8.0.22

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
-- Struttura della tabella `Aziende`
--

CREATE TABLE `Aziende` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Indirizzo` varchar(100) NOT NULL,
  `Foto` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'img/defaultPF.png',
  `Descrizione` varchar(250) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Aziende`
--

INSERT INTO `Aziende` (`ID`, `Nome`, `Indirizzo`, `Foto`, `Descrizione`, `Email`, `Password`) VALUES
(1, 'Maccad\'s & co', 'Via dei debiti', 'img/defaultPF.png', 'Ci occupiamo della compra/vendita di immobili a panama', 'Maccad@gmail.com', 'fb0f550544aa04ecb873c6c19e8faa493e470b3a0d7329cef40cf1d7292d875d56fc1c26a9e8cc10a2dc381c5f305bb1217c2a1f7ea861bd90e54849c939e6be'),
(2, 'Samantha\'s Company', 'Via della ninna', 'img/defaultPF.png', 'Mi occupo della produzione di software per la gestione del sonno', 'samantha@gmail.com', '9437b92c69f75ac149c721d710d58598f4b6049e953683341123ef2954975471b43b3ec6e4b1e37221ff086d7a75bf572dac1c31ccc7cd6616f9801f270eaf0a'),
(3, 'Fermi SRL', 'Siamo di fermo', 'img/FotoAziende/fermi.jpeg', 'Ci occupiamo della vendita di immobili', 'fermi@gmail.com', '24df4b5d6f4f287844b757e53bef3403d0d4d976e0b7e126536521a3418d09c90c2f7e95d800722944760ff7ca6bad8435f4052797b8b5cd9e0db88419b622cc');

-- --------------------------------------------------------

--
-- Struttura della tabella `Categorie`
--

CREATE TABLE `Categorie` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descrizione` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `CategorieAziende`
--

CREATE TABLE `CategorieAziende` (
  `ID` int NOT NULL,
  `ID_Azienda` int NOT NULL,
  `ID_Categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `CategorieStudente`
--

CREATE TABLE `CategorieStudente` (
  `ID` int NOT NULL,
  `ID_Categoria` int NOT NULL,
  `ID_Studente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Corsi`
--

CREATE TABLE `Corsi` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descrizione` varchar(120) NOT NULL,
  `MaxPersone` int NOT NULL,
  `Durata` int NOT NULL,
  `ID_Azienda` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `CorsoStudente`
--

CREATE TABLE `CorsoStudente` (
  `ID` int NOT NULL,
  `ID_Studente` int NOT NULL,
  `ID_Corso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Esperienze`
--

CREATE TABLE `Esperienze` (
  `ID` int NOT NULL,
  `ID_Azienda` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descrizione` varchar(250) NOT NULL,
  `MaxPersone` int NOT NULL,
  `Durata` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Follow`
--

CREATE TABLE `Follow` (
  `ID` int NOT NULL,
  `ID_Studente` int NOT NULL,
  `ID_Azienda` int NOT NULL,
  `DaStudente` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Provincie`
--

CREATE TABLE `Provincie` (
  `ID` int NOT NULL,
  `Provincia` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `citta` varchar(60) NOT NULL,
  `Sigla` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Provincie`
--

INSERT INTO `Provincie` (`ID`, `Provincia`, `citta`, `Sigla`) VALUES
(1, 'Agrigento', 'Agrigento', 'AG'),
(2, 'Ancona', 'Ancona', 'AN'),
(3, 'Aosta', 'Aosta', 'AO'),
(4, 'Bari', 'Bari', 'BA'),
(5, 'Bologna', 'Bologna', 'BO'),
(6, 'Cagliari', 'Cagliari', 'CA'),
(7, 'Campobasso', 'Campobasso', 'CB'),
(8, 'Catanzaro', 'Catanzaro', 'CZ'),
(9, 'Firenze', 'Firenze', 'FI'),
(10, 'Genova', 'Genova', 'GE'),
(11, 'Milano', 'Milano', 'MI'),
(12, 'Napoli', 'Napoli', 'NA'),
(13, 'Palermo', 'Palermo', 'PA'),
(14, 'Roma', 'Roma', 'RM'),
(15, 'Torino', 'Torino', 'TO'),
(16, 'Venezia', 'Venezia', 'VE'),
(17, 'Verona', 'Verona', 'VR');

-- --------------------------------------------------------

--
-- Struttura della tabella `Scuole`
--

CREATE TABLE `Scuole` (
  `Meccanografico` varchar(10) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `citta` varchar(60) NOT NULL,
  `provincia` varchar(60) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `Foto` varchar(70) NOT NULL DEFAULT 'img/defaultPF.png',
  `Email` varchar(60) NOT NULL,
  `Password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `StoricoCorsi`
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
-- Struttura della tabella `StoricoEsperienze`
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
-- Struttura della tabella `Studenti`
--

CREATE TABLE `Studenti` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Cognome` varchar(60) NOT NULL,
  `Descrizione` varchar(250) NOT NULL,
  `Foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'img/defaultPF.png',
  `Interno` tinyint NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `Telefono` int NOT NULL,
  `ID_Tutori` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Studenti`
--

INSERT INTO `Studenti` (`ID`, `Nome`, `Cognome`, `Descrizione`, `Foto`, `Interno`, `Email`, `Password`, `Telefono`, `ID_Tutori`) VALUES
(1, 'Diego', 'Maccad', 'Il primo della classe sceso da Anor Londo solo per voi, le terre dei lord', 'img/FotoStudenti/diego_maccad.jpeg', 1, 'Maccad@gmail.com', 'fb0f550544aa04ecb873c6c19e8faa493e470b3a0d7329cef40cf1d7292d875d56fc1c26a9e8cc10a2dc381c5f305bb1217c2a1f7ea861bd90e54849c939e6be', 351744938, NULL),
(2, 'Samantha', 'Ricci', 'studio informatica da quando sono bambino', 'img/FotoStudenti/samantha.jpeg', 1, 'samantha@gmail.com', 'manna', 234457755, NULL),
(3, 'Manuele', 'Marino', 'la meccanica mi appassiona più di ogni altra cosa', 'img/FotoStudenti/manu.jpeg', 1, 'manu@gmail.com', 'cc91a915a069a3128851e968e31027c82f23b1fd72f152e556038e9cef1a361bf6067fb45716ca1c8d43217dd07b5fac914a52c7333797498b2d0660623307fe', 347645784, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `Tutor`
--

CREATE TABLE `Tutor` (
  `ID` int NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Cognome` varchar(60) NOT NULL,
  `Foto` varchar(70) NOT NULL DEFAULT 'img/defaultPF.png',
  `Email` varchar(60) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `Telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `TutorScuole`
--

CREATE TABLE `TutorScuole` (
  `ID` int NOT NULL,
  `ID_Tutor` int NOT NULL,
  `Meccanografico_Scuola` varchar(10) NOT NULL,
  `Specializzazione` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Aziende`
--
ALTER TABLE `Aziende`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `CategorieAziende`
--
ALTER TABLE `CategorieAziende`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Azienda` (`ID_Azienda`,`ID_Categoria`),
  ADD KEY `ID_Azienda_2` (`ID_Azienda`,`ID_Categoria`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indici per le tabelle `CategorieStudente`
--
ALTER TABLE `CategorieStudente`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Categoria` (`ID_Categoria`,`ID_Studente`),
  ADD KEY `ID_Categoria_2` (`ID_Categoria`,`ID_Studente`),
  ADD KEY `ID_Studente` (`ID_Studente`);

--
-- Indici per le tabelle `Corsi`
--
ALTER TABLE `Corsi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Azienda` (`ID_Azienda`);

--
-- Indici per le tabelle `CorsoStudente`
--
ALTER TABLE `CorsoStudente`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Studente_2` (`ID_Studente`,`ID_Corso`),
  ADD KEY `ID_Studente` (`ID_Studente`,`ID_Corso`),
  ADD KEY `ID_Corso` (`ID_Corso`);

--
-- Indici per le tabelle `Esperienze`
--
ALTER TABLE `Esperienze`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Azienda` (`ID_Azienda`);

--
-- Indici per le tabelle `Follow`
--
ALTER TABLE `Follow`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Studente` (`ID_Studente`,`ID_Azienda`,`DaStudente`),
  ADD KEY `ID_Studente_2` (`ID_Studente`,`ID_Azienda`),
  ADD KEY `ID_Azienda` (`ID_Azienda`);

--
-- Indici per le tabelle `Provincie`
--
ALTER TABLE `Provincie`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `Scuole`
--
ALTER TABLE `Scuole`
  ADD PRIMARY KEY (`Meccanografico`);

--
-- Indici per le tabelle `StoricoCorsi`
--
ALTER TABLE `StoricoCorsi`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Scuola_2` (`Meccanografico_Scuola`,`ID_Corso`,`AnnoScolastico`),
  ADD KEY `ID_Scuola` (`Meccanografico_Scuola`,`ID_Corso`),
  ADD KEY `ID_Corso` (`ID_Corso`);

--
-- Indici per le tabelle `StoricoEsperienze`
--
ALTER TABLE `StoricoEsperienze`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Studente_2` (`ID_Studente`,`ID_Esperienza`,`Anno`),
  ADD KEY `ID_Studente` (`ID_Studente`,`ID_Esperienza`),
  ADD KEY `ID_Esperienza` (`ID_Esperienza`);

--
-- Indici per le tabelle `Studenti`
--
ALTER TABLE `Studenti`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Tutori` (`ID_Tutori`);

--
-- Indici per le tabelle `Tutor`
--
ALTER TABLE `Tutor`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `TutorScuole`
--
ALTER TABLE `TutorScuole`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Tutor_2` (`ID_Tutor`,`Meccanografico_Scuola`,`Specializzazione`),
  ADD KEY `ID_Tutor` (`ID_Tutor`),
  ADD KEY `ID_Scuola` (`Meccanografico_Scuola`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Aziende`
--
ALTER TABLE `Aziende`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `CategorieAziende`
--
ALTER TABLE `CategorieAziende`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `CategorieStudente`
--
ALTER TABLE `CategorieStudente`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Corsi`
--
ALTER TABLE `Corsi`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `CorsoStudente`
--
ALTER TABLE `CorsoStudente`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Esperienze`
--
ALTER TABLE `Esperienze`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Follow`
--
ALTER TABLE `Follow`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Provincie`
--
ALTER TABLE `Provincie`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `StoricoCorsi`
--
ALTER TABLE `StoricoCorsi`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `StoricoEsperienze`
--
ALTER TABLE `StoricoEsperienze`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Studenti`
--
ALTER TABLE `Studenti`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `Tutor`
--
ALTER TABLE `Tutor`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `TutorScuole`
--
ALTER TABLE `TutorScuole`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `CategorieAziende`
--
ALTER TABLE `CategorieAziende`
  ADD CONSTRAINT `CategorieAziende_ibfk_1` FOREIGN KEY (`ID_Azienda`) REFERENCES `Aziende` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CategorieAziende_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categorie` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `CategorieStudente`
--
ALTER TABLE `CategorieStudente`
  ADD CONSTRAINT `CategorieStudente_ibfk_1` FOREIGN KEY (`ID_Studente`) REFERENCES `Studenti` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Corsi`
--
ALTER TABLE `Corsi`
  ADD CONSTRAINT `Corsi_ibfk_1` FOREIGN KEY (`ID_Azienda`) REFERENCES `Aziende` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `CorsoStudente`
--
ALTER TABLE `CorsoStudente`
  ADD CONSTRAINT `CorsoStudente_ibfk_1` FOREIGN KEY (`ID_Studente`) REFERENCES `Studenti` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CorsoStudente_ibfk_2` FOREIGN KEY (`ID_Corso`) REFERENCES `StoricoCorsi` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Esperienze`
--
ALTER TABLE `Esperienze`
  ADD CONSTRAINT `Esperienze_ibfk_1` FOREIGN KEY (`ID_Azienda`) REFERENCES `Aziende` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Follow`
--
ALTER TABLE `Follow`
  ADD CONSTRAINT `Follow_ibfk_1` FOREIGN KEY (`ID_Studente`) REFERENCES `Studenti` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Follow_ibfk_2` FOREIGN KEY (`ID_Azienda`) REFERENCES `Aziende` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `StoricoCorsi`
--
ALTER TABLE `StoricoCorsi`
  ADD CONSTRAINT `StoricoCorsi_ibfk_1` FOREIGN KEY (`Meccanografico_Scuola`) REFERENCES `Scuole` (`Meccanografico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `StoricoCorsi_ibfk_2` FOREIGN KEY (`ID_Corso`) REFERENCES `Corsi` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `StoricoEsperienze`
--
ALTER TABLE `StoricoEsperienze`
  ADD CONSTRAINT `StoricoEsperienze_ibfk_1` FOREIGN KEY (`ID_Esperienza`) REFERENCES `Esperienze` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `StoricoEsperienze_ibfk_2` FOREIGN KEY (`ID_Studente`) REFERENCES `Studenti` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Studenti`
--
ALTER TABLE `Studenti`
  ADD CONSTRAINT `Studenti_ibfk_1` FOREIGN KEY (`ID_Tutori`) REFERENCES `Tutor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `TutorScuole`
--
ALTER TABLE `TutorScuole`
  ADD CONSTRAINT `TutorScuole_ibfk_1` FOREIGN KEY (`Meccanografico_Scuola`) REFERENCES `Scuole` (`Meccanografico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TutorScuole_ibfk_2` FOREIGN KEY (`ID_Tutor`) REFERENCES `Tutor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
