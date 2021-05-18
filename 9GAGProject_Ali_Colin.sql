--verwijder constraints--


ALTER TABLE "9gag".Notificaties
DROP CONSTRAINT FK_Notificatie_Post
ALTER TABLE "9gag".Notificaties
DROP CONSTRAINT FK_Notificatie_Gebruiker
ALTER TABLE "9gag".Gebruiker
DROP CONSTRAINT FK_Gebruiker_Chat
GO

--verwijder tabellen--

DROP TABLE "9gag".Sectie
DROP TABLE "9gag".Post
DROP TABLE "9gag".Chat
DROP TABLE "9gag".Gebruiker
DROP TABLE "9gag".Notificaties
GO

--verwijder schema--

DROP SCHEMA "9gag"
GO

--aanmaken schema--

CREATE SCHEMA "9gag"
GO

--aanmaken tabellen--

CREATE TABLE "9gag".Sectie
(
      sectieId        INT IDENTITY(1,1) NOT NULL, 
      naam            VARCHAR(30)       NOT NULL,
      fotobinary      VARCHAR(max)      NOT NULL, 
      datum           Date              NOT NULL,

      CONSTRAINT PK_sectie PRIMARY KEY (sectieId)
)

CREATE TABLE "9gag".Post
(
      postId          INT IDENTITY(1,1) NOT NULL,
      sectieId        INT               NOT NULL,
      score           INT,
      mediabinary     VARCHAR(max)      NOT NULL,
      tijdpost        BIGINT            NOT NULL,
      upvote          BIT,
      titel           VARCHAR(255)      NOT NULL,

      CONSTRAINT PK_Post PRIMARY KEY (postId),
      CONSTRAINT FK_Post_Sectie FOREIGN KEY (sectieId) REFERENCES "9gag".Sectie(sectieId)
)



CREATE TABLE "9gag".Chat 
(
      chatId          INT IDENTITY(1,1) NOT NULL,
      topic           VARCHAR(30)       NOT NULL,
      fotobinary      VARCHAR(max)      NOT NULL,
      inhoudchat      VARCHAR(max),

      CONSTRAINT PK_Chat PRIMARY KEY (chatId)
)

CREATE TABLE "9gag".Gebruiker
(
      gebruikerId     INT IDENTITY(1,1) NOT NULL,
      naam            VARCHAR(30)       NOT NULL,
      wachtwoord      VARCHAR(30)       NOT NULL,
      email           VARCHAR(30)       NOT NULL,
      fotobinary      VARCHAR(max)      NOT NULL,
      leeftijdaccount INT               NOT NULL,
      locatie         VARCHAR(30),
      gender          VARCHAR(20)       NOT NULL,
      geboortedatum   INT,
      beschrijving    VARCHAR(255),
      verified        BIT,
	  administrator   BIT               NOT NULL,
	  chatId          INT               NOT NULL,

      CONSTRAINT PK_Gebruiker PRIMARY KEY (gebruikerId),
	  CONSTRAINT FK_Gebruiker_Chat FOREIGN KEY (chatId) REFERENCES "9gag".Chat(chatId)
)





CREATE TABLE "9gag".Notificaties
(
      notificatieId   INT IDENTITY(1,1) NOT NULL,
      postId          INT               NOT NULL,
      gebruikerId     INT               NOT NULL,

      CONSTRAINT PK_Notificatie PRIMARY KEY (notificatieId),
      CONSTRAINT FK_Notificatie_Post FOREIGN KEY (postId) REFERENCES "9gag".Post(postId),
      CONSTRAINT FK_Notificatie_Gebruiker FOREIGN KEY (gebruikerId) REFERENCES "9gag".Gebruiker(gebruikerId)
)




-- Insert statements --

INSERT INTO [9gag].[Chat]
(topic, fotobinary, inhoudchat)
VALUES('Funny','https://img-9gag-fun.9cache.com/photo/a8EEg4p_460svav1.png','Thats funny')

INSERT INTO [9gag].[Chat]
(topic, fotobinary, inhoudchat)
VALUES('Animals','https://img-9gag-fun.9cache.com/photo/amPPwMX_700bwp.webp','Thats a lovely animal')

INSERT INTO [9gag].[Chat]
(topic, fotobinary, inhoudchat)
VALUES('Tattoo Ideas','https://img-9gag-fun.9cache.com/photo/aXoo1dg_700bwp.webp','Cool snake design')



INSERT INTO [9gag].[Gebruiker]
(naam, wachtwoord, email, fotobinary, leeftijdaccount, locatie, gender, geboortedatum, beschrijving, verified, administrator, chatId)
VALUES('Berthem202','BanaanEter123','Berrie202@gmail.com','https://accounts-cdn.9gag.com/media/avatar/a9EEGWm_460svvp9.png','2203',NULL,'Male','01041996','Bananen zijn lekker','0','0',1)

INSERT INTO [9gag].[Gebruiker]
(naam, wachtwoord, email, fotobinary, leeftijdaccount, locatie, gender, geboortedatum, beschrijving, verified, administrator, chatId)
VALUES('HansUndGretel2','bAo*FPQfTkcm','AnnaEggert@gmail.com','https://accounts-cdn.9gag.com/media/avatar/49968326_100_1.jpg','103','Germany','Other','12112002',NULL,'0','0',2)

INSERT INTO [9gag].[Gebruiker]
(naam, wachtwoord, email, fotobinary, leeftijdaccount, locatie, gender, geboortedatum, beschrijving, verified, administrator, chatId)
VALUES('PzKpfWIV','456789123','PwKpfZIV@protonmail.ch','https://accounts-cdn.9gag.com/media/avatar/8056532_800_5.jpg','856',NULL,'Other','3081990','The Panzerkampfwagen IV (PzKpfw IV), commonly known as the Panzer IV, was a German medium tank developed in the late 1930s and used extensively during the Second World War. Its ordnance inventory designation was Sd.Kfz. 161.','1','1',3)

INSERT INTO [9gag].[Sectie]
(naam, fotobinary,datum)
VALUES('Girl','https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557376304.186_U5U7u5_100x100.jpg','2018-08-14')

INSERT INTO [9gag].[Sectie]
(naam, fotobinary,datum)
VALUES('Anime & Manga','https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557310356.2625_y8EVa2_100x100wp.webp','2019-12-24')

INSERT INTO [9gag].[Sectie]
(naam, fotobinary,datum)
VALUES('Car','https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557311278.4297_UNEHy6_100x100wp.webp','2020-05-03')

INSERT INTO [9gag].[Post]
(sectieId,score, mediabinary, tijdpost, upvote, titel)
VALUES(3,NULL,'https://img-9gag-fun.9cache.com/photo/awMMjvr_460svav1.mp4','010420210104',0, 'My new coping mechanism')

INSERT INTO [9gag].[Post]
(sectieId,score, mediabinary, tijdpost, upvote, titel)
VALUES(2,120,'https://img-9gag-fun.9cache.com/photo/a4EEyPA_460svav1.mp4','150220212012',1, 'What happens when you speak Japanese')

INSERT INTO [9gag].[Post]
(sectieId,score, mediabinary, tijdpost, upvote, titel)
VALUES(1,9882,'https://img-9gag-fun.9cache.com/photo/ajmmw8Q_460swp.webp','241020201204',0, 'Oldschool is the way')



