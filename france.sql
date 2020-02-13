--Afficher tout le contenu de la table regions.
SELECT `nom_region` FROM `regions`
ORDER BY `nom_region` ASC;

--Afficher tous les departements de France par ordre alphabétique.
SELECT `nom_dep`, `dep` FROM `departements`
ORDER BY `nom_dep` ASC;

--Afficher toutes les villes ayant comme département le 60 en ordonnant avec le code postal.
SELECT `ville` FROM `villes`
WHERE `dep` = 60
ORDER BY `cp` ASC;

--Afficher les 3 premières villes ayant comme code postal "60400" et en ordonnant par ordre alphabétique.
SELECT `ville` FROM `villes`
WHERE `cp` = 60400
ORDER BY `ville` ASC
LIMIT 3;

--Afficher toutes les villes contenant le mot "saint".
SELECT `ville` FROM `villes`
WHERE `ville` LIKE 'saint%'
ORDER BY `ville` ASC;

--Afficher le nombre de villes par département. (Le nom des départments doit aparaitre)
SELECT `nom_dep`, COUNT(`villes`.`ville`) FROM `departements`
INNER JOIN `villes` ON `departements`.`dep` = `villes`.`dep`
GROUP BY `nom_dep`
ORDER BY COUNT(`villes`.`ville`) ASC;

--Afficher les villes ayant comme région "Picardie".
SELECT `ville` FROM `villes`
INNER JOIN `regions` ON `villes`.`region` = `regions`.`region`
WHERE `regions`.`nom_region` = 'Picardie'
ORDER BY `ville` ASC;

--Afficher le nombre de villes par départment et par région. (Le nom des départments et des régions doivent aparaitre).
SELECT `regions`.`nom_region`, COUNT(`villes`.`ville`) FROM `regions`
INNER JOIN `villes` ON `regions`.`region` = `villes`.`region`
INNER JOIN `departements` ON `regions`.`region` = `departements`.`region`
GROUP BY `nom_region`, `nom_dep`
SELECT `nom_dep`, COUNT(`villes`.`ville`) FROM `departements`
INNER JOIN `villes` ON `departements`.`dep` = `villes`.`dep`
GROUP BY `nom_dep`
ORDER BY COUNT(`villes`.`ville`) ASC;




SELECT `regions`.`nom_region`,COUNT(`villes`.`ville`), `departements`.`nom_dep`, COUNT(`villes`.`ville`) FROM `regions`
INNER JOIN `departements` ON `regions`.`region` = `departements`.`region`
INNER JOIN `villes` ON `departements`.`dep` = `villes`.`dep`
GROUP BY `regions`.`nom_region`, `departements`.`nom_dep`
ORDER BY `regions`.`nom_region` ASC;
