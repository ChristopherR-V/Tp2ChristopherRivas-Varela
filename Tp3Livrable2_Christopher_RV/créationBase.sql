CREATE TABLE MAGASIN(
    nom_magasin varchar(255) primary key not null, 
    adresse varchar(255) not null unique,
    numero varchar(255) not null unique,
    jours_ouverture varchar(255) not null,
    date_creation DATE

);

CREATE TABLE  JEU(
    titre_jeu varchar(255) primary key not null, 
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
    nom_produit varchar(255) primary key not null,
    prix decimal not null

);

CREATE TABLE CONSOLE( 
    nom_console varchar(255) primary key not null, 
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
    VALUES('ei games','23425 saint-laurent',514-456-7563);

 INSERT INTO MAGASIN(nom_magasin, adresse, numero, jours_ouverture, date_creation)
    VALUES('Jeux en masse','56782 henri-bourrasa',514-789-6042); 
    
 INSERT INTO MAGASIN(nom_magasin, adresse, numero, jours_ouverture, date_creation)
    VALUES('Jeux bruno','12345 acadie',514-898-1895)    
    
    
