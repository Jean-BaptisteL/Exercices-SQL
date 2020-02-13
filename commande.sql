--Connexion à mysql
--mysql -u root -p
--Créer une base de données du nom de languages
CREATE DATABASE `languages`;
--Créer une base de données qui s'appelle web Development et avec un encodage utf-8
CREATE DATABASE `webDevelopment` CHARACTER SET 'utf8';
--Créer une base de données frameworks avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS `frameworks` CHARACTER SET 'utf8';
--Créer une base de données languages avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS `languages` CHARACTER SET 'utf8';
--Supprimer la base de données languages.
DROP DATABASE `languages`;
--Supprimer la base de données frameworks si elle existe.
DROP DATABASE IF EXISTS `frameworks`;
--Supprimer la base de données languages si elle existe.
DROP DATABASE IF EXISTS `languages`;
--Sélectionner une database avant de créer ou de modifier des tables :
USE `nom_de_la_base_de_données`;
--Dans la base de données webDevelopment, créer la table languages avec les colonnes :
    --id (type INT, auto-incrémenté, clé primaire)
    --language (type VARCHAR)
CREATE TABLE `nom_de_la_table` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `language` VARCHAR(100)
);
--Dans la base de données webDevelopment, ajouter à la table languages une colonne versions (VARCHAR).
ALTER TABLE `nom_de_la_table`
ADD COLUMN `nom_de_la_colonne` VARCHAR(100);
--Dans la base de données webDevelopment, dans la table languages renommer la colonne versions en version.
ALTER TABLE `nom_de_la_table`
CHANGE `ancien_nom` `nouveau_nom` description_colonne;
--Dans la base de données webDevelopment, dans la table frameworks changer le type de la colonne version en VARCHAR de taille 10.
ALTER TABLE `frameworks`
MODIFY `version` VARCHAR(10);
--Dans la base codex, dans la table clients :
    --supprimer la colonne secondPhoneNumber
    --renommer la colonne firstPhoneNumber en phoneNumber
    --changer le type de la colonne phoneNumber en VARCHAR
    --ajouter les colonnes zipCode(VARCHAR) et city(VARCHAR)
ALTER TABLE `codex` DROP COLUMN `secondPhoneNumber`;
ALTER TABLE `codex` CHANGE COLUMN `firstPhoneNumber` `phoneNumber` INT;
ALTER TABLE `codex` MODIFY `phoneNumber` VARCHAR(255);
ALTER TABLE `codex` ADD COLUMN `zipCode` VARCHAR(255);
ALTER TABLE `codex` ADD COLUMN `city` VARCHAR(255);
--Insérez les données suivantes dans la table languages de la base webDevelopment :
    --JavaScript, version 5
    --PHP, version 5.2
    --PHP, version 5.4
    --HTML, version 5.1
    --JavaScript, version 6
    --JavaScript, version 7
    --JavaScript, version 8
    --PHP, version 7
INSERT INTO `languages` VALUES (1, 'JavaScript','5'),
(2, 'PHP', '5.2'),
(3, 'PHP', '5.4'),
(4, 'HTML', '5.1'),
(5, 'JavaScript', '6'),
(6, 'JavaScript', '7'),
(7, 'JavaScript', '8'),
(8, 'PHP', '7');
--Insérez les données suivantes dans la table frameworks de la base webDevelopment :
    --Symfony, version 2.8
    --Symfony, version 3
    --Jquery, version 1.6
    --Jquery, version 2.10
INSERT INTO `frameworks` VALUES (1, 'Symphony', '2.8'),
(2, 'Symphony', '3'),
(3, 'JQuery', '1.6'),
(4, 'JQuery', '2.10');
--Dans la table languages, afficher toutes les données de la table.
SELECT * FROM `languages`;
--Dans la table languages, afficher toutes les versions de PHP.
SELECT `version` FROM `languages` WHERE `language`='PHP';
--Dans la table languages, afficher toutes les versions de PHP et de JavaScript.
SELECT `version` FROM `languages` WHERE `language`='PHP' || `language`='JavaScript';
--Dans la table languages, afficher toutes les lignes ayant pour id 3,5,7.
SELECT * FROM `languages` WHERE `id` IN (3,5,7);
--Dans la table languages,afficher les deux première entrées de JavaScript.
SELECT *
FROM `languages`
WHERE `language`='JavaScript'
ORDER BY `id` LIMIT 2;
--Dans la table languages, afficher toutes les lignes qui ne sont pas du PHP
SELECT * FROM `languages` WHERE `language`!='PHP';
SELECT * FROM `languages` WHERE `language`<>'PHP';
--Dans la table languages,afficher toutes les données par ordre alphabétique.
SELECT * FROM `languages` ORDER BY `language` ASC;
--Dans la table frameworks, afficher toutes les données de la table ayant une version 2.x (x étant un numéro quelconque).
SELECT * FROM `frameworks` WHERE `version` LIKE '2.%';
--Dans la table ide, afficher toutes les lignes ayant une date comprise entre le premier janvier 2010 et le 31 decembre 2011.
SELECT * FROM `ide` WHERE `date` BETWEEN '2010-01-01' AND '2011-12-31';
--Dans la table languages, supprimer toutes les lignes parlant de HTML.
DELETE FROM `languages`
WHERE `language` = 'HTML';
--Dans la table frameworks, modifier toutes les lignes ayant le framework Symfony par Symfony2.
UPDATE `frameworks`
SET `framework` = 'Symphony2'
WHERE `framework` = 'Symphony';
--Dans la table languages, modifier la ligne du langage JavaScript version 5 par la version 5.1
UPDATE `languages`
SET `version` = '5.1'
WHERE `language` = 'JavaScript' AND `version` = '5';
--Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework l'afficher aussi.
SELECT `languages`.`name`, `frameworks`.`name` FROM `languages`
LEFT JOIN `frameworks` ON `languages`.`id`=`frameworks`.`languagesId`;
--Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework ne pas l'afficher.
SELECT `languages`.`name`, `frameworks`.`name` FROM `languages`
INNER JOIN `frameworks` ON `languages`.`id`=`frameworks`.`languagesId`;
--Afficher le nombre de framework qu'a un langage.
SELECT `languages`.`name`, COUNT(`frameworks`.`name`) FROM `languages`
INNER JOIN `frameworks` ON `languages`.`id`=`frameworks`.`languagesId`
GROUP BY `languages`.`name`
ORDER BY COUNT(`frameworks`.`name`) ASC;
--Afficher les langages ayant plus de 3 frameworks.
SELECT `languages`.`name`, COUNT(`frameworks`.`name`) FROM `languages`
INNER JOIN `frameworks` ON `languages`.`id`=`frameworks`.`languagesId`
GROUP BY `languages`.`name`
HAVING COUNT(`frameworks`.`name`) > 3
ORDER BY COUNT(`frameworks`.`name`) ASC;
