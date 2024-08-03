CREATE TABLE [USER] (
    UserID INT PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    City NVARCHAR(100),
    PostalCode NVARCHAR(20)
);
CREATE TABLE [PRODUCT] (
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Brand NVARCHAR(100),
    Description NVARCHAR(MAX),
    ImageURL NVARCHAR(MAX)
);
CREATE TABLE [PRODUCT_SIZE] (
    ProductSizeID INT PRIMARY KEY,
    Size INT NOT NULL,
    Price DECIMAL(18, 2) NOT NULL,
    Quantity INT NOT NULL,
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES [PRODUCT](ProductID)
);
CREATE TABLE [ORDER] (
    OrderID INT PRIMARY KEY,
    OrderDateTime DATETIME NOT NULL,
    TotalPrice DECIMAL(18, 2) NOT NULL,
    OrderStatus NVARCHAR(20) NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [USER](UserID)
);
CREATE TABLE [ORDER_ITEM] (
    OrderItemID INT PRIMARY KEY,
    Quantity INT NOT NULL,
    OrderID INT NOT NULL,
    ProductSizeID INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES [ORDER](OrderID),
    FOREIGN KEY (ProductSizeID) REFERENCES [PRODUCT_SIZE](ProductSizeID)
);

