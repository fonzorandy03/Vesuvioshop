DROP database IF EXISTS VesuvioDB;
CREATE database VesuvioDB;

USE VesuvioDB;

DROP TABLE IF EXISTS UserAccount;
CREATE TABLE UserAccount
(
	email varchar(50) PRIMARY KEY NOT NULL,
    passwordUser varchar(5000) NOT NULL,
	nome varchar(50) NOT NULL,
    cognome varchar(50) NOT NULL,
    indirizzo varchar(50) NOT NULL,
    telefono varchar(15) NOT NULL,
    numero char(16) NOT NULL,
    intestatario varchar(50) NOT NULL,
    CVV char(3) NOT NULL,
    ruolo varchar(16) NOT NULL DEFAULT 'registeredUser'
);

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente
(
	email varchar(50) PRIMARY KEY NOT NULL,
    FOREIGN KEY(email) REFERENCES UserAccount(email) ON UPDATE cascade ON DELETE cascade
);

DROP TABLE IF EXISTS Venditore;
CREATE TABLE Venditore
(
	email varchar(50) PRIMARY KEY NOT NULL,
    feedback int DEFAULT NULL,
    FOREIGN KEY(email) REFERENCES UserAccount(email) ON UPDATE cascade ON DELETE cascade
);

DROP TABLE IF EXISTS Tipologia;
CREATE TABLE Tipologia
(
    nome ENUM('MaglieGara','Personalizzate','Gadget') PRIMARY KEY NOT NULL
);

DROP TABLE IF EXISTS Prodotto;
CREATE TABLE Prodotto
(
	codice int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(50) NOT NULL,
    descrizione text NOT NULL,
    deleted BOOL NOT NULL DEFAULT false,
    prezzo double(10,2) NOT NULL,
    model varchar(200) NOT NULL,
    speseSpedizione double(5,2) DEFAULT 0,
    emailVenditore varchar(50) NOT NULL,
    tag ENUM('Maglie', 'Personalizzate', 'Tazze', 'Sciarpe', 'Vari') NOT NULL,
    nomeTipologia ENUM('MaglieGara','Personalizzate','Gadget') NOT NULL,
    dataAnnuncio date NOT NULL,
    FOREIGN KEY(emailVenditore) REFERENCES Venditore(email) ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY(nomeTipologia) REFERENCES Tipologia(nome) ON UPDATE cascade ON DELETE cascade
)ENGINE=InnoDB AUTO_INCREMENT=1000;

DROP TABLE IF EXISTS Ordine;
CREATE TABLE Ordine
(
	codiceOrdine int NOT NULL AUTO_INCREMENT,
    codiceProdotto int NOT NULL,
    emailCliente varchar(50) NOT NULL,
    prezzoTotale double(10,2) NOT NULL,
    quantity int NOT NULL,
    dataAcquisto date NOT NULL,
    PRIMARY KEY(codiceOrdine,codiceProdotto),
    FOREIGN KEY(codiceProdotto) REFERENCES Prodotto(codice) ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY(emailCliente) REFERENCES Cliente(email) ON UPDATE cascade ON DELETE cascade
)ENGINE=InnoDB AUTO_INCREMENT=100;

DROP TABLE IF EXISTS Recensione;
CREATE TABLE Recensione
(
	codiceRecensione int NOT NULL AUTO_INCREMENT,
    codiceProdotto int NOT NULL,
    emailCliente varchar(50) NOT NULL,
    votazione tinyint unsigned NOT NULL,
    testo text,
    dataRecensione date NOT NULL,
    PRIMARY KEY(codiceRecensione,codiceProdotto),
    FOREIGN KEY(codiceProdotto) REFERENCES Prodotto(codice) ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY(emailCliente) REFERENCES Cliente(email) ON UPDATE cascade ON DELETE cascade
);

DROP TABLE IF EXISTS Preferiti;
CREATE TABLE Preferiti
(
	codiceProdotto int NOT NULL,
    emailCliente varchar(50) NOT NULL,
    PRIMARY KEY(codiceProdotto,emailCliente),
    FOREIGN KEY(codiceProdotto) REFERENCES Prodotto(codice) ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY(emailCliente) REFERENCES Cliente(email) ON UPDATE cascade ON DELETE cascade
);

USE VesuvioDB;

/* begin data population */

/* accountuser data */
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV, ruolo)
VALUES ('vesuvio@gmail.com', MD5('12345678'), 'vesuvio', 'shop', 'Unisa, Dipartimento Informatica', '3476549862', '5436724598431234', 'vesuvioshop', 476, 'admin');
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('mariocelzo@gmail.com', MD5('12345678'), 'Mario', 'Celzo', 'Sarno, Via Lazio 14', '3476549862', '5436724598431234', 'Mario Celzo', 476); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('seppe@gmail.com', MD5('12345678'), 'Giuseppe', 'Espostio', 'Sarno, Via mura d arci 15', '3518457668', '6745982476311234', 'Giuseppe Esposito', 435); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('titoph@gmail.com', MD5('12345678'), 'TIto', 'California', 'Holliwood, Via set  14', '3474351776', '8791267534971234', 'Tito California', 143); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('pedropescheria@gmail.com', MD5('12345678'), 'Pedro', 'Cotigoal', 'Pimonte, Via pugilato 14', '3518234671', '7613872515281234', 'Pedro Cotigoal', 621); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('tonyunder15@yahoo.com', MD5('12345cliente678'), 'Antonio', 'Del Giudice', 'Poggiomarino, Via Libertà 15', '3517628334', '8901034567391234', 'Antonio Del Giudice', 165); 

/* cliente data */
INSERT INTO Cliente (email) VALUES ('vesuvio@gmail.com');
INSERT INTO Cliente (email) VALUES ('mariocelzo@gmail.com');
INSERT INTO Cliente (email) VALUES ('seppe@gmail.com');
INSERT INTO Cliente (email) VALUES ('titoph@gmail.com');

/* venditore data */

INSERT INTO Venditore (email) VALUES ('vesuvio@gmail.com');
/* tipologia data */
INSERT INTO Tipologia (nome) VALUES ('MaglieGara');
INSERT INTO Tipologia (nome) VALUES ('Personalizzate');
INSERT INTO Tipologia (nome) VALUES ('Gadget');

/* prodotto data */
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Maglia Gara', 'Maglia Gara 2022/2023', 59.99, 3.00, 'vesuvio@gmail.com', 'Maglie', 'MaglieGara', current_date(), 'garaBlu1.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Maglia Gara', 'Terza Maglia Gara 2023/2024', 89.99, 3.00, 'vesuvio@gmail.com', 'Maglie', 'MaglieGara', current_date(), 'magliaGaraNera.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Maglia Gara', ' Maglia Gara 2027/2028', 69.99, 3.00, 'vesuvio@gmail.com', 'Maglie', 'MaglieGara', current_date(), 'magliaGara2018.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Maglia Personalizzata', 'Maglia Personalizzata con il tuo nome, invia una mail al venditore per scelgiere il nome', 59.99, 3.00, 'vesuvio@gmail.com', 'Maglie', 'Personalizzate', current_date(), 'garaBlu2.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Sciarpa Napoli', 'sciarpa invernale per tifare anche con il freddo', 19.99, 2.00, 'vesuvio@gmail.com', 'Sciarpe', 'Gadget', current_date(), 'sciarpa1.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Tazza', ' Tazza del napoli ', 19.99, 3.00, 'vesuvio@gmail.com', 'Tazze', 'Gadget', current_date(), 'tazza1.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Lampada', ' Il buio non sara piu un problema con la nostra lampada anti juve ', 9.99, 3.00, 'vesuvio@gmail.com', 'Vari', 'Gadget', current_date(), 'palla.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Portachiave', ' porta la tua fede, ovunque, con te ', 9.99, 3.00, 'vesuvio@gmail.com', 'Vari', 'Gadget', current_date(), 'portachiavi.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Tazza Personalizzata', 'la colazione dei campioni, invia mail al venditore per la personalizzazione ', 9.99, 3.00, 'vesuvio@gmail.com', 'Vari', 'Personalizzate', current_date(), 'tazzaP.png');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Maglia Celebrativa', 'celebra il terzo scudetto come meglio credi, invia mail al venditore per la personalizzazione ', 59.99, 3.00, 'vesuvio@gmail.com', 'Vari', 'Personalizzate', current_date(), 'celebrativa.png');








/* ordine data */
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1000, 'mariocelzo@gmail.com', 25.98, 2, '2017-11-11');
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1000, 'titoph@gmail.com', 12.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1001, 'titoph@gmail.com', 21.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1002, 'seppe@gmail.com', 42.99, 1, current_date());



/* recensione data */
INSERT INTO Recensione (codiceProdotto, emailCliente, votazione, testo, dataRecensione)
VALUES (1000, 'mariocelzo@gmail.com', 10, NULL, current_date());
INSERT INTO Recensione (codiceProdotto, emailCliente, votazione, testo, dataRecensione)
VALUES (1001, 'seppe@gmail.com', 9, NULL, current_date());
INSERT INTO Recensione (codiceProdotto, emailCliente, votazione, testo, dataRecensione)
VALUES (1000, 'seppe@gmail.com', 9, NULL, current_date());

/* preferiti data */
INSERT INTO Preferiti (codiceProdotto, emailCliente)
VALUES (1000, 'titoph@gmail.com');
INSERT INTO Preferiti (codiceProdotto, emailCliente)
VALUES (1001, 'seppe@gmail.com');
INSERT INTO Preferiti (codiceProdotto, emailCliente)
VALUES (1002, 'mariocelzo@gmail.com');

/* end data population */