-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 25. lis 2025, 18:16
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `fotbal`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `adresa`
--

CREATE TABLE `adresa` (
  `id_adresa` int(11) NOT NULL,
  `ulice` varchar(50) NOT NULL,
  `cislo_popisne` varchar(20) NOT NULL,
  `psc` varchar(15) DEFAULT NULL,
  `id_mesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `adresa`
--

INSERT INTO `adresa` (`id_adresa`, `ulice`, `cislo_popisne`, `psc`, `id_mesto`) VALUES
(1, 'Sadová', '12', '74601', 1),
(2, 'Hlavní', '45', '74755', 2),
(3, 'Polní', '78', '74601', 3),
(4, 'Školní', '3', '74761', 4),
(5, 'Na Výsluní', '22', '74901', 5),
(6, 'Lipová', '10', '74741', 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `hrac`
--

CREATE TABLE `hrac` (
  `id_hrac` int(11) NOT NULL,
  `jmeno` varchar(50) NOT NULL,
  `prijmeni` varchar(50) NOT NULL,
  `datum_narozeni` date NOT NULL,
  `pohlavi` enum('M','F') DEFAULT NULL,
  `id_klub` int(11) NOT NULL,
  `id_kategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `hrac`
--

INSERT INTO `hrac` (`id_hrac`, `jmeno`, `prijmeni`, `datum_narozeni`, `pohlavi`, `id_klub`, `id_kategorie`) VALUES
(1, 'Jan', 'Novák', '2004-03-15', 'M', 1, 1),
(2, 'Petr', 'Svoboda', '2003-07-20', 'M', 2, 1),
(3, 'Ondřej', 'Kovář', '2008-01-10', 'M', 3, 2),
(4, 'Martin', 'Dvořák', '2009-11-05', 'M', 3, 2),
(5, 'Tomáš', 'Král', '2011-04-09', 'M', 4, 3),
(6, 'Jakub', 'Procházka', '2014-09-12', 'M', 5, 4),
(7, 'Lukáš', 'Beneš', '2016-08-22', 'M', 6, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `kategorie`
--

CREATE TABLE `kategorie` (
  `id_kategorie` int(11) NOT NULL,
  `nazev` varchar(50) NOT NULL,
  `rocnik_od` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `kategorie`
--

INSERT INTO `kategorie` (`id_kategorie`, `nazev`, `rocnik_od`) VALUES
(1, 'Muži A', '1970'),
(2, 'Dorost', '2007'),
(3, 'Starší žáci', '2011'),
(4, 'Mladší žáci', '2013'),
(5, 'Přípravka', '2015');

-- --------------------------------------------------------

--
-- Struktura tabulky `klub`
--

CREATE TABLE `klub` (
  `id_klub` int(11) NOT NULL,
  `nazev` varchar(255) NOT NULL,
  `id_mesto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `klub`
--

INSERT INTO `klub` (`id_klub`, `nazev`, `id_mesto`) VALUES
(1, 'TJ Chvalíkovice', 1),
(2, 'Slavia Opava', 2),
(3, 'Oldřišov', 3),
(4, 'TJ Raduň', 4),
(5, 'Vítkov', 5),
(6, 'Skřípov', 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `mesto`
--

CREATE TABLE `mesto` (
  `id_mesto` int(11) NOT NULL,
  `nazev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `mesto`
--

INSERT INTO `mesto` (`id_mesto`, `nazev`) VALUES
(1, 'Chvalíkovice'),
(3, 'Oldřišov'),
(2, 'Opava'),
(4, 'Raduň'),
(6, 'Skřípov'),
(5, 'Vítkov');

-- --------------------------------------------------------

--
-- Struktura tabulky `soutez`
--

CREATE TABLE `soutez` (
  `id_soutez` int(11) NOT NULL,
  `nazev` varchar(50) NOT NULL,
  `typ` enum('liga','turnaj','pohár') NOT NULL,
  `id_kategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `soutez`
--

INSERT INTO `soutez` (`id_soutez`, `nazev`, `typ`, `id_kategorie`) VALUES
(1, 'Okresní přebor mužů', 'liga', 1),
(2, 'Okresní přebor dorostu', 'liga', 2),
(3, 'Okresní přebor starších žáků', 'liga', 3),
(4, 'Pohár mladších žáků', 'pohár', 4),
(5, 'Turnaj přípravek', 'turnaj', 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `stadion`
--

CREATE TABLE `stadion` (
  `id_stadion` int(11) NOT NULL,
  `id_adresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `stadion`
--

INSERT INTO `stadion` (`id_stadion`, `id_adresa`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `zapas`
--

CREATE TABLE `zapas` (
  `id_zapas` int(11) NOT NULL,
  `id_soutez` int(11) NOT NULL,
  `id_stadion` int(11) NOT NULL,
  `id_domaci_klub` int(11) NOT NULL,
  `id_hoste_klub` int(11) NOT NULL,
  `datum` date NOT NULL,
  `cas` time NOT NULL,
  `skore_domaci` int(11) NOT NULL,
  `skore_hoste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `zapas`
--

INSERT INTO `zapas` (`id_zapas`, `id_soutez`, `id_stadion`, `id_domaci_klub`, `id_hoste_klub`, `datum`, `cas`, `skore_domaci`, `skore_hoste`) VALUES
(1, 1, 1, 1, 2, '2025-09-10', '16:30:00', 2, 1),
(2, 1, 3, 3, 5, '2025-10-11', '15:30:00', 4, 2),
(3, 2, 2, 2, 6, '2025-11-11', '10:00:00', 1, 0),
(4, 4, 5, 5, 6, '2025-11-15', '13:00:00', 0, 4),
(5, 5, 3, 3, 1, '2025-12-05', '14:30:00', 1, 3),
(6, 4, 6, 6, 3, '2025-12-16', '10:00:00', 2, 3);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `adresa`
--
ALTER TABLE `adresa`
  ADD PRIMARY KEY (`id_adresa`),
  ADD KEY `id_mesto` (`id_mesto`);

--
-- Indexy pro tabulku `hrac`
--
ALTER TABLE `hrac`
  ADD PRIMARY KEY (`id_hrac`),
  ADD KEY `id_klub` (`id_klub`),
  ADD KEY `id_kategorie` (`id_kategorie`),
  ADD KEY `jmeno_hrace` (`jmeno`,`prijmeni`);

--
-- Indexy pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id_kategorie`),
  ADD UNIQUE KEY `nazev_kategorie` (`nazev`) USING BTREE;

--
-- Indexy pro tabulku `klub`
--
ALTER TABLE `klub`
  ADD PRIMARY KEY (`id_klub`),
  ADD UNIQUE KEY `nazev_klubu` (`nazev`) USING BTREE,
  ADD KEY `id_mesto` (`id_mesto`);

--
-- Indexy pro tabulku `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`id_mesto`),
  ADD UNIQUE KEY `nazev_mesto` (`nazev`);

--
-- Indexy pro tabulku `soutez`
--
ALTER TABLE `soutez`
  ADD PRIMARY KEY (`id_soutez`),
  ADD KEY `id_kategorie` (`id_kategorie`);

--
-- Indexy pro tabulku `stadion`
--
ALTER TABLE `stadion`
  ADD PRIMARY KEY (`id_stadion`),
  ADD KEY `id_adresa` (`id_adresa`);

--
-- Indexy pro tabulku `zapas`
--
ALTER TABLE `zapas`
  ADD PRIMARY KEY (`id_zapas`),
  ADD KEY `id_soutez` (`id_soutez`),
  ADD KEY `id_stadion` (`id_stadion`),
  ADD KEY `id_domaci_klub` (`id_domaci_klub`),
  ADD KEY `id_hoste_klub` (`id_hoste_klub`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `adresa`
--
ALTER TABLE `adresa`
  MODIFY `id_adresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `hrac`
--
ALTER TABLE `hrac`
  MODIFY `id_hrac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id_kategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `klub`
--
ALTER TABLE `klub`
  MODIFY `id_klub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `mesto`
--
ALTER TABLE `mesto`
  MODIFY `id_mesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `soutez`
--
ALTER TABLE `soutez`
  MODIFY `id_soutez` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `stadion`
--
ALTER TABLE `stadion`
  MODIFY `id_stadion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `zapas`
--
ALTER TABLE `zapas`
  MODIFY `id_zapas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `adresa`
--
ALTER TABLE `adresa`
  ADD CONSTRAINT `adresa_ibfk_1` FOREIGN KEY (`id_mesto`) REFERENCES `mesto` (`id_mesto`);

--
-- Omezení pro tabulku `hrac`
--
ALTER TABLE `hrac`
  ADD CONSTRAINT `hrac_ibfk_1` FOREIGN KEY (`id_klub`) REFERENCES `klub` (`id_klub`),
  ADD CONSTRAINT `hrac_ibfk_2` FOREIGN KEY (`id_kategorie`) REFERENCES `kategorie` (`id_kategorie`);

--
-- Omezení pro tabulku `klub`
--
ALTER TABLE `klub`
  ADD CONSTRAINT `klub_ibfk_1` FOREIGN KEY (`id_mesto`) REFERENCES `mesto` (`id_mesto`);

--
-- Omezení pro tabulku `soutez`
--
ALTER TABLE `soutez`
  ADD CONSTRAINT `soutez_ibfk_1` FOREIGN KEY (`id_kategorie`) REFERENCES `kategorie` (`id_kategorie`);

--
-- Omezení pro tabulku `stadion`
--
ALTER TABLE `stadion`
  ADD CONSTRAINT `stadion_ibfk_2` FOREIGN KEY (`id_adresa`) REFERENCES `adresa` (`id_adresa`);

--
-- Omezení pro tabulku `zapas`
--
ALTER TABLE `zapas`
  ADD CONSTRAINT `zapas_ibfk_1` FOREIGN KEY (`id_soutez`) REFERENCES `soutez` (`id_soutez`),
  ADD CONSTRAINT `zapas_ibfk_2` FOREIGN KEY (`id_stadion`) REFERENCES `stadion` (`id_stadion`),
  ADD CONSTRAINT `zapas_ibfk_3` FOREIGN KEY (`id_domaci_klub`) REFERENCES `klub` (`id_klub`),
  ADD CONSTRAINT `zapas_ibfk_4` FOREIGN KEY (`id_hoste_klub`) REFERENCES `klub` (`id_klub`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
