CREATE TABLE MAGASIN(
    nom_magasin varchar(255) primary key not null, 
    adresse varchar(255) not null unique,
    numero varchar(255) not null unique,
    jours_ouverture varchar(255) not null,
    date_creation DATE

);

CREATE TABLE  JEU(
    titre_jeu varchar(255) not null, 
    date_lancement DATE not null,
    nom_console varchar(255) not null,
    série varchar(255),
    catégorie_jeu varchar(255),
    clasification_age char(1) not null,
    prix decimal not null
);

CREATE TABLE AUTRE_MARCHANDISE(
    type_marchandise varchar(255),
    date_peremption date,
    nom_produit varchar(255) not null,
    prix decimal not null

);

CREATE TABLE CONSOLE( 
    nom_console varchar(255) not null, 
    date_lancement date,
    fps_max int, 
    prix decimal not null,
    marque varchar(255) not null
    
);


ALTER TABLE CONSOLE 
    ADD  nom_magasin varchar(255);
    
ALTER TABLE CONSOLE    
 ADD  FOREIGN KEY(nom_magasin) REFERENCES MAGASIN(nom_magasin); 

ALTER TABLE JEU
    ADD  nom_magasin varchar(255);

ALTER TABLE JEU
    ADD  FOREIGN KEY(nom_magasin) REFERENCES MAGASIN(nom_magasin); 
    
ALTER TABLE AUTRE_MARCHANDISE
    ADD  nom_magasin varchar(255);    
    
ALTER TABLE AUTRE_MARCHANDISE
    ADD  FOREIGN KEY(nom_magasin) REFERENCES MAGASIN(nom_magasin); 
    
 INSERT INTO MAGASIN(nom_magasin, adresse, numero, jours_ouverture, date_creation)
    VALUES('ei games','23425 saint-laurent','514-456-7563','Lundi à Vendredi', '1997-10-22');

 INSERT INTO MAGASIN(nom_magasin, adresse, numero, jours_ouverture, date_creation)
    VALUES('Jeux en masse','56782 henri-bourrasa','514-789-6042','Mercredi, Vendredi,Lundi', '1990-05-31'); 
    
 INSERT INTO MAGASIN(nom_magasin, adresse, numero, jours_ouverture, date_creation)
    VALUES('Jeux bruno','12345 acadie','514-898-1895','Lundi a Samedi','2004-02-07');
    
INSERT INTO CONSOLE (nom_console, date_lancement, fps_max, prix, marque, nom_magasin)
    VALUES ('PS5', '2020-03-15', 120,'600','Sony','Jeux bruno');
    
INSERT INTO CONSOLE (nom_console, date_lancement, fps_max, prix, marque, nom_magasin)
    VALUES ('PS5',  '2020-03-15' , 120,'600','Sony','Jeux en masse');
    
INSERT INTO CONSOLE (nom_console, date_lancement, fps_max, prix, marque, nom_magasin)
    VALUES ('Switch', '2017-04-03' , 60,'400','Sony','Jeux bruno');
    
INSERT INTO CONSOLE (nom_console, date_lancement, fps_max, prix, marque, nom_magasin)
    VALUES ('Xbox', '2020-01-04', 120,'500','microsoft','ei games');    
    
INSERT INTO JEU (titre_jeu, date_lancement, nom_console, série, catégorie_jeu,clasification_age, prix, nom_magasin)
    VALUES ('Call of duty mw2', '2022-10-17','PS5','Call of Duty','shooter','M',90,'Jeux bruno');
    
INSERT INTO JEU (titre_jeu, date_lancement, nom_console, série, catégorie_jeu,clasification_age, prix, nom_magasin)
    VALUES ('Call of duty mw2', '2022-10-17','PS5','Call of Duty','shooter','M',90,'ei games');
     
INSERT INTO JEU (titre_jeu, date_lancement, nom_console, série, catégorie_jeu,clasification_age, prix, nom_magasin)
    VALUES ('Tears of the kingdom', '2023-05-12','Switch','Zelda','aventure','T',90,'Jeux bruno');     
    
INSERT INTO JEU (titre_jeu, date_lancement, nom_console, catégorie_jeu,clasification_age, prix, nom_magasin)
    VALUES ('Starfield', '2023-10-17', 'Xbox', 'RPG','M',90,'Jeux en masse');    

INSERT INTO JEU (titre_jeu, date_lancement, nom_console, série, catégorie_jeu,clasification_age, prix, nom_magasin)
    VALUES ('Mario Kart deluxe', '2018-10-01','Switch','Mario Kart','Course','E',90,'Jeux bruno');
    
INSERT INTO autre_marchandise(type_marchandise, date_peremption, nom_produit, prix, nom_magasin)
    VALUES ('bonbon','2023-11-15', 'MandM',5,'ei games');
    
INSERT INTO autre_marchandise(type_marchandise, nom_produit, prix, nom_magasin)
    VALUES ('Chandail', 'Chandail nintendo',20,'Jeux en masse');    
    `
    
SELECT*
FROM autre_marchandise;

SELECT*
FROM JEU

SELECT* 
FROM MAGASIN

SELECT*
FROM CONSOLE

connect sys/oracle as sysdba

CREATE USER RESTSCOTT IDENTIFIED BY oracle DEFAULT TABLESPACE
users QUOTA UNLIMITED ON users;

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE,
CREATE VIEW, CREATE SEQUENCE, CREATE TRIGGER,
COMMENT ANY TABLE TO RESTSCOTT;

grant dba to RESTSCOTT;

GRANT INHERIT PRIVILEGES ON USER SCOTT TO RESTSCOTT

BEGIN
 ORDS.enable_schema(
 p_enabled => TRUE,
 p_schema => 'SCOTT',
 p_url_mapping_type => 'BASE_PATH',
 p_url_mapping_pattern => 'hr2', --premiere partie url pour interroger les données
 p_auto_rest_auth => FALSE
 );
 COMMIT;
END;
/

BEGIN
 ORDS.enable_object(
 p_enabled => TRUE, -- Default  { TRUE | FALSE }
 p_schema => 'SCOTT',
 p_object => 'AUTRE_MARCHANDISE',
 p_object_type => 'TABLE', -- Default  { TABLE | VIEW }
 p_object_alias => 'AUTREMARCHANDISE'
 );
 COMMIT;
END;
/

BEGIN
 ORDS.enable_object(
 p_enabled => TRUE, -- Default  { TRUE | FALSE }
 p_schema => 'SCOTT',
 p_object => 'CONSOLE',
 p_object_type => 'TABLE', -- Default  { TABLE | VIEW }
 p_object_alias => 'CONSOLE'
 );
 COMMIT;
END;
/

BEGIN
 ORDS.enable_object(
 p_enabled => TRUE, -- Default  { TRUE | FALSE }
 p_schema => 'SCOTT',
 p_object => 'JEU',
 p_object_type => 'TABLE', -- Default  { TABLE | VIEW }
 p_object_alias => 'JEU'
 );
 COMMIT;
END;
/

BEGIN
 ORDS.enable_object(
 p_enabled => TRUE, -- Default  { TRUE | FALSE }
 p_schema => 'SCOTT',
 p_object => 'MAGASIN',
 p_object_type => 'TABLE', -- Default  { TABLE | VIEW }
 p_object_alias => 'MAGASIN'
 );
 COMMIT;
END;
/

