-- Create Posters Table
CREATE TABLE Posters (
    Poster_ID INT PRIMARY KEY,
    Description VARCHAR(255)
);

-- Create Movies Table
CREATE TABLE Movies (
    Title VARCHAR(255),
    Year INT,
    Rating FLOAT,
    Poster_ID INT,
    PRIMARY KEY (Title, Year),
    FOREIGN KEY (Poster_ID) REFERENCES Posters(Poster_ID)
);

-- Create MovieGenres Table
CREATE TABLE MovieGenres (
    Title VARCHAR(255),
    Year INT,
    Genre VARCHAR(255),
    FOREIGN KEY (Title, Year) REFERENCES Movies(Title, Year)
);


INSERT INTO Posters (Poster_ID, Description)
VALUES
(1, 'Shawshank poster'),
(2, 'Godfather poster'),
(3, 'Dark Knight poster'),
(4, 'Pulp Fiction poster'),
(5, 'Schindler poster'),
(6, 'LotR poster'),
(7, 'Fight Club poster'),
(8, 'Forrest Gump poster'),
(9, 'Inception poster'),
(10, 'Star Wars poster');


INSERT INTO Movies (Title, Year, Rating, Poster_ID)
VALUES
('The Shawshank Redemption', 1994, 9.3, 1),
('The Godfather', 1972, 9.2, 2),
('The Dark Knight', 2008, 9.0, 3),
('Pulp Fiction', 1994, 8.9, 4),
('Schindler''s List', 1993, 8.9, 5),
('The Lord of the Rings: The Return of the King', 2003, 8.9, 6),
('Fight Club', 1999, 8.8, 7),
('Forrest Gump', 1994, 8.8, 8),
('Inception', 2010, 8.8, 9),
('Star Wars: Episode V - The Empire Strikes Back', 1980, 8.7, 10);

INSERT INTO MovieGenres (Title, Year, Genre)
VALUES
('The Shawshank Redemption', 1994, 'Drama'),
('The Godfather', 1972, 'Thriller'),
('The Godfather', 1972, 'Drama'),
('The Dark Knight', 2008, 'Action'),
('The Dark Knight', 2008, 'Thriller'),
('The Dark Knight', 2008, 'Drama'),
('Pulp Fiction', 1994, 'Thriller'),
('Pulp Fiction', 1994, 'Drama'),
('Schindler''s List', 1993, 'Adventure'),
('Schindler''s List', 1993, 'Drama'),
('The Lord of the Rings: The Return of the King', 2003, 'Action'),
('The Lord of the Rings: The Return of the King', 2003, 'Adventure'),
('The Lord of the Rings: The Return of the King', 2003, 'Drama'),
('Fight Club', 1999, 'Drama'),
('Fight Club', 1999, 'Thriller'),
('Forrest Gump', 1994, 'Drama'),
('Forrest Gump', 1994, 'Adventure'),
('Inception', 2010, 'Action'),
('Inception', 2010, 'Adventure'),
('Inception', 2010, 'Thriller'),
('Star Wars: Episode V - The Empire Strikes Back', 1980, 'Action'),
('Star Wars: Episode V - The Empire Strikes Back', 1980, 'Adventure')

-- Create UserCredentials Table
CREATE TABLE UserCredentials (
    Username VARCHAR(255) PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    Privileges VARCHAR(255)
);

-- Create Users Table
CREATE TABLE Users (
    Users_ID INT PRIMARY KEY,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Username VARCHAR(255),
    FOREIGN KEY (Username) REFERENCES UserCredentials(Username)
);

INSERT INTO Users (Users_ID, First_Name, Last_Name, Contact, Email, Username)
VALUES
(1, 'Mubeen', 'Baig', '123-456-7890', 'mubeenbaig55@gmail.com', 'mubeen');

INSERT INTO UserCredentials (Username, Password, Privileges)
VALUES
('mubeen', 'defjam03', 'Admin');

-- Create Theatres Table
CREATE TABLE Theatres (
    Theatre_ID INT PRIMARY KEY,
    Theatre_Name VARCHAR(255) NOT NULL,
    Theatre_Screens INT NOT NULL
);

-- Create Schedules Table
CREATE TABLE Schedules (
    Schedule_ID INT PRIMARY KEY,
    Theatre_ID INT,
    Screen_Number INT NOT NULL,
    Movie_Title VARCHAR(255),
    Movie_Year INT,
    Schedule_Time DATETIME NOT NULL,
    Price_Per_Ticket DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Theatre_ID) REFERENCES Theatres(Theatre_ID),
    FOREIGN KEY (Movie_Title, Movie_Year) REFERENCES Movies(Title, Year)
);

-- Create Seats Table
CREATE TABLE Seats (
    Seat_ID INT PRIMARY KEY,
    Schedule_ID INT,
    Seat_Number VARCHAR(10) NOT NULL,
    Is_Available INT NOT NULL,
    FOREIGN KEY (Schedule_ID) REFERENCES Schedules(Schedule_ID)
);

-- Create Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Seat_ID INT,
    Payment_Type VARCHAR(50) NOT NULL,
    Total_Price DECIMAL(10, 2) NOT NULL,
    Username VARCHAR(255),
    FOREIGN KEY (Seat_ID) REFERENCES Seats(Seat_ID),
    FOREIGN KEY (Username) REFERENCES UserCredentials(Username)
);

INSERT INTO Theatres (Theatre_ID, Theatre_Name, Theatre_Screens)
VALUES
(1, 'Starlight Grand Theatre', 4),
(2, 'Echo Valley Playhouse', 3),
(3, 'Renaissance Theatre', 4),
(4, 'Aurora Cultural Theatre', 2);

INSERT INTO Schedules (Schedule_ID, Theatre_ID, Screen_Number, Movie_Title, Movie_Year, Schedule_Time, Price_Per_Ticket)
VALUES

(1, 1, 1, 'Star Wars', 1980, '2024-07-30 19:00:00', 10.00),
(2, 1, 2, 'The Shawshank Redemption', 1994, '2024-07-30 20:00:00', 12.00),
(3, 1, 3, 'Inception', 2010, '2024-07-30 21:00:00', 15.00),
(4, 1, 4, 'The Godfather', 1972, '2024-07-30 22:00:00', 14.00),
(5, 1, 5, 'The Dark Knight', 2008, '2024-07-30 23:00:00', 13.00),
(6, 2, 1, 'Pulp Fiction', 1994, '2024-07-30 19:00:00', 11.00),
(7, 2, 2, 'Schindler''s List', 1993, '2024-07-30 20:00:00', 12.50),
(8, 2, 3, 'The Godfather', 1972, '2024-07-30 21:00:00', 14.50),
(9, 2, 1, 'Fight Club', 1999, '2024-07-30 22:00:00', 13.50),
(10, 2, 2, 'Forrest Gump', 1994, '2024-07-30 23:00:00', 12.75),
(11, 3, 1, 'Schindler''s List', 1993, '2024-07-31 18:00:00', 13.00),
(12, 3, 2, 'Forrest Gump', 1994, '2024-07-31 19:00:00', 12.50),
(13, 3, 3, 'The Dark Knight', 2008, '2024-07-31 20:00:00', 11.50),
(14, 3, 4, 'Fight Club', 1999, '2024-07-31 21:00:00', 10.50),
(15, 4, 1, 'The Godfather', 1972, '2024-07-31 17:00:00', 14.00),
(16, 4, 2, 'Forrest Gump', 1994, '2024-07-31 18:00:00', 13.50),
(17, 4, 3, 'Star Wars', 1980, '2024-07-31 19:00:00', 12.75),
(18, 4, 4, 'Pulp Fiction', 1994, '2024-07-31 20:00:00', 13.00);


INSERT INTO Seats (Seat_ID, Schedule_ID, Seat_Number, Is_Available)
VALUES
(1, 1, 'A1', 1), (2, 1, 'A2', 1), (3, 1, 'A3', 1), (4, 1, 'A4', 1),
(5, 2, 'B1', 1), (6, 2, 'B2', 1), (7, 2, 'B3', 1), (8, 2, 'B4', 1),
(9, 3, 'C1', 1), (10, 3, 'C2', 1), (11, 3, 'C3', 1), (12, 3, 'C4', 1),
(13, 4, 'D1', 1), (14, 4, 'D2', 1), (15, 4, 'D3', 1), (16, 4, 'D4', 1),
(17, 5, 'E1', 1), (18, 5, 'E2', 1), (19, 5, 'E3', 1), (20, 5, 'E4', 1),
(21, 6, 'A1', 1), (22, 6, 'A2', 1), (23, 6, 'A3', 1), (24, 6, 'A4', 1),
(25, 7, 'B1', 1), (26, 7, 'B2', 1), (27, 7, 'B3', 1), (28, 7, 'B4', 1),
(29, 8, 'C1', 1), (30, 8, 'C2', 1), (31, 8, 'C3', 1), (32, 8, 'C4', 1),
(33, 9, 'D1', 1), (34, 9, 'D2', 1), (35, 9, 'D3', 1), (36, 9, 'D4', 1),
(37, 10, 'E1', 1), (38, 10, 'E2', 1), (39, 10, 'E3', 1), (40, 10, 'E4', 1);

SELECT * FROM Schedules
SELECT * FROM Theatres

SELECT Movie_Title, Movie_Year, Schedule_Time FROM Schedules WHERE Theatre_ID = (Select Theatre_ID from Theatres Where Theatre_Name = 'Aurora Cultural Theatre');