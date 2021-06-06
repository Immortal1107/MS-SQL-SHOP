CREATE DATABASE PCShop
USE PCShop;  
GO

CREATE TABLE Users
 (
  id int IDENTITY(1,1) Primary key NOT NULL,
  Familia nvarchar(50) NOT NULL,
  Imja nvarchar(50) NOT NULL,
  Otchestvo nvarchar(50) NOT NULL,
  Mail nvarchar(50) NOT NULL,
  Adress nvarchar(100) NOT NULL,
 );

CREATE TABLE Sklad
 (
  Nazvanie nvarchar(50) Primary key NOT NULL,
  Colvo int NOT NULL,
  Price int NOT NULL,
  Tip nvarchar(50) NOT NULL
 );

CREATE TABLE Injeneri
 (
  id_inj int IDENTITY(1,1) Primary key NOT NULL,
  ColvoComp int NOT NULL
 );

CREATE TABLE Curieri
 (
  id_cur int IDENTITY(1,1) Primary key NOT NULL,
  ColvoDostavok int NOT NULL,
  CarNumber nvarchar(50) NOT NULL
 );

CREATE TABLE Zakazi
 (
  id_zakaz int IDENTITY(1,1) Primary key NOT NULL,
  Processor nvarchar(50) NOT NULL,
  FOREIGN KEY (Processor) references Sklad(Nazvanie) ON DELETE NO ACTION ON UPDATE NO ACTION,
  Ram nvarchar(50) NOT NULL,
  FOREIGN KEY (Ram) references Sklad(Nazvanie) ON DELETE NO ACTION ON UPDATE NO ACTION,
  JestkiyDisk nvarchar(50) NOT NULL,
  FOREIGN KEY (JestkiyDisk) references Sklad(Nazvanie) ON DELETE NO ACTION ON UPDATE NO ACTION,
  Videokarta nvarchar(50) NOT NULL,
  FOREIGN KEY (Videokarta) references Sklad(Nazvanie) ON DELETE NO ACTION ON UPDATE NO ACTION,
  StatusZakaza nvarchar(50),
  id_user int,
  FOREIGN KEY (id_user) references Users(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  id_injer int,
  FOREIGN KEY (id_injer) references Injeneri(id_inj) ON DELETE CASCADE ON UPDATE NO ACTION,
  id_curier int,
  FOREIGN KEY (id_curier) references Curieri(id_cur) ON DELETE CASCADE ON UPDATE NO ACTION
 );


INSERT INTO Users(Familia, Imja, Otchestvo, Mail, Adress)
values
('Петрова','Екатерина','Васильевна', 'ttt@mail.ru', 'город Москва улица Ленина дом 1 квартира 17'),
('Мишин','Дмитрий','Викторович', 'ouou@yandex.ru', 'город Владимир улица Владимирская дом 5 квартира 10'),
('Алексеева','Любовь','Владимировна', 'tfghj@mail.ru', 'город Омск улица Чайковского дом 15 квартира 105'),
('Кротов','Александр','Олегович', 'vivaviva@mail.ru', 'город Санкт-Петербург улица Фролова дом 3 квартира 3'),
('Андреева','Елизавета','Андреевна', 'lalala@mail.ru', 'город Москва улица Яблочная дом 39 квартира 67'),
('Фролова','Виолетта','Михайлова', 'zozo@mail.ru', 'город Москва улица Чехова дом 4 квартира 313'),
('Максимов','Максим','Максимович', 'kukuku@mail.ru', 'город Уфа улица Дятлова дом 45 квартира 450'),
('Пашин','Кирилл','Львович', 'podo@gmail.ru', 'город Ростов улица Центральная дом 34 квартира 123'),
('Ликов','Андрей', 'Андреевич', 'fggg@mail.ru', 'город Сочи улица Грушина дом 67 квартира 15'),
('Адронова','Анна','Дмитриевна', 'lolololo@gmail.ru', 'город Санкт-Петербург улица Зобова дом 16 квартира 99');

INSERT INTO Sklad(Nazvanie, Colvo, Price, Tip)
values
('Processor1', 10, 30000, 'Processor'),
('Videokarta1', 5, 60000, 'Videokarta'),
('Ram1x2ГБ', 2, 10000, 'Ram'),
('Videokarta2', 15, 45000, 'Videokarta'),
('Ram2x4ГБ', 8, 15000, 'Ram'),
('JestkiyDisk1x1ТБ', 4, 8000, 'JestkiyDisk'),
('Processor2', 20, 40000, 'Processor'),
('JestkiyDisk2x2ТБ', 9, 10000, 'JestkiyDisk'),
('Videokarta3', 16, 35000, 'Videokarta'),
('Ram3x8ГБ', 14, 20000, 'Ram');

INSERT INTO Injeneri(ColvoComp)
values
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1);

INSERT INTO Curieri(ColvoDostavok, CarNumber)
values
(1, 'К999МФА'),
(1, 'Р764АА'),
(1, 'ДД513Ж'),
(1, 'Г456ЛТ'),
(1, 'С808ХХ'),
(1, 'У131ЦХ'),
(1, 'С640АК'),
(1, 'Б673ББ'),
(1, 'В134УУ'),
(1, 'Ф345ЦЖ');

INSERT INTO Zakazi(Processor, Ram, JestkiyDisk, Videokarta, StatusZakaza, id_user, id_injer, id_curier)
values
('Processor1', 'Ram3x8ГБ', 'JestkiyDisk1x1ТБ', 'Videokarta2', 'Доставлен', 5, 1, 1),
('Processor2', 'Ram2x4ГБ', 'JestkiyDisk1x1ТБ', 'Videokarta3', 'Доставлен', 9, 2, 2),
('Processor1', 'Ram1x2ГБ', 'JestkiyDisk2x2ТБ', 'Videokarta3', 'Доставлен', 4, 3, 3),
('Processor2', 'Ram2x4ГБ', 'JestkiyDisk2x2ТБ', 'Videokarta1', 'Доставлен', 3, 4, 4),
('Processor2', 'Ram1x2ГБ', 'JestkiyDisk1x1ТБ', 'Videokarta1', 'Доставлен', 1, 5, 5),
('Processor1', 'Ram3x8ГБ', 'JestkiyDisk1x1ТБ', 'Videokarta2', 'Доставлен', 8, 6, 6),
('Processor1', 'Ram3x8ГБ', 'JestkiyDisk2x2ТБ', 'Videokarta3', 'Доставлен', 10, 7, 7),
('Processor2', 'Ram1x2ГБ', 'JestkiyDisk1x1ТБ', 'Videokarta1', 'Доставлен', 2, 8, 8),
('Processor1', 'Ram2x4ГБ', 'JestkiyDisk1x1ТБ', 'Videokarta3', 'Доставлен', 7, 9, 9),
('Processor2', 'Ram2x4ГБ', 'JestkiyDisk2x2ТБ', 'Videokarta2', 'Доставлен', 6, 10, 10);


ALTER TABLE Zakazi
ADD DEFAULT '1' FOR id_injer;

ALTER TABLE Zakazi
ADD DEFAULT '1' FOR id_curier;

ALTER TABLE Zakazi
ADD DEFAULT '???' FOR StatusZakaza;

/* Админ */

CREATE PROCEDURE dbo.Zakazi_Update_ForAdmin
       @id int,
       @id_injer int = NULL,
	   @id_curier int = NULL
AS 
BEGIN 
     SET NOCOUNT ON 
	 UPDATE Zakazi SET id_injer = @id_injer Where id_zakaz = @id
	 UPDATE Zakazi SET id_curier = @id_curier Where id_zakaz = @id
     UPDATE Zakazi SET StatusZakaza = 'Готов к сборке' Where id_zakaz = @id
END 
GO
exec dbo.Zakazi_Update_ForAdmin
       @id = 11,
       @id_injer = 10,
	   @id_curier = 10
go


CREATE PROCEDURE dbo.Curieri_Insert
	   @ColvoDostavok int = NULL,
	   @CarNumber NVARCHAR(50) = NULL
AS 
BEGIN 
     SET NOCOUNT ON 
     INSERT INTO dbo.Curieri
          (ColvoDostavok, CarNumber) 
     VALUES 
          ( 
       @ColvoDostavok,
	   @CarNumber
          ) 
END 
GO
exec dbo.Curieri_Insert
       @ColvoDostavok = 0,
	   @CarNumber = 'К999АК' 
go

CREATE PROCEDURE dbo.Injeneri_Insert
	   @ColvoComp int = NULL
AS 
BEGIN 
     SET NOCOUNT ON 
     INSERT INTO dbo.Injeneri
          (ColvoComp) 
     VALUES 
          ( 
       @ColvoComp
          ) 
END 
GO
exec dbo.Injeneri_Insert
       @ColvoComp = 0
go

CREATE PROCEDURE dbo.Sklad_Insert
       @Nazvanie NVARCHAR(50) = NULL,
	   @Colvo int = NULL,
	   @Price int = NULL,
	   @Tip NVARCHAR(50) = NULL
	  
AS 
BEGIN 
     SET NOCOUNT ON 
     INSERT INTO dbo.Sklad
          (Nazvanie, Colvo, Price, Tip) 
     VALUES 
          ( 
       @Nazvanie,
	   @Colvo,
	   @Price,
	   @Tip 
          ) 
END 
GO
exec dbo.Sklad_Insert
       @Nazvanie = 'Processor3',
	   @Colvo = 6,
	   @Price = 55000,
	   @Tip = 'Processor' 
go


CREATE PROCEDURE dbo.Drop_Inj
	    @id_injer int
AS 
BEGIN 
     SET NOCOUNT ON 
     DELETE FROM Injeneri WHERE id_inj = @id_injer
END 
GO
exec Drop_Inj'6'
go

CREATE PROCEDURE dbo.Drop_Cur
	    @id_curier int
AS 
BEGIN 
     SET NOCOUNT ON 
     DELETE FROM Curieri WHERE id_cur = @id_curier
END 
GO
exec Drop_Cur'5'
go


CREATE VIEW Users_View 
 AS
 SELECT * FROM Users
GO
select * from Users_View
go

CREATE VIEW Curieri_View AS
 SELECT * FROM Curieri
GO
select * from Curieri_View
go

CREATE VIEW Injeneri_View AS
 SELECT * FROM Injeneri
GO
select * from Injeneri_View
go

CREATE VIEW Sklad_View AS
 SELECT * FROM Sklad
GO
SELECT * FROM Sklad_View
go

CREATE VIEW Zakazi_View AS
 SELECT * FROM Zakazi
GO
select * from Zakazi_View
go



/* Клиент */


CREATE PROCEDURE dbo.Users_Insert
       @Familia NVARCHAR(50) = NULL,
	   @Imja NVARCHAR(50) = NULL,
       @Otchestvo NVARCHAR(50) = NULL,
	   @Mail NVARCHAR(50) = NULL,
       @Adress NVARCHAR(100) = NULL
AS 
BEGIN 
     SET NOCOUNT ON 
     INSERT INTO dbo.Users
          (Familia, Imja, Otchestvo, Mail, Adress) 
     VALUES 
          ( 
       @Familia,
	   @Imja,
       @Otchestvo,
	   @Mail,
       @Adress
          ) 
END 
GO
exec dbo.Users_Insert
       @Familia = 'Перов',
	   @Imja = 'Дмитрий',
       @Otchestvo = 'Иванович',
	   @Mail = 'ou@yandex.ru',
       @Adress = 'город Москва улица Ленина дом 2 квартира 229'
go


CREATE PROCEDURE dbo.Zakazi_Insert
       @Processor NVARCHAR(50) = NULL,
	   @Ram NVARCHAR(50) = NULL,
       @JestkiyDisk NVARCHAR(50) = NULL,
	   @Videokarta NVARCHAR(50) = NULL,
	   @id_user int = NULL
AS 
BEGIN 
     SET NOCOUNT ON 
     INSERT INTO dbo.Zakazi
          (Processor, Ram, JestkiyDisk, Videokarta, id_user) 
     VALUES 
          ( 
       @Processor,
	   @Ram,
       @JestkiyDisk,
	   @Videokarta,
	   @id_user
          ) 
END 
GO
exec dbo.Zakazi_Insert
       @Processor = 'Processor2',
	   @Ram = 'Ram3x8ГБ',
       @JestkiyDisk = 'JestkiyDisk2x2ТБ',
	   @Videokarta = 'Videokarta3',
	   @id_user = 5
go

CREATE FUNCTION Spisok_Zakazov_Client 
   (@id int)
   RETURNS TABLE
   AS
   RETURN 
   (
        Select * from Zakazi where id_user = @id
   )
   GO
SELECT * FROM dbo.Spisok_Zakazov_Client(1) 
GO



/* Курьер */

CREATE VIEW For_Cur_View AS
 Select * from Users, Zakazi where (StatusZakaza = 'Готов к доставке') and (Users.id = Zakazi.id_user)
Go
select * from For_Cur_View
go

CREATE PROCEDURE dbo.Cur_Zakazi_Update
	    @id int
AS 
BEGIN 
     SET NOCOUNT ON 
     UPDATE Zakazi SET StatusZakaza = 'Доставлен' Where id_zakaz = @id
	 UPDATE Curieri SET ColvoDostavok = ColvoDostavok + 1 Where id_cur = (Select id_curier from Zakazi where id_zakaz = @id)
END 
GO
exec Cur_Zakazi_Update'1'
go

/* Инженер */

CREATE VIEW For_Inj_View AS
 Select * from Users, Zakazi where (StatusZakaza = 'Готов к сборке') and (Users.id = Zakazi.id_user)
Go
select * from For_Inj_View
go

Select * from Sklad_View
go

CREATE PROCEDURE dbo.Inj_Zakazi_Sklad_Update
	    @id int
AS 
BEGIN 
     SET NOCOUNT ON 
     UPDATE Zakazi SET StatusZakaza = 'Готов к доставке' Where id_zakaz = @id
	 UPDATE Injeneri SET ColvoComp = ColvoComp + 1 Where id_inj = (Select id_injer from Zakazi where id_zakaz = @id)
	 UPDATE Sklad SET Colvo = Colvo - 1 Where Nazvanie = (Select Processor from Zakazi where id_zakaz = @id)   
	 UPDATE Sklad SET Colvo = Colvo - 1 Where Nazvanie = (Select Ram from Zakazi where id_zakaz = @id)   
	 UPDATE Sklad SET Colvo = Colvo - 1 Where Nazvanie = (Select JestkiyDisk from Zakazi where id_zakaz = @id)   
	 UPDATE Sklad SET Colvo = Colvo - 1 Where Nazvanie = (Select Videokarta from Zakazi where id_zakaz = @id)   
END 
GO
exec Inj_Zakazi_Sklad_Update'11'
go

CREATE PROCEDURE dbo.Sklad_Insert
       @Nazvanie NVARCHAR(50) = NULL,
	   @Colvo int = NULL,
	   @Price int = NULL,
	   @Tip NVARCHAR(50) = NULL
	  
AS 
BEGIN 
     SET NOCOUNT ON 
     INSERT INTO dbo.Sklad
          (Nazvanie, Colvo, Price, Tip) 
     VALUES 
          ( 
       @Nazvanie,
	   @Colvo,
	   @Price,
	   @Tip 
          ) 
END 
GO
exec dbo.Sklad_Insert
       @Nazvanie = 'Processor3',
	   @Colvo = 6,
	   @Price = 55000,
	   @Tip = 'Processor' 
go


CREATE TRIGGER delet on Injeneri
INSTEAD OF DELETE
AS
begin
 SELECT * from deleted
 RAISERROR ('Запрещено',16,0);  
end 
GO


CREATE TRIGGER delet2 on Curieri
INSTEAD OF DELETE
AS
begin
 SELECT * from deleted
 RAISERROR ('Запрещено',16,0);  
end 
GO


drop table Zakazi
drop table Users
drop table Sklad
drop table Injeneri
drop table Curieri