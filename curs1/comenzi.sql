USE js2324;
SHOW TABLES;
SELECT  * FROM jsusers;


CREATE TABLE `demo2324`.`contact` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
    `nume` VARCHAR(100) NOT NULL , 
    `prenume` VARCHAR(100) NOT NULL ,
    `telefon` CHAR(10) NULL , 
    `email` VARCHAR(250) NOT NULL ,
    `mesaj` TEXT NOT NULL , 
    `data_adaugare` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
    PRIMARY KEY (`id`), UNIQUE `telefon` (`telefon`), UNIQUE `email` (`email`)) ENGINE = InnoDB;
    
    
    ALTER TABLE `contact` ADD `sex` ENUM('m','n','f') NOT NULL DEFAULT 'n' AFTER `mesaj`;
    
    
    INSERT INTO `contact` (`id`, `nume`, `prenume`, `telefon`, `email`, `mesaj`, `sex`, `data_adaugare`) VALUES (NULL, 'Adiaconitei', SHA1('Adrian'), '1234567890', 'demo@demo.com', 'Mesaj de test', 'm', current_timestamp());
    
    
    UPDATE contact SET nume = 'Adiaconitei3', prenume='Adrian3' WHERE id = 1;
    
    
    Expand Requery Edit Bookmark Database : demo2324 Queried time : 20:20:12
INSERT INTO `contact` (`id`, `nume`, `prenume`, `telefon`, `email`, `mesaj`, `sex`, `data_adaugare`) VALUES (NULL, 'Adiaconitei', SHA1('Adrian'), '1234567890', 'demo@demo.com', 'Mesaj de test', 'm', current_timestamp());
SELECT * FROM `contact`
DELETE FROM `demo2324`.`contact`
SELECT * FROM `contact`
INSERT INTO `contact` (`id`, `nume`, `prenume`, `telefon`, `email`, `mesaj`, `sex`, `data_adaugare`) VALUES (NULL, 'Adiaconitei2', 'Adrian2', '3455666544', 'aaa@aa.com', 'Mesaj demo2', 'm', current_timestamp());
SELECT * FROM `contact`
TRUNCATE TABLE `demo2324`.`contact`
SELECT * FROM `contact`
INSERT INTO `contact` (`id`, `nume`, `prenume`, `telefon`, `email`, `mesaj`, `sex`, `data_adaugare`) VALUES (NULL, 'Adrian3', 'Adrian3', '3455666544', 'aaaa@aaa.ro', 'mesaj', 'm', current_timestamp());
SELECT * FROM `contact`
SELECT * FROM `contact`
UPDATE `contact` SET `nume` = 'Adiaconitei' WHERE `contact`.`id` = 1;
UPDATE contact SET nume = 'Adiaconitei3', prenume='Adrian3' WHERE id = 1;
SELECT * FROM `contact`
INSERT INTO `contact` (`id`, `nume`, `prenume`, `telefon`, `email`, `mesaj`, `sex`, `data_adaugare`) VALUES (NULL, 'Popescu', 'Ion', '4455666544', 'ion@ion.ro', 'mesaj', 'm', current_timestamp());
SELECT * FROM `contact`
-- DELETE FROM contact WHERE id = 3;;
SELECT nume,prenume FROM `contact`;
DELETE FROM contact WHERE id = 3;
SELECT * FROM `contact`
    
    