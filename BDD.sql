CREATE DATABASE Agent_S SET utf8mb4 COLLATE utf8mb4_generale_ci;

CREATE TABLE administrateur
(
    ID_a int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    firstname varchar(60) NOT NULL,
    lastname varchar(60) NOT NULL,
    email varchar(60) NOT NULL,
    password CHAR(32) NOT NULL

)ENGINE = InnoDB;
 
 -- table that can be 'Admin' or  'Agent' at connexion 

CREATE TABLE utilisateur
(
ID_u int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(60) NOT NULL,
lastname VARCHAR(60) NOT NULL,
email VARCHAR(255),
TypeUtilisateur VARCHAR(60),
password CHAR(32) NOT NULL
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
    name_cm  varchar(255),
    name_statut varchar(60),
    name_planque varchar(60),
    name_spe varchar(255),
    CONSTRAINT fk_mission_agent FOREIGN KEY (lastname_a) REFERENCES agent(lastname_a) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_contact FOREIGN KEY (alias_contact) REFERENCES contact(alias_contact) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_cible FOREIGN KEY (alias_cible) REFERENCES cible(alias_cible) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_categorie FOREIGN KEY (name_cm) REFERENCES categorie_mission(name_cm) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_statut FOREIGN KEY (name_statut) REFERENCES statut(name_statut) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_planque FOREIGN KEY (name_planque) REFERENCES planque(name_planque) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mission_specialite FOREIGN KEY (name_spe) REFERENCES specialite(name_spe) ON DELETE CASCADE ON UPDATE CASCADE,
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
name_spe varchar(255) NOT NULL,
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
    name_spe varchar(255) NOT NULL ADD UNIQUE
)ENGINE = InnoDB;


CREATE USER 'admin'@'%' IDENTIFIED BY '1940818101b6ad600ef0ed162cf35614';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' REQUIRE NONE WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

CREATE USER 'agent'@'%' IDENTIFIED BY 'a6c11f3ac856ee2f10788c0f50f0bf58';
GRANT SELECT, SHOW VIEW ON *.* TO 'agent'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;


insert into administrateur (firstname, lastname, email, password) values ('Joey', 'Vicker', 'jvicker0@joomla.org', '$2a$04$RwaKmKlTRkPW1lVGzTkXJOW2UK0lId9DW50hSindhmUDsnBPtOpPa');
insert into administrateur (firstname, lastname, email, password) values ('Felice', 'Hendricks', 'fhendricks1@skype.com', '$2a$04$H7s9cN4yArOMepRU9XajcOikZOIpv52wtylTy8jLirV6.xSP1u.ze');
insert into administrateur (firstname, lastname, email, password) values ('Ike', 'Tarney', 'itarney2@prnewswire.com', '$2a$04$02GGcenyeFxUKudMLgb0muzhXnZ/JA6u.gWJXgf8nu1Ms2hb2qOXW');
insert into administrateur (firstname, lastname, email, password) values ('Edie', 'Plascott', 'eplascott3@cloudflare.com', '$2a$04$fJAcel./OyXTq/rlk4RRvuhpJ7H4veDIVwLL/f8Bx69IU0nq/7XmK');
insert into administrateur (firstname, lastname, email, password) values ('Abagail', 'Beiderbeck', 'abeiderbeck4@parallels.com', '$2a$04$Z0rkTdTXA5ap/ISQNPyRU.Fr0gGBz4hnRgPADAqVfUQXzBhXcRSSy');
insert into administrateur (firstname, lastname, email, password) values ('Ray', 'Gerram', 'rgerram5@lycos.com', '$2a$04$M5PZ0BUl2pPd8vDQVKTtZuIPkV/YL3sjUUrkO8wIdL.wlP5/1dOPW');
insert into administrateur (firstname, lastname, email, password) values ('Alvin', 'Wards', 'awards6@apache.org', '$2a$04$koCTsfTWk7kEgo.GXMhTJuuK7TnK..VFUKJoM8Gmwhh2kVkvdBzQS');
insert into administrateur (firstname, lastname, email, password) values ('Jefferey', 'Simonson', 'jsimonson7@intel.com', '$2a$04$iIhTNWBAJkFb9wekdnt8/eRVxa4pXmBZXB3PCEb/wQ8zzBXlgsu6C');
insert into administrateur (firstname, lastname, email, password) values ('Brok', 'Franzonello', 'bfranzonello8@goodreads.com', '$2a$04$D2SDZtGA7z6c9btgaWwCFugvjjHws7DQu.ZkfK4Wh6wWT7kl4/OzK');
insert into administrateur (firstname, lastname, email, password) values ('Bobby', 'Andersson', 'bandersson9@nih.gov', '$2a$04$gHcegmlCCkM8m3mxETFWgeRLwCPJBXlTFo2XcFIxx3RHdH3BQZ7sa');

insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('scott kennedy', 'Leon scott kennedy', '8/24/1977', 'LkennedyS@sun.com', '973-978-4874', '$2a$04$bhzB/pBXOVmQPAJp4nmLJuF6x7kM7BXGe1mDRvbAK7OqnW6C6ZGRO', 'Capacité à analyser des schémas criminels');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('Wong', 'Ada', '00/00/0000', 'aWong@unblog.fr', '692-737-7874', '$2a$04$jyjxB4uPcfDCZxOb2fgDh.WkUfIXpwfukehFrZ9zPA8XXDem7Ng2y', 'recueillir des informations sans éveiller de soupçons');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('Gionne', ' Excella', '3/11/1970', 'EGionne@purevolume.com', '748-790-3060', '$2a$04$L56WJlYKMxtL9W/adAKlVOeSX3dEIHXe2eD.hOfKbecJguhHQYx3q', 'Grande maîtrise arme à feu et combat contre arme biologique');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('Wesker', 'Albert', '12/12/1960', 'Awesker@netlog.com', '827-354-0548', '$2a$04$BT9zib7TcV4PpEUCVtu5/OuP8Wsd4mKq3e381fDtymWkAxV3w3Hcm', 'Compétences en autodéfense et en arts martiaux pour faire face à des situations potentiellement dangereuses');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('Alomar', 'Sheva', '1/31/1976', 'SAlomar@howstuffworks.com', '224-698-9244', '$2a$04$e6VHp7/8wk/H4QMeoMORQ.65fzeOo.jq5xBZh9Tz5mMRfBNAgwaQq', 'Capacité à travailler en équipe avec des agents locaux et internationaux');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ( 'UNKNOW', 'HUNK', '3/17/2023', 'HUNK@ted.com', '953-729-9193', '$2a$04$BXPdOc8TwvmD.7hNa/USKOQlLJVWPtDKNbxtJ/6YzIFG0OBsrS8YC', 'Compréhension des traditions et culture du pays');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('Winters','Ethan', '10/19/1984', 'eWinters@google.nl', '594-252-3843', '$2a$04$YApsZKJY34azpXeznXw8wuTU6lJ17vuyur1bUcnbwUbNtNxEe9Zhu', 'Résistance au stress');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('Winters', 'Rose', '02/05/1999', 'rWins@github.io', '941-241-2373', '$2a$04$wu9RQna1Zzx1G9dGA4FFW.KlhzqKOJXrmGLMOnXiOg3mANXm0EDE.', 'Utilisation avancée de la technologie de surveillance');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('Birkin', 'Sherry', '6/18/1986', 'Bsherry@statcounter.com', '559-308-1266', '$2a$04$3/L2u9WKSr9kx4Y.Zqaj..dA/LiX1IVAnzBL/Gt97xHPWi.7lo3p.', 'Capacité à analyser des flux financier et des activités suspectes');
insert into agent (lastname_a, firstname_a, birthdate, email, telephone, password, name_spe) values ('Oliveira', 'Carlos Oliveira', '4/4/1977', 'COliveira@unblog.fr', '751-165-8507', '$2a$04$eqyYPbDlqbO9u1NBv6SR1uHcrEH329Io1fyl3iTgnwRXZM2aZSpGa', 'Capacité à analyser des schémas criminels');

insert into specialite (name_spe) values ('Résistance au stress');
insert into specialite (name_spe) values ('capacité à prendre des décisions rapides dans des situations tendues.');
insert into specialite (name_spe) values ('Compréhension des traditions et culture du pays');
insert into specialite (name_spe) values ('Capacité à travailler en équipe avec des agents locaux et internationaux');
insert into specialite (name_spe) values ('Utilisation avancée de la technologie de surveillance');
insert into specialite (name_spe) values ('recueillir des informations sans éveiller de soupçons');
insert into specialite (name_spe) values ('Compétences en autodéfense et en arts martiaux pour faire face à des situations potentiellement dangereuses');
insert into specialite (name_spe) values ('Capacité à analyser des schémas criminels');
insert into specialite (name_spe) values ('Capacité à analyser des flux financier et des activités suspectes');
insert into specialite (name_spe) values ('Grande maîtrise arme à feu et combat contre arme biologique');


insert into planque (name_planque, adresse, country, type) values ('Le restaurant la Tanière de Griffe', '205.100.35.92', 'Japan', 'restaurant');
insert into planque (name_planque, adresse, country, type) values ('End Zone Elegance Suite', '223.161.48.245', 'USA', 'Stade NFL');
insert into planque (name_planque, adresse, country, type) values ('Harmony Canal', '165.11.113.37', 'Afrique', 'pont harmony');
insert into planque (name_planque, adresse, country, type) values ('Wide Awake Café', '78.72.85.121', 'France', 'Métro bastille');
insert into planque (name_planque, adresse, country, type) values ('Château de l''Ombre', '3.162.131.161', 'Roumanie', 'Château');

insert into statut (name_statut) values ('En Préparation');
insert into statut (name_statut) values ('En cours');
insert into statut (name_statut) values ('Terminer');
insert into statut (name_statut) values ('Echec');


insert into categorie_mission (name_cm) values ('Infiltraton');
insert into categorie_mission (name_cm) values ('Elimination');
insert into categorie_mission (name_cm) values ('Escorte');
insert into categorie_mission (name_cm) values ('Renseignement');
insert into categorie_mission (name_cm) values ('Piratage informatique');
insert into categorie_mission (name_cm) values ('Extraction');
insert into categorie_mission (name_cm) values ('Sabotage');

insert into contact (firstname, lastname , birthdate, alias_contact, nationalite) values ('Lucas', 'Trula', '1/20/1969', 'Vladimir Sombra', 'RO');
insert into contact (firstname, lastname , birthdate, alias_contact, nationalite) values ('Giustina', 'Renzullo', '6/7/1988', ' Madeline Noir', 'FR');
insert into contact (firstname, lastname , birthdate, alias_contact, nationalite) values ('Alice', 'Dabner', '4/18/1999', 'Chaska', 'USA');
insert into contact (firstname, lastname , birthdate, alias_contact, nationalite) values ('Earvin', 'Yardy', '8/7/2000', ' Kuzuyama Sukefusa', 'JA');
insert into contact (firstname, lastname , birthdate, alias_contact, nationalite) values ('Udall', 'Penner', '9/14/2007', 'Malik Nkosi', 'AF');

insert into cible (firstname, lastname , alias_cible, birthdate, nationalite) values ('Tabbitha', 'Brabender', 'Ryūketsu-kai', '3/2/2023', 'JA');
insert into cible (firstname, lastname , alias_cible, birthdate, nationalite) values ('Timmie', 'Goodacre', 'GenèseBioTech', '11/6/2022', 'USA');
insert into cible (firstname, lastname , alias_cible, birthdate, nationalite) values ('Noel', 'Laybourne', 'Lara Ombre', '3/3/2023', 'AF');
insert into cible (firstname, lastname , alias_cible, birthdate, nationalite) values ('Keary', 'Picott', ' cicatra', '11/4/2022', 'FR');
insert into cible (firstname, lastname , alias_cible, birthdate, nationalite) values ('Augy', 'Walisiak', 'Elena Dracul', '12/14/2022', 'RO');