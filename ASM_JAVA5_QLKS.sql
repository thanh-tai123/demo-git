
CREATE TABLE Users (
    IdUsers INT IDENTITY PRIMARY KEY,
    NameUsers NVARCHAR(50) NOT NULL,
    PhoneNumber NVARCHAR(15) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    PasswordUsers NVARCHAR(50) NOT NULL,
    Adress NVARCHAR(100) NOT NULL,
    CCCD NVARCHAR(15)
);

CREATE TABLE Employee (
    IdE NVARCHAR(10) PRIMARY KEY NOT NULL,
    NameE NVARCHAR(50) NOT NULL,
    PhoneNumberE NVARCHAR(15) NOT NULL,
    EmailE NVARCHAR(50) NOT NULL,
    PasswordE NVARCHAR(50) NOT NULL,
    RoleE BIT NOT NULL,
    AdressE NVARCHAR(100) NOT NULL,
    CCCDE NVARCHAR(15) NOT NULL,
    Img NVARCHAR(50)
);

CREATE TABLE Rooms (
    IdRooms NVARCHAR(10) PRIMARY KEY NOT NULL,
    IdUsers INT,
    Title NVARCHAR(100) NOT NULL,
    RoomNumber NVARCHAR(15),
    RoomType NVARCHAR(50),
    BedType NVARCHAR(50),
    Price FLOAT,
    StatusRoom BIT,
    Checkin NVARCHAR(15),
    Checkout NVARCHAR(15),
    DescriptionRooms NVARCHAR(240),
    FOREIGN KEY (IdUsers) REFERENCES Users(IdUsers)
);

CREATE TABLE Bill (
    IdBill NVARCHAR(15) PRIMARY KEY,
    IdUsers INT NOT NULL,
    IdRooms NVARCHAR(10) NOT NULL,
    DateBill DATETIME NOT NULL,
    TotalAmount FLOAT NOT NULL,
    PaymentMethod NVARCHAR(50) NOT NULL,
    PaymentStatus NVARCHAR(20) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    Note NVARCHAR(240),
    FOREIGN KEY (IdUsers) REFERENCES Users(IdUsers),
    FOREIGN KEY (IdRooms) REFERENCES Rooms(IdRooms)
);

CREATE TABLE ServiceRoom (
    IdServiceRoom INT IDENTITY(1,1) PRIMARY KEY,
    IdUsers INT NOT NULL,
    IdE NVARCHAR(10),
    RoomService BIT,
    LaundryService BIT,
    Airpot BIT,
    Wakeup BIT,
    FOREIGN KEY (IdUsers) REFERENCES Users(IdUsers),
    FOREIGN KEY (IdE) REFERENCES Employee(IdE)
);

-- Chèn dữ liệu vào bảng Users
INSERT INTO Users (NameUsers, PhoneNumber, Email, PasswordUsers, Adress, CCCD)
VALUES
    ('John Doe', '123456789', 'john.doe@example.com', 'password123', '123 Main St', '12345'),
    ('Jane Smith', '987654321', 'jane.smith@example.com', 'password456', '456 Elm St', NULL),
    ('Michael Johnson', '555555555', 'michael.johnson@example.com', 'password789', '789 Oak St', '67890'),
    -- Thêm 7 bản ghi khác tại đây
    ('Alice Brown', '111111111', 'alice.brown@example.com', 'password111', '111 Pine St', '54321'),
    ('Bob Davis', '222222222', 'bob.davis@example.com', 'password222', '222 Cedar St', NULL),
    ('Emily Wilson', '333333333', 'emily.wilson@example.com', 'password333', '333 Walnut St', '13579');

-- Chèn dữ liệu vào bảng Employee
INSERT INTO Employee (IdE, NameE, PhoneNumberE, EmailE, PasswordE, RoleE, AdressE, CCCDE, Img)
VALUES
    ('E001', 'John Employee', '111111111', 'john.employee@example.com', 'emp123', 1, '123 Main St', '12345', 'emp1.jpg'),
    ('E002', 'Jane Employee', '222222222', 'jane.employee@example.com', 'emp456', 0, '456 Elm St', '67890', 'emp2.jpg'),
    ('E003', 'Michael Employee', '333333333', 'michael.employee@example.com', 'emp789', 1, '789 Oak St', '54321', 'emp3.jpg');
    -- Thêm 7 bản ghi khác tại đây

-- Chèn dữ liệu vào bảng Rooms
INSERT INTO Rooms (IdRooms, IdUsers, Title, RoomNumber, RoomType, BedType, Price, StatusRoom, Checkin, Checkout, DescriptionRooms)
VALUES
    ('R001', 1, 'Room 1', '101', 'Standard', 'Single', 100.0, 1, '2022-01-01', '2022-01-05', 'Standard room with single bed'),
    ('R002', 2, 'Room 2', '102', 'Deluxe', 'Double', 150.0, 1, '2022-02-01', '2022-02-05', 'Deluxe room with double bed'),
    ('R003', NULL, 'Room 3', '103', 'Standard', 'Single', 100.0, 0, NULL, NULL, 'Standard room with single bed');
    -- Thêm 7 bản ghi khác tại đây

-- Chèn dữ liệu vào bảng Bill
INSERT INTO Bill (IdBill, IdUsers, IdRooms, DateBill, TotalAmount, PaymentMethod, PaymentStatus, StartDate, EndDate, Note)
VALUES
    ('B001', 1, 'R001', '2022-01-05', 400.0, 'Credit Card', 'Paid', '2022-01-01', '2022-01-05', NULL),
    ('B002', 2, 'R002', '2022-02-05', 600.0, 'Cash', 'Pending', '2022-02-01', '2022-02-05', 'Please provide extra towels'),
    ('B003', 3, 'R003', '2022-03-05', 100.0, 'Credit Card', 'Paid', '2022-03-01', '2022-03-05', NULL);
    -- Thêm 7 bản ghi khác tại đây

-- Chèn dữ liệu vào bảng ServiceRoom
INSERT INTO ServiceRoom (IdUsers, IdE, RoomService, LaundryService, Airpot, Wakeup)
VALUES
    (1, 'E001', 1, 0, 1, 0),
    (2, 'E002', 0, 1, 0, 1),
    (3, 'E003', 1, 1, 1, 1);
    -- Thêm 7 bản ghi khác tại đây
	select * from Rooms
