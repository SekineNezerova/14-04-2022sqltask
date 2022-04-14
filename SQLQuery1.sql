create database Library
use Library

create table Authors(
  Id int primary key identity,
  Name nvarchar(50),
  Surname nvarchar(50),
)
INSERT into Authors(Name, Surname) VALUES (N'William', N'Shakespeare')
INSERT into Authors(Name, Surname) VALUES (N'Leo', N'Tolstoy')
INSERT into Authors(Name, Surname) VALUES (N'Mario', N'Puzo')
INSERT into Authors(Name, Surname) VALUES (N'Stephen ', N'King')

create table Genres(
  Id int primary key identity,
  Name nvarchar(50),
)
INSERT into Genres(Name) VALUES ( N'Tragedy')
INSERT into Genres(Name) VALUES ( N'Horror')
INSERT into Genres(Name) VALUES ( N'Mystery')
INSERT into Genres(Name) VALUES ( N'Realist')
INSERT into Genres(Name) VALUES ( N'Historical')

alter table Genres
drop column Surname;

create table Books(
  Id int primary key identity,
  Name nvarchar(50),
  AuthorId int references Authors(Id),
  GenreId int references Genres(Id)
  )
INSERT into Books(Name, AuthorId,GenreId) VALUES ( N'If It Bleeds', 4, 2)
INSERT into Books(Name, AuthorId,GenreId) VALUES ( N'The GodFather', 3, 3)
INSERT into Books(Name, AuthorId,GenreId) VALUES ( N'Hamlet', 1, 1)
INSERT into Books(Name, AuthorId,GenreId) VALUES ( N'Anna Karanina', 2, 4)
INSERT into Books(Name, AuthorId,GenreId) VALUES ( N'War and Peace', 2, 5)


    Select* from Books as b
  join Genres as g
  on b.GenreId=g.Id
  join Authors as a
  on b.AuthorId=a.Id

  Select b.Name 'Book Name',a.Name 'Author Name',g.Name 'Genre Name' from Books as b
  join Genres as g
  on b.GenreId=g.Id
  join Authors as a
  on b.AuthorId=a.Id
  