
CREATE DATABASE Tifosi

/*Script de création du schéma de la base de données tifosi*/

CREATE TABLE Ingrédient(
   Id_Ingrédient INT AUTO_INCREMENT ,
   nom VARCHAR(50),
   PRIMARY KEY(Id_Ingrédient)
);

CREATE TABLE focaccia(
   Id_focaccia INT AUTO_INCREMENT ,
   nom VARCHAR(50) NOT NULL,
   prix DECIMAL(5,2) NOT NULL,
   PRIMARY KEY(Id_focaccia)
);

CREATE TABLE menu(
   Id_menu INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   prix DECIMAL(5,2) NOT NULL,
   Id_focaccia INT NOT NULL,
   PRIMARY KEY(Id_menu),
   FOREIGN KEY(Id_focaccia) REFERENCES focaccia(Id_focaccia)
);

CREATE TABLE Client(
   Id_Client INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   code_postal VARCHAR(50),
   PRIMARY KEY(Id_Client),
   UNIQUE(email)
);

CREATE TABLE marque(
   Id_marque INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_marque)
);	CREATE TABLE boisson(
   Id_boisson INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   Id_marque INT NOT NULL,
   PRIMARY KEY(Id_boisson),
   FOREIGN KEY(Id_marque) REFERENCES marque(Id_marque)
);

CREATE TABLE comprend(
   Id_focaccia INT,
   Id_Ingrédient INT,
   quantité VARCHAR(50),
   PRIMARY KEY(Id_Ingrédient, Id_focaccia),
   FOREIGN KEY(Id_Ingrédient) REFERENCES Ingrédient(Id_Ingrédient),
   FOREIGN KEY(Id_focaccia) REFERENCES focaccia(Id_focaccia)
);

CREATE TABLE achete(
   Id_menu INT,
   Id_Client INT,
   date_achat DATE,
   PRIMARY KEY(Id_menu, Id_Client),
   FOREIGN KEY(Id_menu) REFERENCES menu(Id_menu),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client)
);

CREATE TABLE contient(
   Id_menu INT,
   Id_boisson INT,
   PRIMARY KEY(Id_menu, Id_boisson),
   FOREIGN KEY(Id_menu) REFERENCES menu(Id_menu),
   FOREIGN KEY(Id_boisson) REFERENCES boisson(Id_boisson)
);

/*Création utilisateur ayant droit administrateur*/

CREATE USER 'admin_user' IDENTIFIED BY 'admin_123';

GRANT ALL PRIVILEGES ON 'tifosi' TO 'admin_user';