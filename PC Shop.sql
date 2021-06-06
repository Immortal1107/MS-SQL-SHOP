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
('�������','���������','����������', 'ttt@mail.ru', '����� ������ ����� ������ ��� 1 �������� 17'),
('�����','�������','����������', 'ouou@yandex.ru', '����� �������� ����� ������������ ��� 5 �������� 10'),
('���������','������','������������', 'tfghj@mail.ru', '����� ���� ����� ����������� ��� 15 �������� 105'),
('������','���������','��������', 'vivaviva@mail.ru', '����� �����-��������� ����� ������� ��� 3 �������� 3'),
('��������','���������','���������', 'lalala@mail.ru', '����� ������ ����� �������� ��� 39 �������� 67'),
('�������','��������','���������', 'zozo@mail.ru', '����� ������ ����� ������ ��� 4 �������� 313'),
('��������','������','����������', 'kukuku@mail.ru', '����� ��� ����� ������� ��� 45 �������� 450'),
('�����','������','�������', 'podo@gmail.ru', '����� ������ ����� ����������� ��� 34 �������� 123'),
('�����','������', '���������', 'fggg@mail.ru', '����� ���� ����� ������� ��� 67 �������� 15'),
('��������','����','����������', 'lolololo@gmail.ru', '����� �����-��������� ����� ������ ��� 16 �������� 99');

INSERT INTO Sklad(Nazvanie, Colvo, Price, Tip)
values
('Processor1', 10, 30000, 'Processor'),
('Videokarta1', 5, 60000, 'Videokarta'),
('Ram1x2��', 2, 10000, 'Ram'),
('Videokarta2', 15, 45000, 'Videokarta'),
('Ram2x4��', 8, 15000, 'Ram'),
('JestkiyDisk1x1��', 4, 8000, 'JestkiyDisk'),
('Processor2', 20, 40000, 'Processor'),
('JestkiyDisk2x2��', 9, 10000, 'JestkiyDisk'),
('Videokarta3', 16, 35000, 'Videokarta'),
('Ram3x8��', 14, 20000, 'Ram');

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
(1, '�999���'),
(1, '�764��'),
(1, '��513�'),
(1, '�456��'),
(1, '�808��'),
(1, '�131��'),
(1, '�640��'),
(1, '�673��'),
(1, '�134��'),
(1, '�345��');

INSERT INTO Zakazi(Processor, Ram, JestkiyDisk, Videokarta, StatusZakaza, id_user, id_injer, id_curier)
values
('Processor1', 'Ram3x8��', 'JestkiyDisk1x1��', 'Videokarta2', '���������', 5, 1, 1),
('Processor2', 'Ram2x4��', 'JestkiyDisk1x1��', 'Videokarta3', '���������', 9, 2, 2),
('Processor1', 'Ram1x2��', 'JestkiyDisk2x2��', 'Videokarta3', '���������', 4, 3, 3),
('Processor2', 'Ram2x4��', 'JestkiyDisk2x2��', 'Videokarta1', '���������', 3, 4, 4),
('Processor2', 'Ram1x2��', 'JestkiyDisk1x1��', 'Videokarta1', '���������', 1, 5, 5),
('Processor1', 'Ram3x8��', 'JestkiyDisk1x1��', 'Videokarta2', '���������', 8, 6, 6),
('Processor1', 'Ram3x8��', 'JestkiyDisk2x2��', 'Videokarta3', '���������', 10, 7, 7),
('Processor2', 'Ram1x2��', 'JestkiyDisk1x1��', 'Videokarta1', '���������', 2, 8, 8),
('Processor1', 'Ram2x4��', 'JestkiyDisk1x1��', 'Videokarta3', '���������', 7, 9, 9),
('Processor2', 'Ram2x4��', 'JestkiyDisk2x2��', 'Videokarta2', '���������', 6, 10, 10);


ALTER TABLE Zakazi
ADD DEFAULT '1' FOR id_injer;

ALTER TABLE Zakazi
ADD DEFAULT '1' FOR id_curier;

ALTER TABLE Zakazi
ADD DEFAULT '???' FOR StatusZakaza;

/* ����� */

CREATE PROCEDURE dbo.Zakazi_Update_ForAdmin
       @id int,
       @id_injer int = NULL,
	   @id_curier int = NULL
AS 
BEGIN 
     SET NOCOUNT ON 
	 UPDATE Zakazi SET id_injer = @id_injer Where id_zakaz = @id
	 UPDATE Zakazi SET id_curier = @id_curier Where id_zakaz = @id
     UPDATE Zakazi SET StatusZakaza = '����� � ������' Where id_zakaz = @id
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
	   @CarNumber = '�999��' 
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



/* ������ */


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
       @Familia = '�����',
	   @Imja = '�������',
       @Otchestvo = '��������',
	   @Mail = 'ou@yandex.ru',
       @Adress = '����� ������ ����� ������ ��� 2 �������� 229'
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
	   @Ram = 'Ram3x8��',
       @JestkiyDisk = 'JestkiyDisk2x2��',
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



/* ������ */

CREATE VIEW For_Cur_View AS
 Select * from Users, Zakazi where (StatusZakaza = '����� � ��������') and (Users.id = Zakazi.id_user)
Go
select * from For_Cur_View
go

CREATE PROCEDURE dbo.Cur_Zakazi_Update
	    @id int
AS 
BEGIN 
     SET NOCOUNT ON 
     UPDATE Zakazi SET StatusZakaza = '���������' Where id_zakaz = @id
	 UPDATE Curieri SET ColvoDostavok = ColvoDostavok + 1 Where id_cur = (Select id_curier from Zakazi where id_zakaz = @id)
END 
GO
exec Cur_Zakazi_Update'1'
go

/* ������� */

CREATE VIEW For_Inj_View AS
 Select * from Users, Zakazi where (StatusZakaza = '����� � ������') and (Users.id = Zakazi.id_user)
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
     UPDATE Zakazi SET StatusZakaza = '����� � ��������' Where id_zakaz = @id
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
 RAISERROR ('���������',16,0);  
end 
GO


CREATE TRIGGER delet2 on Curieri
INSTEAD OF DELETE
AS
begin
 SELECT * from deleted
 RAISERROR ('���������',16,0);  
end 
GO


drop table Zakazi
drop table Users
drop table Sklad
drop table Injeneri
drop table Curieri