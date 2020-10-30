-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  ven. 30 oct. 2020 à 10:45
-- Version du serveur :  5.7.28
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `lms`
--

-- --------------------------------------------------------

--
-- Structure de la table `annee_scolaire`
--

DROP TABLE IF EXISTS `annee_scolaire`;
CREATE TABLE IF NOT EXISTS `annee_scolaire` (
  `id_annee_scolaire` int(11) NOT NULL AUTO_INCREMENT,
  `annee_debut` int(4) NOT NULL,
  `annee_fin` int(4) NOT NULL,
  PRIMARY KEY (`id_annee_scolaire`),
  KEY `id_annee_scolaire` (`id_annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id_document` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  `nom_doc` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `format` varchar(50) NOT NULL,
  `doc` varchar(200) NOT NULL,
  PRIMARY KEY (`id_document`),
  KEY `id_module` (`id_module`),
  KEY `id_module_2` (`id_module`),
  KEY `id_enseignant` (`id_enseignant`),
  KEY `id_enseignant_2` (`id_enseignant`),
  KEY `id_module_3` (`id_module`),
  KEY `id_module_4` (`id_module`,`id_enseignant`),
  KEY `id_module_5` (`id_module`,`id_enseignant`),
  KEY `id_module_6` (`id_module`,`id_enseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `id_enseignant` int(11) NOT NULL AUTO_INCREMENT,
  `id_profil` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `statut` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_enseignant`),
  KEY `id_enseignant` (`id_enseignant`),
  KEY `id_profil` (`id_profil`),
  KEY `id_profil_2` (`id_profil`),
  KEY `id_profil_3` (`id_profil`),
  KEY `id_profil_4` (`id_profil`),
  KEY `id_enseignant_2` (`id_enseignant`),
  KEY `id_profil_5` (`id_profil`),
  KEY `id_profil_6` (`id_profil`),
  KEY `id_profil_7` (`id_profil`),
  KEY `id_module` (`id_module`),
  KEY `id_module_2` (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id_enseignant`, `id_profil`, `id_module`, `statut`) VALUES
(20, 41, 4, 'Tuteur'),
(21, 42, 4, 'Auteur');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int(11) NOT NULL AUTO_INCREMENT,
  `id_profil` int(11) NOT NULL,
  `annee_entree` int(11) NOT NULL,
  PRIMARY KEY (`id_etudiant`),
  KEY `id_profil` (`id_profil`),
  KEY `id_profil_2` (`id_profil`),
  KEY `id_profil_3` (`id_profil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `id_profil`, `annee_entree`) VALUES
(3, 36, 2012);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_chat`
--

DROP TABLE IF EXISTS `groupe_chat`;
CREATE TABLE IF NOT EXISTS `groupe_chat` (
  `id_enseignant` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `nom_groupe` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id_enseignant`,`id_etudiant`),
  KEY `id_etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id_module` int(11) NOT NULL AUTO_INCREMENT,
  `nom_module` varchar(50) NOT NULL,
  `coefficient` int(11) NOT NULL,
  `description` text NOT NULL,
  `niveau` int(11) DEFAULT '2',
  PRIMARY KEY (`id_module`),
  KEY `id_module` (`id_module`),
  KEY `id_module_2` (`id_module`),
  KEY `id_module_3` (`id_module`),
  KEY `id_module_4` (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id_module`, `nom_module`, `coefficient`, `description`, `niveau`) VALUES
(4, 'Java', 6, 'Programmation  JAVA', 2),
(5, 'DAW', 3, 'Developpement web', 3),
(6, 'Réseaux', 3, 'Réseaux', 2),
(7, 'Android', 4, 'Programmation Android', 2);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `interrogation` int(11) NOT NULL,
  `examen` int(11) NOT NULL,
  `moyenne` double NOT NULL,
  PRIMARY KEY (`id_note`),
  KEY `id_module` (`id_module`),
  KEY `id_etudiant` (`id_etudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_note`, `id_module`, `id_etudiant`, `interrogation`, `examen`, `moyenne`) VALUES
(15, 5, 3, 8, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `parcours_scolaire`
--

DROP TABLE IF EXISTS `parcours_scolaire`;
CREATE TABLE IF NOT EXISTS `parcours_scolaire` (
  `id_etudiant` int(11) NOT NULL,
  `id_annee_scolaire` int(11) NOT NULL,
  `niveau_scolaire` int(11) NOT NULL,
  `generale` double NOT NULL,
  PRIMARY KEY (`id_etudiant`,`id_annee_scolaire`),
  KEY `id_etudiant` (`id_etudiant`,`id_annee_scolaire`),
  KEY `id_annee_scolaire` (`id_annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

DROP TABLE IF EXISTS `planning`;
CREATE TABLE IF NOT EXISTS `planning` (
  `id_planning` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_planning`),
  KEY `id_enseignant` (`id_enseignant`),
  KEY `id_enseignant_2` (`id_enseignant`),
  KEY `id_enseignant_3` (`id_enseignant`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `planning`
--

INSERT INTO `planning` (`id_planning`, `id_module`, `id_enseignant`, `heure_debut`, `heure_fin`, `date`, `description`) VALUES
(1, 4, 20, '12:00:00', '13:30:00', '2020-10-27', 'cours');

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `id_profil` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `login` varchar(15) NOT NULL,
  `mp` varchar(15) NOT NULL,
  `nom` varchar(15) NOT NULL,
  `prenom` varchar(15) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `lieu_de_naissance` varchar(50) NOT NULL,
  `sexe` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `photo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_profil`),
  KEY `id_profil` (`id_profil`),
  KEY `id_profil_2` (`id_profil`),
  KEY `id_profil_3` (`id_profil`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`id_profil`, `type`, `login`, `mp`, `nom`, `prenom`, `adresse`, `e_mail`, `date_de_naissance`, `lieu_de_naissance`, `sexe`, `telephone`, `photo`) VALUES
(35, 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', 'Constantine', '', '1980-09-15', 'Constantine', 'Femme', '1242141241', 'espace_client/img/default.png'),
(36, 'Etudiant', 'Etudiant', 'Etudiant', 'Etudiant', 'Etudiant', 'Constantine', '', '1993-05-08', 'Constantine', 'homme', '(077) 323-232232', 'espace_client/img/default.png'),
(41, 'Enseignant', 'Tuteur', 'Tuteur', 'Tuteur', 'Tuteur', '', '', '1956-01-12', 'Constantine', 'homme', '(127) 432-568934', 'espace_client/img/default.png'),
(42, 'Enseignant', 'Auteur', 'Auteur', 'Auteur', 'Auteur', '', '', '1980-04-12', 'Annaba', 'homme', '(574) 575-463452', 'espace_client/img/default.png'),
(43, 'Responsable', 'Responsable', 'Responsable', 'Responsable', 'Responsable', '', '', '1940-04-12', 'Annaba', 'homme', '(241) 241-243455', 'espace_client/img/default.png');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id_question` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) NOT NULL,
  `contenu_question` text NOT NULL,
  `notation` int(11) NOT NULL,
  PRIMARY KEY (`id_question`),
  KEY `id question` (`id_question`),
  KEY `id_test` (`id_test`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id_question`, `id_test`, `contenu_question`, `notation`) VALUES
(134, 44, 'comment ?', 3),
(135, 44, 'Qui ?', 3),
(136, 44, 'pour quoi ?', 3),
(137, 44, 'ou?', 3);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `id_reponse` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `contenu_rep` varchar(150) NOT NULL,
  `valeur` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_reponse`),
  KEY `id_question` (`id_question`),
  KEY `id_question_2` (`id_question`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id_reponse`, `id_test`, `id_question`, `contenu_rep`, `valeur`) VALUES
(25, 44, 134, 'çava', 1),
(26, 44, 134, 'bien', 0),
(27, 44, 134, 'çava pas', 0),
(28, 44, 135, 'moi', 1),
(29, 44, 135, 'toi', 0),
(30, 44, 135, 'nous', 0),
(31, 44, 136, 'comme ça', 1),
(32, 44, 136, 'par ce que', 0),
(33, 44, 136, 'nous', 0),
(34, 44, 137, 'ici', 1),
(35, 44, 137, 'la ba', 0),
(36, 44, 137, 'chez nous', 0);

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id_test` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `nom_test` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id_test`),
  KEY `id_module` (`id_module`),
  KEY `id_module_2` (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `test`
--

INSERT INTO `test` (`id_test`, `id_module`, `nom_test`, `type`) VALUES
(44, 5, 'Test', 'Interrogation');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `document_ibfk_2` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `enseignant_ibfk_1` FOREIGN KEY (`id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `groupe_chat`
--
ALTER TABLE `groupe_chat`
  ADD CONSTRAINT `groupe_chat_ibfk_1` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `groupe_chat_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `parcours_scolaire`
--
ALTER TABLE `parcours_scolaire`
  ADD CONSTRAINT `parcours_scolaire_ibfk_1` FOREIGN KEY (`id_annee_scolaire`) REFERENCES `annee_scolaire` (`id_annee_scolaire`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parcours_scolaire_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `planning_ibfk_1` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
