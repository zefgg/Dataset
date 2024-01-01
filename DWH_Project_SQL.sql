CREATE TABLE DimCustomer (
    CustomerID int NOT NULL PRIMARY KEY,
	FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Age int NOT NULL,
	Gender varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	NoHP varchar(50) NOT NULL 
);

CREATE TABLE DimProduct (
    ProductID int NOT NULL PRIMARY KEY,
	ProductName varchar(255) NOT NULL,
    ProductCategory varchar(255) NOT NULL,
    ProductUnitPrice int NULL
);

CREATE TABLE DimStatusOrder (
    StatusID int NOT NULL PRIMARY KEY,
	StatusOrder varchar(50) NOT NULL,
    StatusOrderDesc varchar(50) NOT NULL,
);

CREATE TABLE FactSalesOrder (
    OrderID int NOT NULL PRIMARY KEY,
	CustomerID int NOT NULL,
	ProductID int NOT NULL,
	StatusID int NOT NULL,
    Quantity int NOT NULL,
	Amount int NOT NULL,
	OrderDate date NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
	FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
	FOREIGN KEY (StatusID) REFERENCES DimStatusOrder(StatusID)
);

alter table FactSalesOrder
drop column OrderDate

alter table FactSalesOrder
add StatusID int NOT NULL,
	OrderDate date NOT NULL,
FOREIGN KEY (StatusID) REFERENCES DimStatusOrder(StatusID)

alter table FactSalesOrder drop constraint FK__FactSales__Statu__3F466844

alter table FactSalesOrder drop column StatusID

delete from DimCustomer

select * from FactSalesOrder
