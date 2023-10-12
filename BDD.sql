CREATE DATABASE Agent_S SET utf8mb4 COLLATE utf8mb4_generale_ci;

CREATE TABLE admin
(
    ID_a int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    firstname varchar(60) NOT NULL,
    lastname varchar(60) NOT NULL,
    email varchar(60) NOT NULL,
    password CHAR(32) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP ON UPDATE CURRENT TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT TIMESTAMP ON UPDATE CURRENT TIMESTAMP

)ENGINE = InnoDB;
 
 -- table that can be 'Admin' or  'Agent' at connexion 

CREATE TABLE user 
(
ID_u int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(60) NOT NULL,
lastname VARCHAR(60) NOT NULL,
email VARCHAR(255),
TypeUtilisateur VARCHAR(60),
password CHAR(32) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP ON UPDATE CURRENT TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT TIMESTAMP ON UPDATE CURRENT TIMESTAMP
)ENGINE = InnoDB;



CREATE TABLE mission
(
    ID_m int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    titre varchar(60) NOT NULL,
    description varchar(60) NOT NULL,
    alias_m varchar(60) NOT NULL,
    country varchar(60) NOT NULL,
    lastname_a varchar(60),
    alias_contact varchar(60),
    alias_cible varchar(60),
    nom_cm  varchar(255),
    nom_statut varchar(60),
    name_planque varchar(60),
    nom_spe varchar(255),
    CONSTRAINT fk_mission_agent FOREIGN KEY (lastname_a) REFERENCES agent(lastname_a) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_contact FOREIGN KEY (alias_contact) REFERENCES contact(alias_contact) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_cible FOREIGN KEY (alias_cible) REFERENCES cible(alias_cIble) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_categorie FOREIGN KEY (name_cm) REFERENCES categorie_mission(nom_cm) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_statut FOREIGN KEY (name_statut) REFERENCES statut(nom_statut) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_planque FOREIGN KEY (name_planque) REFERENCES planque(name_planque) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_specialite FOREIGN KEY (name_spe) REFERENCES specialite(nom_spe) ON DELETE CASCADE ON UPDATE CASCADE,
    date_debut date NOT NULL,
    date_fin date NOT NULL
)ENGINE = InnoDB;


CREATE TABLE agent
(
ID_a INT auto_increment NOT NULL primary key,
lastname_a varchar(60) NOT NULL UNIQUE,
firstname_a varchar(60) NOT NULL,
birthdate date NOT NULL,
telephone char(30),
email VARCHAR(60),
password CHAR(32) NOT NULL,
CONSTRAINT fk_agent_specialite FOREIGN KEY (name_spe) REFERENCES specialite(name_spe) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE cible
(
    ID_cible int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    firstname varchar(60) NOT NULL,
    lastname varchar(60) NOT NULL,
    alias_cible varchar(60) NOT NULL UNIQUE,
    birthdate date NOT NULL,
    nationalite varchar(60) NOT NULL    
)ENGINE = InnoDB;

CREATE TABLE contact
(
    ID_contact int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    firstname varchar(60) NOT NULL,
    lastname varchar(60) NOT NULL,
    birthdate date NOT NULL,
    alias_contact varchar(60) NOT NULL UNIQUE,
    nationalite varchar(60) NOT NULL    
)ENGINE = InnoDB;

CREATE TABLE categorie_mission
(
    ID_cm int AUTO_INCREMENT NOT NULL PRIMARY KEY,
   name_cm  varchar(255) NOT NULL UNIQUE
)ENGINE = InnoDB;

CREATE TABLE statut
(
    ID_statut int AUTO_INCREMENT NOT NULL PRIMARY KEY,
     name_statut varchar(60) NOT NULL UNIQUE
    
)ENGINE = InnoDB;


CREATE TABLE planque
(
    ID_p int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_planque varchar(60) NOT NULL UNIQUE,
    adresse varchar(125) NOT NULL,
    country varchar(60) NOT NULL,
    type varchar(60) NOT NULL
)ENGINE = InnoDB;


CREATE TABLE specialite
(
    ID_spe int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_spe varchar(255) NOT NULL UNIQUE
)ENGINE = InnoDB;


CREATE USER 'Admin' @'localhost' IDENTIFIED BY '1940818101b6ad600ef0ed162cf35614';
GRANT ALL ON `Agent_S` TO 'Admin'@'localhost';


CREATE USER 'Agent'@'localhost', 'Admin'@'localhost' IDENTIFIED BY 'a6c11f3ac856ee2f10788c0f50f0bf58';;
GRANT SELECT  Agent_S.* TO 'Agent'@'localhost';






