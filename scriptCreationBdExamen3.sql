# --------------------------------------------------------
# Script de création de la base de données               
# BdExamen3 et de ses tables
# --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS BdExamen3;

## Création des tables

USE BdExamen3;

# Création de la table tblUsers pour la connexion ICI

CREATE TABLE tblUsers
(
    noUser SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fonction VARCHAR(25) NOT NULL
);





CREATE TABLE tblClients
(
	noClient	SMALLINT	NOT NULL,
	societe		VARCHAR(30)	NOT NULL,
	nom			VARCHAR(25)	NOT NULL,
	prenom		VARCHAR(20) NOT NULL,
	email		VARCHAR(40) NOT NULL,
	fonction	VARCHAR(25) NOT NULL,
	telephone	VARCHAR(10) NOT NULL,
	adresse		VARCHAR(30) NOT NULL,
	ville		VARCHAR(30) NOT NULL,
	province	CHAR(3)		NOT NULL,
	codePostal	VARCHAR(10)	NOT NULL,
	pays		VARCHAR(20)	NOT NULL
);

# Création de la table tblCommandes

CREATE TABLE tblCommandes
(	
	refCommande			SMALLINT		NOT NULL,
	refEmploye			SMALLINT		NOT NULL,
	refClient			SMALLINT		NOT NULL,
	dateCommande		DATE			NOT NULL,
	dateExpedition		DATE			NULL,
	fraisExpedition		DECIMAL(6,2)	NULL,
	typePaiement		VARCHAR(20)		NULL,
	datePaiement		DATE			NULL
);

# Création de la table tblEmployes

CREATE TABLE tblEmployes
(
	noEmploye	SMALLINT	NOT NULL,
	societe		VARCHAR(30)	NOT NULL,
	nom			VARCHAR(25)	NOT NULL,
	prenom		VARCHAR(20) NOT NULL,
	email		VARCHAR(40) NOT NULL,
	fonction	VARCHAR(25) NOT NULL,
	telephone	VARCHAR(14) NOT NULL,
	adresse		VARCHAR(30) NOT NULL,
	ville		VARCHAR(30) NOT NULL,
	province	CHAR(3)		NOT NULL,
	codePostal	VARCHAR(10)	NOT NULL,
	pays		VARCHAR(20)	NOT NULL
);

# Création de la table tblDetails_commande

CREATE TABLE tblDetails_commande
(
	refCommande	SMALLINT	NOT NULL,
	refProduit	SMALLINT	NOT NULL,
	quantite	SMALLINT	NOT NULL,
	prixUnite	DECIMAL(6,2)NOT NULL,
	dateAllouee	DATE		NULL		
);

# Création de la table tblProduits

CREATE TABLE tblProduits
(
	noProduit		SMALLINT		NOT NULL,
	refFournisseur	SMALLINT		NOT NULL,
	codeProduit		VARCHAR(25)		NOT NULL,
	nomProduit		VARCHAR(50)		NOT NULL,
	coutStandard	DECIMAL(6,2) 	NOT NULL,
	quantiteUnite	VARCHAR(35)		NOT NULL,
	Categorie		VARCHAR(50)		NOT NULL
);

# Création de la table tblFournisseurs

CREATE TABLE tblFournisseurs
(
	noFournisseur	SMALLINT	NOT NULL,
	societe			VARCHAR(30)	NOT NULL,
	nomContact		VARCHAR(25)	NOT NULL,
	prenomContact	VARCHAR(20) NOT NULL,
	email			VARCHAR(40) NOT NULL,
	fonction		VARCHAR(25) NOT NULL,
	telephone		VARCHAR(10) NOT NULL,
	adresse			VARCHAR(30) NOT NULL,
	ville			VARCHAR(30) NOT NULL,
	province		CHAR(3)		NOT NULL,
	codePostal		VARCHAR(10)	NOT NULL,
	pays			VARCHAR(20)	NOT NULL
);

## Création des contraintes de clé primaire
	
ALTER TABLE tblClients			CHANGE noClient         noClient        SMALLINT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tblCommandes		CHANGE refCommande      refCommande     SMALLINT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tblEmployes			CHANGE noEmploye        noEmploye       SMALLINT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tblProduits			CHANGE noProduit        noProduit       SMALLINT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tblFournisseurs		CHANGE noFournisseur    noFournisseur   SMALLINT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tblDetails_commande ADD PRIMARY KEY(refCommande, refProduit);

## Création des contraintes de clé étrangère ou clé migrée

ALTER TABLE tblCommandes 		    ADD FOREIGN KEY (refClient)         REFERENCES tblClients (noClient);
ALTER TABLE tblCommandes 	        ADD FOREIGN KEY (refEmploye)        REFERENCES tblEmployes (noEmploye);
ALTER TABLE tblDetails_commande 	ADD FOREIGN KEY (refCommande)       REFERENCES tblCommandes (refCommande);
ALTER TABLE tblDetails_commande     ADD FOREIGN KEY (refProduit)        REFERENCES tblProduits (noProduit);
ALTER TABLE tblProduits 	        ADD FOREIGN KEY (refFournisseur)    REFERENCES tblFournisseurs (noFournisseur);
## Création des contraintes CHECK

ALTER TABLE tblCommandes
ADD CHECK (typePaiement = 'DEBIT' OR typePaiement = 'CREDIT' OR typePaiement = 'COMPTANT');




# Insertion des données dans la table tblClients
# ---------------------------------------------

INSERT INTO tblClients (societe, nom, prenom, email, fonction, telephone, adresse, ville, province, codePostal, pays) VALUES
('SociétéB','Gratacos-Solsona','Antonio','gratacos-solsonaantonio@Sociétéb.com','Propriétaire','6176225700','11 Dorchester Street','Bostonn','MA','02127','États-Unis'),
('SociétéR','Autier-Miconi','Catherine','autier-miconicatherine@Sociétér.com','Représentant des achats','6174211200','1 South Charles Street','Boston','MA','02116','États-Unis'),
('SociétéL','Edwards','Jean','edwardsjean@Sociétél.com','Responsable des achats','4032646419','10-316 3rd Street SE','Calgary','AL','T2G 2S4','Canada'),
('SociétéX','Hasselberg','Jonas','hasselbergjonas@Sociétéx.com','Propriétaire','4034523115','618 Confluence Way SE','Calgary','AL','T2G 0G1','Canada'),
('SociétéJ','Wacker','Roland','wackerroland@Sociétéj.com','Responsable des achats','3124282971','200 South Michigan Avenue','Chicago','IL','60604','États-Unis'),
('SociétéY','Rodman','Jean','rodmanjean@Sociétéy.com','Responsable des achats','3127826000','20 North Michigan Avenue','Chicago','IL','60602','États-Unis'),
('SociétéA','Bedecs','Yvette','bedecsyvette@Sociétéa.com','Propriétaire','5142820808','1425 rue Jeanne-Mance','Montréal','QC','H2X 2J4','Canada'),
('SociétéC','Axen','Thomas','axenthomas@Sociétéc.com','Représentant des achats','5142879582','1 rue St-Paul Ouest','Montréal','QC','H2Y 1Y6','Canada'),
('SociétéG','Xie','Ming-Yang','xieming-yang@Sociétég.com','Propriétaire','5148451595','1595 boul. St-Laurent','Montréal','QC','H2X 2S9','Canada'),
('SociétéI','Mortensen','Sven','mortensensven@Sociétéi.com','Responsable des achats','5148472267','3817 rue St-Denis','Montréal','QC','H2W 2M4','Canada'),
('SociétéM','Ludick','Andre','ludickandre@Sociétém.com','Représentant des achats','5142719099','4806 Avenue du Parc','Montréal','QC','H2V 4E6','Canada'),
('SociétéO','Kupkova','Helena','kupkovahelena@Sociétéo.com','Responsable des achats','5142734446','7610 rue St-Hubert','Montréal','QC','H2R 2N6','Canada'),
('SociétéW','Entin','Michael','entinmichael@Sociétéw.com','Responsable des achats','5145242444','4710 rue de Lanaudière','Montréal','QC','H2J 3P7','Canada'),
('SociétéCC','Lee','Soo-Jung','leesoo-jung@Sociétécc.com','Responsable des achats','5145445800','312 rue St-Paul Ouest','Montréal','QC','H2Y 2A3','Canada'),
('SociétéT','Li','George','ligeorge@Sociétét.com','Responsable des achats','2122452217','911 7th Avenue','New York','NY','10019','États-Unis'),
('SociétéH','Andersen','Elizabeth','andersenelizabeth@Sociétéh.com','Représentant des achats','6136886802','101 Lyon Street North','Ottawa','ON','K1R 5T9','Canada'),
('SociétéS','Eggerer','Alexander','eggereralexander@Sociétés.com','Assistant comptabilité','6134218882','43 William Street','Ottawa','ON','K1N 6Z9','Canada'),
('SociétéZ','Liu','Stan','liustan@Sociétéz.com','Assistant comptabilité','2154638888','1540 West Ritner Street','Philadelphie','PA','19145','État-Unis'),
('SociétéE','Donnell','Martin','donnellmartin@Sociétée.com','Propriétaire','4169160227','150 King Street West','Toronto','ON','M5H 4B6','Canada'),
('SociétéK','Krschne','Peter','krschnepeter@Sociéték.com','Responsable des achats','4169477000','99 Queen Street East','Toronto','ON','M5C 1S1','Canada'),
('SociétéN','Grilo','Carlos','grilocarlos@Sociétén.com','Représentant des achats','4163049134','134 Peter Street','Toronto','ON','M5V 2H2','Canada'),
('SociétéQ','Bagel','Jean-Philippe','bageljean-philippe@Sociétéq.com','Propriétaire','6473487000','115 Yorkville Avenue','Toronto','ON','M5R 1C1','Canada'),
('SociétéV','Ramos','Luciana','ramosluciana@Sociétév.com','Assistant des achats','4165352242','1242 Dundas Street West','Toronto','ON','M6J 1X5','Canada'),
('SociétéBB','Raghav','Amritansh','raghavamritansh@Sociétébb.com','Responsable des achats','4165519929','131 Bloor Street West','Toronto','ON','M5S 1R1','Canada'),
('SociétéF','Perez-Olaeta','Francisco','perez-olaetafrancisco@Sociétéf.com','Responsable des achats','6048220968','6331 Crescent Road','Vancouver','CB','V6T 1Z2','Canada'),
('SociétéP','Goldschmidt','Daniel','goldschmidtdaniel@Sociétép.com','Représentant des achats','6046959500','1017 West Hastings Street','Vancouver','CB','V6E 0C4','Canada'),
('SociétéU','Tham','Bernard','thambernard@Sociétéu.com','Directeur comptable','6045598872','551 Seymour Street','Vancouver','CB','V6B 3H6','Canada'),
('SociétéAA','Toh','Karen','tohkaren@Sociétéaa.com','Responsable des achats','6044289670','1619 West Broadway','Vancouver','CB','V6J 1W9','Canada');

INSERT INTO tblEmployes (societe, nom, prenom, email, fonction, telephone, adresse, ville, province, codePostal, pays) VALUES
('Les Comptoirs','Freehafer','Michelle','nancy@northwindtraders.com','Représentant commercial','+33 1 27324556','123 boulevard des Flots','Cherbourg','75','99999','France'),
('Les Comptoirs','Cencini','Andrew','andrew@northwindtraders.com','Vice-Président, Ventes','+33 1 28904532','444 rue des Campanules','Annecy','75','99999','France'),
('Les Comptoirs','Kotas','Jan','jan@northwindtraders.com','Représentant commercial','+33 1 24897690','555 boulevard Malherbes','Chambéry','75','99999','France'),
('Les Comptoirs','Sergienko','Mariya','mariya@northwindtraders.com','Représentant commercial','+33 1 22334321','456 boulevard De Gaulle','Colmar','75','99999','France'),
('Les Comptoirs','Thorpe','Steven','steven@northwindtraders.com','Directeur commercial','+33 1 29989097','123 boulevard du Jardin','Cherbourg','75','99999','France'),
('Les Comptoirs','Neipper','Michael','michael@northwindtraders.com','Représentant commercial','+33 1 21335678','555 boulevard des Portes','Chambéry','75','99999','France'),
('Les Comptoirs','Zare','Robert','robert@northwindtraders.com','Représentant commercial','+33 1 20090832','777 rue du plein Jour','Cherbourg','75','99999','France'),
('Les Comptoirs','Giussani','Laura','laura@northwindtraders.com','Coordinateur commercial','+33 1 28789761','111 rue du petit Poucet','Chambéry','75','99999','France'),
('Les Comptoirs','Hellung-Larsen','Anne','anne@northwindtraders.com','Représentant commercial','+33 1 24345876','777 rue du géant Vert','Cherbourg','75','99999','France');

INSERT INTO tblCommandes (refEmploye, refClient, dateCommande, dateExpedition,fraisExpedition, typePaiement,datePaiement) VALUES
(9,25,'2006-01-15','2006-01-22',200.00,'DEBIT','2006-01-15'),
(3,4,'2006-01-20','2006-01-22',5.00,'CREDIT','2006-01-20'),
(4,12,'2006-01-22','2006-01-22',5.00,'CREDIT','2006-01-22'),
(6,18,'2006-01-30','2006-01-31',50.00,'COMPTANT','2006-01-30'),
(9,14,'2006-02-06','2006-02-07',4.00,'CREDIT','2006-02-06'),
(3,18,'2006-02-10','2006-02-12',7.00,'CREDIT','2006-02-10'),
(4,3,'2006-02-23','2006-02-25',7.00,'COMPTANT','2006-02-23'),
(8,6,'2006-03-06','2006-03-09',12.00,'DEBIT','2006-03-06'),
(9,23,'2006-03-10','2006-03-11',10.00,'CREDIT','2006-03-10'),
(3,8,'2006-03-22','2006-03-24',5.00,'CREDIT','2006-03-22'),
(4,11,'2006-03-24','2006-03-24',9.00,'DEBIT','2006-03-24'),
(1,18,'2006-03-24',NULL,0.00,NULL,NULL),
(1,11,'2006-03-24','2006-04-07',0.00,NULL,NULL),
(1,15,'2006-03-24',NULL,0.00,NULL,NULL),
(1,1,'2006-03-24',NULL,0.00,NULL,NULL),
(1,24,'2006-04-07','2006-04-07',40.00,'DEBIT','2006-04-07'),
(7,9,'2006-04-05','2006-04-05',1.00,'CREDIT','2006-04-05'),
(6,6,'2006-04-08','2006-04-08',300.00,'DEBIT','2006-04-08'),
(4,20,'2006-04-05','2006-04-05',50.00,'CREDIT','2006-04-05'),
(9,24,'2006-04-05','2006-04-05',5.00,'COMPTANT','2006-04-05'),
(9,21,'2006-04-05','2006-04-05',60.00,'DEBIT','2006-04-05'),
(1,25,'2006-04-05','2006-04-05',200.00,'CREDIT','2006-04-05'),
(2,6,'2006-04-03','2006-04-03',0.00,'CREDIT','2006-04-03'),
(9,14,'2006-04-22','2006-04-22',200.00,'CREDIT','2006-04-22'),
(3,5,'2006-04-22','2006-04-22',5.00,'DEBIT','2006-04-22'),
(4,13,'2006-04-22','2006-04-22',5.00,'DEBIT','2006-04-22'),
(6,9,'2006-04-30','2006-04-30',50.00,'DEBIT','2006-04-30'),
(9,15,'2006-04-07','2006-04-07',4.00,'CREDIT','2006-04-07'),
(3,20,'2006-04-12','2006-04-12',7.00,'CREDIT','2006-04-12'),
(4,4,'2006-04-25','2006-04-25',7.00,'COMPTANT','2006-04-25'),
(8,7,'2006-05-09','2006-05-09',12.00,'DEBIT','2006-05-09'),
(9,19,'2006-05-11','2006-05-11',10.00,'CREDIT','2006-05-11'),
(3,9,'2006-05-24','2006-05-24',5.00,'CREDIT','2006-05-24'),
(4,11,'2006-05-24','2006-05-24',9.00,'DEBIT','2006-05-24'),
(1,8,'2006-05-24',NULL,'0.00',NULL,NULL),
(1,1,'2006-05-24',NULL,'0.00',NULL,NULL),
(1,12,'2006-05-24',NULL,'0.00',NULL,NULL),
(1,2,'2006-05-24',NULL,'0.00',NULL,NULL),
(1,25,'2006-06-07','2006-06-07',40.00,'DEBIT','2006-06-07'),
(7,11,'2006-06-05','2006-06-05',1.00,'CREDIT','2006-06-05'),
(6,7,'2006-06-08','2006-06-08',300.00,'DEBIT','2006-06-08'),
(4,9,'2006-06-05','2006-06-05',50.00,'CREDIT','2006-06-05'),
(9,16,'2006-06-05','2006-06-05',5.00,'COMPTANT','2006-06-05'),
(9,17,'2006-06-05','2006-06-05',60.00,'DEBIT','2006-06-05'),
(1,11,'2006-06-05','2006-06-05',200.00,'CREDIT','2006-06-05'),
(2,6,'2006-06-23','2006-06-23',0.00,'CREDIT','2006-06-23'),
(2,5,'2006-04-25',NULL,0.00,NULL,NULL),
(2,4,'2006-04-25',NULL,0.00,NULL,NULL);

INSERT INTO tblFournisseurs (societe, nomContact, prenomContact, email, fonction, telephone, adresse, ville, province, codePostal, pays) VALUES
('La Voie Maltée','Andersen','Elizabeth A.','andersenelizabeth@vm.com','Directrice commercial','4186151414','224 rue des Laurentides','Chicoutimi','QC','G7H7X8','Canada'),
('Inniskilin Wines','Weiler','Cornelia','weilercornelia@inniskilin.com','Directrice commercial','9054682187','1499 Line 3','Niagara-on-the-lake','ON','L0S1J0','Canada'),
('Robert Mondavi','Koch','Madeleine','kochmadeleine@rmondavi.com','Représentante commercial','2093652995','770 N Guild Ave.','Lodi','CA','95240','États-Unis'),
('Kellog Canada','Sato','Naoki','satonaoki@kellog.com','Responsable marketing','6132104000','501 College St.','Belleville','ON','K8N0A3','Canada'),
('Cadbury Adams Canada','Hernandez','Amaya','hernandez@cadbury.com','Directrice commercial','6472435400','277 Gladstone Ave.','Toronto','ON','M6J3L9','Canada'),
('Procter & Gamble','Hayakawa','Satomi','hayakawasatomi@procterg.com','Assistant marketing','4167304711','4711 Yonge St','Toronto','ON','M2N6K8','Canada'),
('Le Canard Goulu','Morin','Serge','morinserge@canardgoulu.com','Responsable marketing','4188812729','524 Rang Bois-Joly','St-Apollinaire','QC','G0S2E0','Canada'),
('Chocolats Favoris','Larouche','Chantale','larouchechan@chocolatsfavoris.com','Représentante commercial','8446144761','4355 Jean-Marchand','Québec','QC','G2C0N2','Canada'),
('Olymel','Simard','Mikael','simardmikael@olymel.com','Directeur commercial','4188822282','183 rte du Président-Kennedy','Saint-Henri','QC','G0R3E0','Canada'),
('Cape Cod Chips Inc.','Sousa','Luis','sousaluis@capecodch.com','Directeur commercial','5088151880','1 Breeds Hill Rd','Hyannis','MA','02601','États-Unis');

INSERT INTO tblProduits (refFournisseur, codeProduit, nomProduit, coutStandard, quantiteUnite, categorie) VALUES
(2,'TBCOMPT-1','Thé Chai',13.50,'10 boites x 20 sacs','Boissons'),
(6,'COCOMPT-3','Sirop',7.50,'12 bouteilles de 550 ml','Condiments'),
(5,'NWTCO-4','Assaisonnement Cajun',16.50,'48 bocaux de 170g','Condiments'),
(7,'NWTO-5','Huile olive',16.01,'36 boites','Huile'),
(3,'NWTJP-6','Tartinade de mûres',18.75,'12 bocaux de 225g','Confitures en conserve'),
(1,'NWTDFN-7','Pois secs',22.50,'12 paquets de 500g.','Noix et fruits secs'),
(9,'NWTS-8','Sauce Curry',30.00,'12 bocaux de 340g.','Sauces'),
(10,'NWTDFN-14','Noisettes',17.44,'40 paquets de 100g.','Noix et fruits secs'),
(10,'NWTCFV-17','Salade de fruits',29.25,'430g.','Fruits et lgumes en conserve'),
(8,'NWTBGM-19','Biscuits aux chocolats',6.90,'10 boites de 12 pièces','Biscuits'),
(5,'NWTJP-6','Marmelade',60.75,'30 boites cadeau','Confitures en conserves'),
(4,'NWTBGM-21','Scones',7.50,'24 paquets de 4 pièces','Biscuits'),
(2,'NWTB-34','Bière',10.50,'24 bouteilles de 473 ml.','Boissons'),
(5,'NWTCM-40','Crabe en conserve',53.80,'24 boites de 115g.','Viande en conserve'),
(2,'NWTSO-41','Chaudrée de palourdes',17.24,'12 boites de 340g.','Soupes'),
(7,'NWTB-43','Café',34.50,'16 boites de 500g.','Boissons'),
(6,'NWTCA-48','Chocolat',9.56,'10 paquets','Bonbons'),
(8,'NWTDFN-51','Pommes séchées',39.75,'50 paquets de 300g.','Noix et fruits secs'),
(9,'NWTG-52','Riz à Grain Long',5.25,'16 boites de 2kg','Graines'),
(2,'NWTP-56','Gnocchi',28.50,'24 paquets de 250g.','Pâtes'),
(1,'NWTP-57','Ravioli',14.63,'24 paquets de 250g.','Pâtes'),
(3,'NWTS-65','Sauce piquante',15.79,'32 bouteilles de 250ml.','Sauces'),
(6,'NWTS-66','Sauce tomate',12.75,'24 bocaux de 225g.','Sauces'),
(10,'NWTD-72','Mozzarella',26.10,'24 paquets de 200g.','Produits laitiers'),
(1,'NWTDFN-74','Amandes',7.50,'Paquet de 5kg.','Noix et fruits secs'),
(4,'NWTCO-77','Moutarde',9.75,'12 boites','Condiments'),
(3,'NWTDFN-80','Pruneaux séchés',3.00,'Sac de 450g.','Noix et fruits secs'),
(6,'NWTB-81','Thé vert',2.00,'20 sacs par boite','Boissons'),
(8,'NWTC-82','Barre Granola',2.00,'30 gr.','Céréales'),
(9,'NWTCS-83','Croustilles',0.49,'40 gr.','Chips et En-cas'),
(2,'NWTBGM-85','Brownies',9.00,'3 boites','Gâteaux'),
(7,'NWTBGM-86','Petits gâteaux',10.50,'4 boites','Gâteaux'),
(8,'NWTB-87','Thé',2.00,'100 unités par boite','Boissons'),
(10,'NWTCFV-88','Poires',1.00,'430g.','Fruits et lgumes en conserve'),
(2,'NWTCFV-89','Pêches',1.00,'430g.','Fruits et lgumes en conserve'),
(4,'NWTCFV-90','Ananas',1.00,'430g.','Fruits et lgumes en conserve'),
(7,'NWTCFV-91','Préparation de cerises',1.00,'430g.','Fruits et lgumes en conserve'),
(2,'NWTCFV-92','Pois verts',1.00,'400g.','Fruits et lgumes en conserve'),
(8,'NWTCFV-93','Mais en grains',1.00,'400g.','Fruits et lgumes en conserve'),
(6,'NWTCFV-94','Pois',1.00,'400g.','Fruits et lgumes en conserve'),
(5,'NWTCM-95','Thon en conserve',1.25,'140g.','Viande en conserve'),
(4,'NWTCM-96','Saumon fumé',6.00,'140g.','Viande en conserve'),
(5,'NWTC-82','Gruau',3.00,'500 g.','Céréales'),
(6,'NWTSO-98','Soupe aux lgumes',1.10,'500 ml.','Soupes'),
(9,'NWTSO-99','Soupe au poulet',1.20,'500 ml.','Soupes');

INSERT INTO tblDetails_commande VALUES
(2,34,100,14.00,NULL),
(3,45,30,3.50,NULL),
(4,7,10,30.00,NULL),
(5,6,10,53.00,NULL),
(6,35,10,3.50,NULL),
(1,1,15,18.00,NULL),
(7,43,20,46.00,NULL),
(8,19,30,9.20,NULL),
(9,19,20,9.20,NULL),
(10,3,10,12.75,NULL),
(11,41,200,9.65,NULL),
(12,8,17,40.00,NULL),
(13,43,300,46.00,NULL),
(14,3,100,12.75,NULL),
(15,36,200,2.99,NULL),
(16,43,300,46.00,NULL),
(17,4,10,22.00,NULL),
(17,6,10,25.00,NULL),
(17,19,10,9.20,NULL),
(18,35,20,3.50,NULL),
(18,36,50,2.99,NULL),
(19,1,25,18.00,NULL),
(19,43,25,46.00,NULL),
(19,36,25,2.99,NULL),
(20,40,50,18.40,NULL),
(20,41,50,9.65,NULL),
(21,12,100,19.50,NULL),
(21,27,50,34.80,NULL),
(22,34,300,14.00,NULL),
(23,8,25,40.00,NULL),
(23,19,25,9.20,NULL),
(24,21,20,10.00,NULL),
(25,5,25,21.35,NULL),
(25,40,30,18.40,NULL),
(25,41,30,9.65,NULL),
(30,34,87,14.00,NULL),
(31,3,10,12.75,NULL),
(32,20,40,81.00,NULL),
(32,7,40,7.00,NULL),
(33,27,40,34.80,NULL),
(34,3,50,10.00,NULL),
(34,8,3,40.00,NULL),
(35,29,20,10.00,NULL),
(36,35,15,3.50,NULL),
(37,8,20,40.00,NULL),
(38,40,40,18.40,NULL),
(39,43,5,46.00,NULL),
(40,41,10,9.65,NULL),
(41,3,40,12.75,NULL),
(42,3,40,12.75,NULL),
(43,4,30,22.00,NULL),
(44,6,90,25.00,NULL),
(45,17,40,39.00,NULL),
(46,7,30,30.00,NULL),
(46,6,30,53.00,NULL),
(47,11,10,38.00,NULL),
(48,11,20,38.00,NULL),
(48,36,0,2.99,NULL);
