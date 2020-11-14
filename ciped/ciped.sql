-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Sam 14 Novembre 2020 à 16:00
-- Version du serveur :  5.7.31-0ubuntu0.18.04.1
-- Version de PHP :  7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ciped`
--

-- --------------------------------------------------------

--
-- Structure de la table `borne`
--

CREATE TABLE `borne` (
  `borne_id` int(11) NOT NULL,
  `dispo_borne` tinyint(1) NOT NULL,
  `id_station` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `borne`
--

INSERT INTO `borne` (`borne_id`, `dispo_borne`, `id_station`) VALUES
(1, 1, 1),
(2, 0, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 0, 1),
(8, 1, 1),
(9, 1, 1),
(10, 0, 1),
(11, 0, 2),
(12, 0, 2),
(13, 0, 2),
(14, 1, 2),
(15, 0, 2),
(16, 0, 2),
(17, 0, 2),
(18, 1, 2),
(19, 0, 2),
(20, 0, 2),
(21, 1, 3),
(22, 1, 3),
(23, 1, 3),
(24, 1, 3),
(25, 1, 3),
(26, 0, 3),
(27, 0, 3),
(28, 0, 3),
(29, 0, 3),
(30, 0, 3),
(31, 1, 4),
(32, 1, 4),
(33, 1, 4),
(34, 1, 4),
(35, 1, 4),
(36, 0, 4),
(37, 0, 4),
(38, 0, 4),
(39, 0, 4),
(40, 0, 4),
(41, 0, 5),
(42, 1, 5),
(43, 1, 5),
(44, 1, 5),
(45, 1, 5),
(46, 0, 5),
(47, 0, 5),
(48, 1, 5),
(49, 0, 5),
(50, 1, 5),
(51, 1, 6),
(52, 1, 6),
(53, 1, 6),
(54, 1, 6),
(55, 1, 6),
(56, 1, 6),
(57, 1, 6),
(58, 0, 6),
(59, 0, 6),
(60, 1, 6),
(61, 1, 7),
(62, 1, 7),
(63, 1, 7),
(64, 1, 7),
(65, 1, 7),
(66, 1, 7),
(67, 1, 7),
(68, 0, 7),
(69, 0, 7),
(70, 0, 7),
(71, 0, 8),
(72, 0, 8),
(73, 0, 8),
(74, 1, 8),
(75, 1, 8),
(76, 0, 8),
(77, 0, 8),
(78, 0, 8),
(79, 1, 8),
(80, 0, 8),
(81, 1, 9),
(82, 0, 9),
(83, 1, 9),
(84, 0, 9),
(85, 1, 9),
(86, 0, 9),
(87, 0, 9),
(88, 0, 9),
(89, 0, 9),
(90, 0, 9),
(91, 1, 10),
(92, 0, 10),
(93, 1, 10),
(94, 1, 10),
(95, 1, 10),
(96, 0, 10),
(97, 0, 10),
(98, 0, 10),
(99, 0, 10),
(100, 0, 10);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `velo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cb` int(20) NOT NULL,
  `code_resa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `velo_id`, `user_id`, `cb`, `code_resa`) VALUES
(17, 8, 22, 888, 762);

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

CREATE TABLE `station` (
  `id_station` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `station`
--

INSERT INTO `station` (`id_station`, `x`, `y`) VALUES
(1, 150, 100),
(2, 500, 100),
(3, 800, 100),
(4, 50, 350),
(5, 350, 350),
(6, 650, 350),
(7, 950, 350),
(8, 150, 600),
(9, 500, 600),
(10, 800, 600);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `pseudo`, `mdp`) VALUES
(19, '', 'min', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(21, '', 'ffff', 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(22, '', 'geoff', 'geo', '40bd001563085fc35165329ea1ff5c5ecbdbbeef');

-- --------------------------------------------------------

--
-- Structure de la table `velo`
--

CREATE TABLE `velo` (
  `velo_id` int(11) NOT NULL,
  `borne_id` int(11) NOT NULL,
  `etat_velo` tinyint(1) NOT NULL,
  `usure_velo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `velo`
--

INSERT INTO `velo` (`velo_id`, `borne_id`, `etat_velo`, `usure_velo`) VALUES
(1, 6, 1, 0),
(2, 1, 1, 0),
(3, 3, 1, 0),
(4, 9, 1, 0),
(5, 5, 1, 0),
(6, 67, 1, 0),
(7, 48, 1, 0),
(8, 33, 1, 0),
(9, 14, 1, 0),
(10, 8, 1, 0),
(11, 21, 1, 0),
(12, 22, 1, 0),
(13, 23, 1, 0),
(14, 24, 1, 0),
(15, 25, 1, 0),
(16, 31, 1, 0),
(17, 32, 1, 0),
(18, 50, 1, 0),
(19, 34, 1, 0),
(20, 35, 1, 0),
(21, 4, 1, 0),
(22, 42, 1, 0),
(23, 43, 1, 0),
(24, 44, 1, 0),
(25, 45, 1, 0),
(26, 51, 1, 0),
(27, 52, 1, 0),
(28, 53, 1, 0),
(29, 54, 1, 0),
(30, 55, 1, 0),
(31, 61, 1, 0),
(32, 62, 1, 0),
(33, 63, 1, 0),
(34, 64, 1, 0),
(35, 65, 1, 0),
(36, 66, 1, 0),
(37, 56, 1, 0),
(38, 57, 1, 0),
(39, 74, 1, 0),
(40, 75, 1, 0),
(41, 81, 1, 0),
(42, 60, 1, 0),
(43, 83, 1, 0),
(44, 18, 1, 0),
(45, 85, 1, 0),
(46, 91, 1, 0),
(47, 79, 1, 0),
(48, 93, 1, 0),
(49, 94, 1, 0),
(50, 95, 1, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `borne`
--
ALTER TABLE `borne`
  ADD PRIMARY KEY (`borne_id`),
  ADD KEY `fk_id_station` (`id_station`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_velo_id` (`velo_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Index pour la table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id_station`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `velo`
--
ALTER TABLE `velo`
  ADD PRIMARY KEY (`velo_id`),
  ADD KEY `fk_borne_id` (`borne_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `borne`
--
ALTER TABLE `borne`
  MODIFY `borne_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `station`
--
ALTER TABLE `station`
  MODIFY `id_station` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `velo`
--
ALTER TABLE `velo`
  MODIFY `velo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `borne`
--
ALTER TABLE `borne`
  ADD CONSTRAINT `fk_id_station` FOREIGN KEY (`id_station`) REFERENCES `station` (`id_station`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `fk_velo_id` FOREIGN KEY (`velo_id`) REFERENCES `velo` (`velo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `velo`
--
ALTER TABLE `velo`
  ADD CONSTRAINT `fk_borne_id` FOREIGN KEY (`borne_id`) REFERENCES `borne` (`borne_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
