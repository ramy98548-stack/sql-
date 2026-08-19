-- =========================================================
-- 02_Library.sql
-- Sample database for SQL / Business Analysis practice
-- =========================================================

IF DB_ID('LibraryDB') IS NOT NULL
BEGIN
    ALTER DATABASE LibraryDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE LibraryDB;
END
GO

CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

-- =========================================================
-- TABLE CREATION
-- =========================================================

CREATE TABLE Authors (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    AuthorID INT NOT NULL,
    CategoryID INT NOT NULL,
    PublishYear INT NOT NULL,
    Price DECIMAL(6,2) NOT NULL,
    AvailableCopies INT NOT NULL,
    CONSTRAINT FK_Books_Authors FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    CONSTRAINT FK_Books_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO

CREATE TABLE Members (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL,
    MembershipType VARCHAR(20) NOT NULL,
    CONSTRAINT CK_Members_MembershipType CHECK (MembershipType IN ('Standard', 'Premium', 'Student'))
);
GO

CREATE TABLE Borrowings (
    BorrowingID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE NULL,
    Status VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Borrowings_Books FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT FK_Borrowings_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    CONSTRAINT CK_Borrowings_Status CHECK (Status IN ('Returned', 'Borrowed', 'Overdue'))
);
GO

-- =========================================================
-- DATA INSERTION
-- =========================================================

-- Authors
INSERT INTO Authors (FirstName, LastName, Country) VALUES
('Ellen', 'Marsh', 'USA'),
('Marcus', 'Reid', 'UK'),
('Sofia', 'Alvarez', 'Spain'),
('Kenji', 'Tanaka', 'Japan'),
('Amara', 'Okafor', 'Nigeria'),
('Liam', 'O''Brien', 'Ireland'),
('Priya', 'Nair', 'India'),
('Nils', 'Bergström', 'Sweden'),
('Isabelle', 'Laurent', 'France'),
('Thomas', 'Weber', 'Germany');
GO

-- Categories
INSERT INTO Categories (CategoryName) VALUES
('Fiction'),
('Science'),
('History'),
('Biography'),
('Fantasy'),
('Mystery'),
('Self-Help'),
('Poetry');
GO

-- Books
INSERT INTO Books (Title, AuthorID, CategoryID, PublishYear, Price, AvailableCopies) VALUES
('Whispering Pines', 2, 3, 1989, 26.14, 2),
('The Cartographer''s Daughter', 7, 8, 1994, 32.0, 3),
('The Forgotten Kingdom', 4, 2, 1996, 31.16, 2),
('The Quiet Revolution', 6, 6, 2014, 12.04, 3),
('The Glass Orchard', 7, 4, 2011, 16.36, 3),
('The Glassblower''s Apprentice', 3, 2, 1997, 31.76, 1),
('Winter''s Compass', 4, 5, 1975, 8.81, 5),
('The Mapmaker''s Error', 7, 5, 1995, 9.49, 1),
('Letters to No One', 5, 7, 2018, 20.73, 2),
('A Brief History of Silence', 3, 4, 2017, 22.37, 1),
('The Silent Garden', 8, 1, 1975, 11.4, 4),
('A Thousand Paper Cranes', 8, 6, 1983, 7.25, 1),
('A History of Salt', 4, 5, 1985, 24.65, 0),
('The Painter of Winter', 2, 4, 1975, 16.96, 5),
('The Last Cartographer', 2, 1, 2004, 33.9, 5),
('The Salt Line', 5, 6, 2006, 13.44, 2),
('Fireflies in November', 8, 8, 1986, 8.57, 4),
('Letters from the Hollow', 8, 5, 1989, 8.86, 2),
('The Last Voyage of the Meridian', 1, 1, 1978, 24.93, 5),
('Northern Constellations', 10, 4, 1999, 32.08, 3),
('Echoes of the Deep', 10, 6, 1998, 15.35, 2),
('The Lighthouse Keeper''s Diary', 4, 1, 2010, 21.81, 5),
('Ember and Stone', 8, 4, 2009, 22.32, 2),
('The Wanderer''s Atlas', 4, 5, 1994, 25.34, 5),
('Shadows Over Millbrook', 2, 8, 2019, 34.25, 2),
('The Bookbinder''s Promise', 4, 3, 2001, 24.11, 1),
('Beneath the Ashwood Tree', 1, 8, 2023, 22.23, 4),
('The Vanishing Coastline', 6, 3, 1990, 27.55, 2),
('Fields of Amber', 4, 1, 1998, 25.97, 2),
('The Bee Keeper''s Notebook', 4, 2, 1985, 32.66, 4),
('The Copper Kettle', 1, 5, 2019, 16.29, 2),
('The Iron Garden', 6, 1, 1984, 27.29, 3),
('The Empire of Salt', 1, 1, 1994, 31.11, 3),
('The Alchemist''s Garden', 6, 1, 1979, 17.51, 4),
('Blue Hour', 6, 8, 1983, 33.33, 2),
('Songs of the Estuary', 9, 3, 1986, 26.28, 2),
('Autumn in Kestrel Bay', 4, 3, 2020, 31.23, 4),
('A Thousand Small Lights', 4, 2, 1976, 24.38, 4),
('Wild Honey and Ash', 4, 7, 2009, 7.03, 3),
('Stormlight Harbor', 4, 7, 2008, 25.59, 2),
('The Weaver''s Daughter', 6, 2, 1998, 24.25, 1),
('The Clockmaker''s Secret', 8, 5, 2024, 17.35, 3),
('The Midnight Archive', 7, 5, 2009, 21.72, 1),
('The Orchard Keeper', 2, 3, 2020, 29.29, 2),
('River of Ash', 3, 5, 2022, 13.56, 2),
('Between Two Rivers', 8, 2, 1979, 34.37, 1),
('A Field Guide to Grief', 8, 1, 1978, 29.57, 3),
('Voices from the Marsh', 7, 3, 1993, 12.31, 2),
('Roots of the Old Oak', 1, 6, 2020, 27.0, 0),
('The Hollow Crown', 4, 3, 2002, 29.75, 2);
GO

-- Members
INSERT INTO Members (FirstName, LastName, City, JoinDate, MembershipType) VALUES
('Olivia', 'Tucker', 'Lakeside', '2022-02-25', 'Standard'),
('Noah', 'Adler', 'Elmwood', '2025-08-15', 'Standard'),
('Emma', 'Hayes', 'Springfield', '2021-09-28', 'Standard'),
('Liam', 'Holt', 'Millbrook', '2025-04-15', 'Student'),
('Ava', 'Underwood', 'Hamilton', '2023-04-14', 'Premium'),
('William', 'Mitchell', 'Ashford', '2025-11-06', 'Standard'),
('Sophia', 'Bennett', 'Lakeside', '2024-07-08', 'Student'),
('James', 'Vance', 'Millbrook', '2024-05-21', 'Premium'),
('Isabella', 'Coleman', 'Kingsport', '2021-02-06', 'Student'),
('Benjamin', 'Vance', 'Elmwood', '2026-04-18', 'Standard'),
('Mia', 'Sutton', 'Kingsport', '2022-02-24', 'Premium'),
('Lucas', 'Ives', 'Fairview', '2024-10-07', 'Student'),
('Charlotte', 'Hayes', 'Brookfield', '2024-05-07', 'Student'),
('Henry', 'Coleman', 'Hamilton', '2021-05-11', 'Standard'),
('Amelia', 'Barlow', 'Rivertown', '2024-04-21', 'Standard'),
('Alexander', 'Keller', 'Brookfield', '2021-08-18', 'Standard'),
('Harper', 'Ives', 'Lakeside', '2020-09-12', 'Student'),
('Michael', 'Foster', 'Brookfield', '2023-04-10', 'Premium'),
('Evelyn', 'Chandler', 'Oakdale', '2025-02-22', 'Premium'),
('Daniel', 'Vance', 'Rivertown', '2025-02-10', 'Student'),
('Abigail', 'Mitchell', 'Springfield', '2020-08-09', 'Premium'),
('Jacob', 'Quinn', 'Millbrook', '2024-09-26', 'Standard'),
('Emily', 'Ellis', 'Hamilton', '2022-01-22', 'Standard'),
('Logan', 'Norris', 'Greenville', '2022-04-23', 'Standard'),
('Ella', 'Parker', 'Bristow', '2023-03-19', 'Student'),
('Jackson', 'Owens', 'Oakdale', '2022-03-07', 'Standard'),
('Scarlett', 'Bennett', 'Fairview', '2023-04-27', 'Premium'),
('Sebastian', 'Jenkins', 'Hamilton', '2024-06-05', 'Premium'),
('Grace', 'Chandler', 'Hamilton', '2024-11-27', 'Standard'),
('Aiden', 'Lambert', 'Ashford', '2021-12-01', 'Student'),
('Chloe', 'Jasper', 'Rivertown', '2025-05-29', 'Student'),
('Matthew', 'Parker', 'Kingsport', '2020-11-01', 'Standard'),
('Victoria', 'Mitchell', 'Clayton', '2023-03-09', 'Student'),
('Samuel', 'Coleman', 'Lakeside', '2020-08-29', 'Standard'),
('Riley', 'Ward', 'Denton', '2024-10-13', 'Premium'),
('David', 'Mitchell', 'Kingsport', '2023-10-10', 'Standard'),
('Aria', 'Sutton', 'Greenville', '2021-09-18', 'Premium'),
('Joseph', 'Coleman', 'Greenville', '2021-09-25', 'Student'),
('Lily', 'Jasper', 'Oakdale', '2022-05-05', 'Standard'),
('Carter', 'Reyes', 'Greenville', '2023-12-27', 'Premium');
GO

-- Borrowings
INSERT INTO Borrowings (BookID, MemberID, BorrowDate, DueDate, ReturnDate, Status) VALUES
(4, 39, '2025-11-25', '2026-08-22', NULL, 'Borrowed'),
(5, 9, '2025-07-27', '2025-08-17', '2025-08-05', 'Returned'),
(29, 16, '2026-03-20', '2026-04-10', '2026-04-12', 'Returned'),
(50, 16, '2026-02-08', '2026-03-01', '2026-02-24', 'Returned'),
(29, 38, '2026-01-28', '2026-02-18', NULL, 'Overdue'),
(50, 7, '2026-01-12', '2026-02-02', NULL, 'Overdue'),
(34, 1, '2025-07-21', '2025-08-11', '2025-07-30', 'Returned'),
(20, 40, '2025-09-02', '2025-09-23', '2025-09-13', 'Returned'),
(1, 25, '2026-06-21', '2026-07-12', '2026-06-24', 'Returned'),
(20, 26, '2025-01-12', '2025-02-02', '2025-01-17', 'Returned'),
(21, 4, '2025-02-10', '2025-03-03', '2025-02-25', 'Returned'),
(41, 27, '2025-05-25', '2025-06-15', '2025-06-05', 'Returned'),
(34, 19, '2025-11-07', '2026-08-19', NULL, 'Borrowed'),
(45, 38, '2026-04-27', '2026-05-18', '2026-05-06', 'Returned'),
(38, 32, '2025-01-22', '2025-02-12', '2025-02-14', 'Returned'),
(18, 32, '2026-04-26', '2026-05-17', '2026-05-05', 'Returned'),
(45, 34, '2026-03-21', '2026-04-11', '2026-03-27', 'Returned'),
(5, 38, '2025-08-30', '2026-08-22', NULL, 'Borrowed'),
(20, 31, '2025-07-15', '2025-08-05', '2025-07-29', 'Returned'),
(18, 21, '2025-07-31', '2025-08-21', NULL, 'Overdue'),
(30, 38, '2025-09-06', '2025-09-27', '2025-10-01', 'Returned'),
(1, 5, '2026-01-20', '2026-02-10', NULL, 'Overdue'),
(18, 14, '2026-02-13', '2026-08-17', NULL, 'Borrowed'),
(39, 16, '2025-09-17', '2025-10-08', '2025-10-06', 'Returned'),
(45, 19, '2026-05-26', '2026-06-16', '2026-05-31', 'Returned'),
(1, 7, '2025-02-07', '2025-02-28', '2025-02-23', 'Returned'),
(18, 1, '2025-02-01', '2025-02-22', NULL, 'Overdue'),
(19, 29, '2025-02-10', '2025-03-03', '2025-03-06', 'Returned'),
(1, 5, '2025-09-15', '2026-08-14', NULL, 'Borrowed'),
(50, 33, '2025-09-25', '2025-10-16', '2025-10-13', 'Returned'),
(6, 12, '2025-09-22', '2025-10-13', '2025-10-12', 'Returned'),
(50, 33, '2026-05-04', '2026-05-25', NULL, 'Overdue'),
(34, 26, '2026-02-25', '2026-03-18', '2026-03-19', 'Returned'),
(18, 35, '2025-04-23', '2025-05-14', '2025-05-06', 'Returned'),
(20, 14, '2025-11-27', '2025-12-18', '2025-12-10', 'Returned'),
(34, 14, '2025-05-18', '2025-06-08', '2025-06-08', 'Returned'),
(23, 8, '2025-02-22', '2025-03-15', '2025-02-26', 'Returned'),
(34, 38, '2026-07-13', '2026-08-03', '2026-08-04', 'Returned'),
(1, 32, '2025-04-08', '2025-04-29', '2025-05-01', 'Returned'),
(43, 7, '2025-09-07', '2025-09-28', '2025-09-28', 'Returned'),
(21, 36, '2026-03-29', '2026-04-19', '2026-04-22', 'Returned'),
(1, 21, '2025-10-12', '2025-11-02', NULL, 'Overdue'),
(45, 19, '2026-01-10', '2026-01-31', '2026-01-30', 'Returned'),
(1, 25, '2025-06-29', '2025-07-20', '2025-07-16', 'Returned'),
(34, 7, '2025-12-19', '2026-01-09', '2025-12-28', 'Returned'),
(1, 27, '2026-04-09', '2026-04-30', '2026-04-19', 'Returned'),
(42, 35, '2025-10-21', '2025-11-11', '2025-11-02', 'Returned'),
(35, 7, '2025-11-29', '2026-08-21', NULL, 'Borrowed'),
(1, 22, '2025-08-14', '2025-09-04', '2025-08-20', 'Returned'),
(45, 37, '2025-04-21', '2025-05-12', '2025-05-15', 'Returned'),
(30, 10, '2026-03-10', '2026-03-31', '2026-03-30', 'Returned'),
(20, 29, '2025-05-24', '2025-06-14', '2025-06-04', 'Returned'),
(38, 13, '2026-01-04', '2026-01-25', '2026-01-29', 'Returned'),
(18, 5, '2025-01-17', '2025-02-07', '2025-02-02', 'Returned'),
(35, 13, '2025-03-06', '2025-03-27', '2025-03-27', 'Returned'),
(20, 17, '2025-03-16', '2025-04-06', '2025-04-07', 'Returned'),
(45, 12, '2025-01-20', '2025-02-10', '2025-02-09', 'Returned'),
(45, 32, '2026-03-02', '2026-03-23', '2026-03-12', 'Returned'),
(34, 24, '2026-01-11', '2026-02-01', NULL, 'Overdue'),
(50, 24, '2025-03-28', '2025-04-18', '2025-04-10', 'Returned'),
(32, 29, '2025-04-25', '2025-05-16', NULL, 'Overdue'),
(49, 20, '2025-09-13', '2025-10-04', '2025-10-01', 'Returned'),
(50, 32, '2026-01-23', '2026-08-17', NULL, 'Borrowed'),
(33, 5, '2025-09-06', '2025-09-27', NULL, 'Overdue'),
(18, 21, '2026-01-14', '2026-02-04', NULL, 'Overdue'),
(1, 21, '2025-11-24', '2025-12-15', '2025-12-08', 'Returned'),
(2, 5, '2026-02-24', '2026-08-22', NULL, 'Borrowed'),
(45, 27, '2025-09-02', '2025-09-23', '2025-09-16', 'Returned'),
(45, 38, '2026-02-04', '2026-02-25', NULL, 'Overdue'),
(33, 27, '2026-05-17', '2026-06-07', '2026-06-11', 'Returned'),
(1, 21, '2025-07-19', '2025-08-09', NULL, 'Overdue'),
(50, 26, '2026-01-03', '2026-01-24', NULL, 'Overdue'),
(45, 2, '2025-05-23', '2025-06-13', NULL, 'Overdue'),
(29, 5, '2025-03-22', '2025-04-12', NULL, 'Overdue'),
(50, 2, '2025-01-03', '2025-01-24', '2025-01-09', 'Returned'),
(34, 16, '2026-04-22', '2026-05-13', '2026-05-03', 'Returned'),
(5, 16, '2026-03-16', '2026-04-06', '2026-04-07', 'Returned'),
(15, 8, '2026-01-07', '2026-01-28', NULL, 'Overdue'),
(37, 22, '2025-04-08', '2025-04-29', '2025-04-16', 'Returned'),
(20, 13, '2026-01-16', '2026-02-06', '2026-01-27', 'Returned'),
(30, 32, '2025-06-09', '2026-08-12', NULL, 'Borrowed'),
(5, 19, '2025-01-24', '2025-02-14', '2025-02-06', 'Returned'),
(36, 39, '2025-11-06', '2025-11-27', '2025-11-13', 'Returned'),
(45, 16, '2025-09-07', '2025-09-28', '2025-09-17', 'Returned'),
(50, 9, '2026-03-31', '2026-04-21', '2026-04-08', 'Returned'),
(34, 16, '2025-02-01', '2025-02-22', '2025-02-05', 'Returned'),
(45, 22, '2026-01-17', '2026-02-07', '2026-02-05', 'Returned'),
(38, 14, '2026-04-16', '2026-05-07', '2026-05-09', 'Returned'),
(1, 18, '2025-09-21', '2025-10-12', '2025-10-08', 'Returned'),
(4, 3, '2025-03-12', '2025-04-02', NULL, 'Overdue'),
(7, 36, '2025-04-17', '2025-05-08', '2025-04-30', 'Returned'),
(36, 14, '2026-03-03', '2026-03-24', '2026-03-28', 'Returned'),
(39, 32, '2026-02-06', '2026-02-27', '2026-02-09', 'Returned'),
(20, 7, '2026-04-08', '2026-04-29', '2026-04-12', 'Returned'),
(13, 7, '2026-05-16', '2026-06-06', '2026-06-07', 'Returned'),
(37, 5, '2025-07-01', '2025-07-22', '2025-07-22', 'Returned'),
(37, 16, '2025-11-16', '2025-12-07', '2025-11-21', 'Returned'),
(13, 26, '2026-04-23', '2026-05-14', '2026-05-07', 'Returned'),
(18, 4, '2025-01-10', '2025-01-31', '2025-01-21', 'Returned'),
(29, 2, '2026-02-02', '2026-02-23', '2026-02-25', 'Returned'),
(20, 18, '2025-11-29', '2025-12-20', '2025-12-24', 'Returned'),
(34, 35, '2025-08-06', '2025-08-27', NULL, 'Overdue'),
(18, 32, '2026-07-09', '2026-07-30', '2026-07-12', 'Returned'),
(7, 5, '2025-02-16', '2025-03-09', '2025-02-19', 'Returned'),
(49, 29, '2026-03-23', '2026-04-13', '2026-03-30', 'Returned'),
(1, 5, '2026-05-09', '2026-05-30', NULL, 'Overdue'),
(31, 38, '2025-12-26', '2026-01-16', NULL, 'Overdue'),
(1, 32, '2025-04-05', '2026-08-19', NULL, 'Borrowed'),
(1, 2, '2025-03-09', '2025-03-30', '2025-03-29', 'Returned'),
(5, 25, '2025-01-09', '2025-01-30', '2025-01-13', 'Returned'),
(45, 19, '2026-04-16', '2026-05-07', NULL, 'Overdue'),
(34, 32, '2026-01-13', '2026-02-03', '2026-02-01', 'Returned'),
(20, 3, '2025-04-23', '2025-05-14', '2025-05-10', 'Returned'),
(13, 7, '2025-03-09', '2025-03-30', '2025-03-14', 'Returned'),
(5, 21, '2025-02-24', '2025-03-17', '2025-03-01', 'Returned'),
(19, 32, '2025-07-14', '2025-08-04', NULL, 'Overdue'),
(25, 5, '2026-01-11', '2026-08-12', NULL, 'Borrowed'),
(30, 21, '2026-05-11', '2026-06-01', '2026-05-29', 'Returned'),
(7, 7, '2025-01-23', '2025-02-13', NULL, 'Overdue'),
(48, 32, '2025-03-19', '2025-04-09', '2025-03-29', 'Returned'),
(20, 35, '2025-01-19', '2025-02-09', '2025-01-29', 'Returned'),
(19, 26, '2025-01-03', '2025-01-24', '2025-01-17', 'Returned'),
(34, 24, '2025-02-25', '2025-03-18', '2025-03-08', 'Returned'),
(39, 2, '2026-03-28', '2026-04-18', '2026-04-18', 'Returned'),
(41, 33, '2025-01-15', '2025-02-05', '2025-01-19', 'Returned'),
(5, 14, '2025-12-14', '2026-01-04', NULL, 'Overdue'),
(5, 7, '2026-04-19', '2026-05-10', '2026-05-14', 'Returned'),
(1, 5, '2026-04-12', '2026-05-03', '2026-04-21', 'Returned'),
(18, 36, '2025-12-18', '2026-01-08', '2026-01-05', 'Returned'),
(1, 17, '2026-04-27', '2026-05-18', '2026-05-19', 'Returned'),
(1, 28, '2025-05-25', '2025-06-15', NULL, 'Overdue'),
(50, 25, '2025-05-31', '2025-06-21', '2025-06-25', 'Returned'),
(5, 38, '2026-04-16', '2026-05-07', '2026-05-01', 'Returned'),
(31, 1, '2026-04-15', '2026-05-06', '2026-04-26', 'Returned'),
(5, 2, '2025-06-03', '2025-06-24', '2025-06-19', 'Returned'),
(20, 1, '2026-05-16', '2026-06-06', '2026-06-09', 'Returned'),
(18, 20, '2025-04-16', '2025-05-07', '2025-05-01', 'Returned'),
(31, 21, '2025-09-21', '2025-10-12', '2025-10-16', 'Returned'),
(20, 35, '2026-03-20', '2026-04-10', '2026-03-29', 'Returned'),
(5, 23, '2025-05-23', '2025-06-13', '2025-05-31', 'Returned'),
(50, 30, '2025-11-23', '2025-12-14', '2025-11-30', 'Returned'),
(20, 36, '2025-09-22', '2026-08-19', NULL, 'Borrowed'),
(34, 27, '2026-03-18', '2026-04-08', NULL, 'Overdue'),
(20, 24, '2025-03-14', '2025-04-04', '2025-03-25', 'Returned'),
(1, 37, '2026-07-12', '2026-08-02', NULL, 'Overdue'),
(1, 1, '2026-05-18', '2026-08-22', NULL, 'Borrowed'),
(45, 21, '2025-06-21', '2025-07-12', '2025-07-10', 'Returned'),
(22, 21, '2025-02-26', '2025-03-19', NULL, 'Overdue'),
(1, 30, '2026-03-04', '2026-03-25', '2026-03-14', 'Returned'),
(2, 13, '2026-06-29', '2026-07-20', '2026-07-12', 'Returned');
GO

/*1- categories have the highest number of books*/

select 
c.categoryname ,
count(b.bookid) as numberofBooks
from Categories c 
inner join Books b 
on c.CategoryID = b.CategoryID 
group by  c.categoryname 
order by numberofBooks desc ;

/*2-Which books are borrowed the most*/

SELECT 
B.Title,
COUNT(BO.BorrowingID) AS CountBorrowingBOOKS
FROM Books B
INNER JOIN Borrowings BO
ON B.BookID = BO.BookID
GROUP BY B.Title
ORDER BY CountBorrowingBOOKS DESC;

/*3-Which cities have the highest number of library members*/

Select 
city ,
count (memberid) as numofmembers 
from members m 
group by city 
order by numofmembers desc ; 

/*4- members have borrowed the most books*/ 

select 
m.firstname + ' ' + m.lastname as membername ,
count(b.borrowingid) as NumberOfBorrowings
from Members m
inner join Borrowings b 
on m.MemberID = b.MemberID 
group by m.firstname , m.lastname  
order by NumberOfBorrowings

/* 5 - Never Borrowed */

SELECT Books.Title
FROM Books
LEFT JOIN Borrowings
    ON Books.BookID = Borrowings.BookID
WHERE Borrowings.BookID IS NULL;


/*6 - Members Who Returned Books Late */

Select DISTINCT 
Members.FirstName ,
Members.LastName ,
from Members INNER JOIN Borrowings 
on Members.MemberID = Borrowings.MemberID
where Borrowings.ReturnDate> Borrowings.DueDate;


/*7 - Categories That have highest Numbers of Borrowing */

Select Categories.CategoryName ,
COUNT(*) AS Total 
from Categories INNER JOIN Books
on Categories.CategoryID=Books.CategoryID
INNER JOIN Borrowings 
on Books.BookID=Borrowings.BookID
ORDER BY COUNT(*) DESC;

/*8 - Member Borrowed The Most Different Books */

Select Top 1
Members.FirstName,
Members.LastName ,
COUNT (DISTINCT Borrowings.BookID) AS Different 
from Members INNER JOIN Borrowings
on Members.MemberID =Borrowings.MemberID
Group by Members.MemberID , Members.FirstName , Members.LastName 
Order by COUNT (DISTINCT Borrowings.BookID) DESC ;


/* 9 - Books Borrowed More Than Once */

Select Books.Title ,
COUNT (*) AS Total
from Books INNER JOIN Borrowings
on Books.BookID = Borrowings.BookID
group by Books.BOOKID , Books.Title
Having COUNT(*) >1 ;


/* 10 - Members Who Borrowed Books From More Than One Category */

select Members.FirstName,
Members.LastName,
COUNT(DISTINCT Books.CategoryID) AS Different 
From Members INNER JOIN Borrowings
on Members.MemberID=Borrowings.MemberID
INNER JOIN Books
on Borrowings.BookID=Books.BookID
GROUP BY Members.FirstName , Members.LastName , Members.MemberID
Having COUNT(DISTINCT Books.CategoryID)>1;