-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 24 jan. 2024 à 15:25
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS Cinema;
USE Cinema; 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cimena`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `changeValuePlace`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeValuePlace` (IN `reference_of_id_place` INT(2))   BEGIN
SELECT places.id_place, places.reference, places.etat FROM places INNER JOIN reservations ON places.id_place = reference_of_id_place AND places.etat = 1 GROUP BY places.reference;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nb_personnes` int NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `prenom`, `nb_personnes`) VALUES
(1, 'Dupont', 'Jean', 2),
(2, 'Martin', 'Sophie', 3),
(3, 'Doe', 'John', 1),
(4, 'Leclerc', 'Marie', 4),
(5, 'Girard', 'Pierre', 2);

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_film`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `films`
--

INSERT INTO `films` (`id_film`, `nom`, `description`) VALUES
(1, 'Avatar 2', 'Avatar: La Voie de l’eau est un film de science-fiction américain réalisé par James Cameron, sorti en 2022. James Cameron a coécrit le scénario avec Rick Jaffa et Amanda Silver, à partir d’une histoire que le trio a développée avec Josh Friedman et Shane Salerno. Produit par les sociétés Lightstorm Entertainment et TSG Entertainment et distribué par The Walt Disney Company par le biais de 20th Century Studios, il s’agit de la suite du premier film de la franchise Avatar. Les acteurs Sam Worthington, Zoe Saldaña, Stephen Lang, Joel David Moore, CCH Pounder, Giovanni Ribisi, Dileep Rao et Matt Gerald reprennent leurs rôles du film original, tandis que Sigourney Weaver revient dans un rôle différent. De nouveaux acteurs intègrent la distribution, dont Kate Winslet, Cliff Curtis, Edie Falco et Jemaine Clement. Dans le film, le Na’vi Jake Sully et sa famille, soumis à une nouvelle menace humaine, cherchent refuge auprès du clan Metkayina de Pandora.'),
(2, 'The Batman', 'The Batman, ou Le Batman au Québec, est un film américain d\'action et de super-héros réalisé par Matt Reeves, sorti en 2022. Il s\'agit du neuvième film centré sur le personnage de Batman créé par Bob Kane et Bill Finger. Il ne fait pas partie de l\'univers cinématographique DC, comme un temps annoncé, mais est implémenté dans le DC Elseworlds.'),
(3, 'Conjuring 3', 'Conjuring: Sous l\'emprise du Diable ou La Conjuration: Sous l\'emprise du diable au Québec est un film d\'horreur américain réalisé par Michael Chaves et sorti en 2021. Il s\'agit du huitième film de l\'univers Conjuring et du troisième de la série principale, après Conjuring: Les Dossiers Warren et Conjuring 2: Le Cas Enfield.'),
(4, 'Sept Vies', 'Hanté d\'avoir causé un accident de voiture tuant sa femme sur le coup, Ben Thomas est au bord de la dépression. Il se présente comme agent du fisc, cherche sa rédemption en transformant radicalement la vie de 7 personnes qu\'il ne connaît pas. Une fois son plan mis en place, plus rien ne pourra l\'arrêter. C\'est tout du moins ce qu\'il croit. Mais Ben n\'avait pas prévu qu\'il tomberait amoureux de l\'une de ces personnes, Emily Posa, une jeune femme malade du cœur dont les jours sont comptés, et c\'est elle qui va le transformer…');

-- --------------------------------------------------------

--
-- Structure de la table `films_seances`
--

DROP TABLE IF EXISTS `films_seances`;
CREATE TABLE IF NOT EXISTS `films_seances` (
  `id_fs` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `id_seance` int NOT NULL,
  PRIMARY KEY (`id_fs`),
  KEY `id_client` (`id_client`),
  KEY `id_seance` (`id_seance`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `films_seances`
--

INSERT INTO `films_seances` (`id_fs`, `id_client`, `id_seance`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE IF NOT EXISTS `places` (
  `id_place` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(2) NOT NULL,
  `id_salle` int NOT NULL,
  `etat` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_place`),
  KEY `id_salle` (`id_salle`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `places`
--

INSERT INTO `places` (`id_place`, `reference`, `id_salle`, `etat`) VALUES
(1, 'A1', 1, 1),
(2, 'B2', 2, 1),
(3, 'C3', 3, 0),
(4, 'D4', 4, 0),
(5, 'E5', 5, 1),
(6, 'A1', 2, 0),
(7, 'A1', 3, 0),
(8, 'A1', 3, 0),
(9, 'A1', 4, 0),
(10, 'A1', 5, 0),
(11, 'B2', 1, 0),
(12, 'B2', 3, 0),
(13, 'B2', 4, 0),
(14, 'B2', 5, 0),
(15, 'C3', 1, 0),
(16, 'C3', 2, 0),
(17, 'C3', 4, 0),
(18, 'C3', 5, 0),
(19, 'D4', 1, 0),
(20, 'D4', 2, 0),
(21, 'D4', 3, 0),
(22, 'D4', 5, 0),
(23, 'E5', 1, 0),
(24, 'E5', 2, 0),
(25, 'E5', 3, 0),
(26, 'E5', 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `id_place` int NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_client` (`id_client`),
  KEY `id_place` (`id_place`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id_reservation`, `id_client`, `id_place`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 5),
(5, 4, 3);

--
-- Déclencheurs `reservations`
--
DROP TRIGGER IF EXISTS `changes`;
DELIMITER $$
CREATE TRIGGER `changes` AFTER INSERT ON `reservations` FOR EACH ROW BEGIN
    UPDATE places SET etat = 0 WHERE id_place = NEW.id_place;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

DROP TABLE IF EXISTS `salles`;
CREATE TABLE IF NOT EXISTS `salles` (
  `id_salle` int NOT NULL AUTO_INCREMENT,
  `etat` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `salles`
--

INSERT INTO `salles` (`id_salle`, `etat`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `seances`
--

DROP TABLE IF EXISTS `seances`;
CREATE TABLE IF NOT EXISTS `seances` (
  `id_seance` int NOT NULL AUTO_INCREMENT,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `id_film` int NOT NULL,
  `id_salle` int NOT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `id_film` (`id_film`),
  KEY `id_salle` (`id_salle`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `seances`
--

INSERT INTO `seances` (`id_seance`, `date_debut`, `date_fin`, `id_film`, `id_salle`) VALUES
(1, '2024-01-24 10:00:00', '2024-01-24 12:00:00', 1, 2),
(2, '2024-01-24 14:00:00', '2024-01-24 16:00:00', 1, 2),
(3, '2024-01-24 18:00:00', '2024-01-24 20:00:00', 1, 2),
(4, '2024-01-24 10:00:00', '2024-01-24 12:00:00', 2, 4),
(5, '2024-01-24 14:00:00', '2024-01-24 16:00:00', 2, 4),
(6, '2024-01-24 18:00:00', '2024-01-24 20:00:00', 2, 4),
(7, '2024-01-24 10:00:00', '2024-01-24 12:00:00', 3, 1),
(8, '2024-01-24 14:00:00', '2024-01-24 16:00:00', 3, 1),
(9, '2024-01-24 18:00:00', '2024-01-24 20:00:00', 3, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
