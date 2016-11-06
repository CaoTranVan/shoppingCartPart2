CREATE DATABASE shoppingcart; 

go

USE shoppingcart; 

go 

CREATE TABLE role 
  ( 
     id   INT NOT NULL PRIMARY KEY IDENTITY, 
     NAME VARCHAR(255) 
  ); 

go 

CREATE TABLE [user] 
  ( 
     id          INT NOT NULL PRIMARY KEY IDENTITY, 
     username    NVARCHAR(255) NOT NULL, 
     NAME        NVARCHAR(255), 
     age         INT, 
     user_address     NVARCHAR(255), 
     phonenumber INT, 
     roleid      INT, 
     FOREIGN KEY (roleid) REFERENCES role(id)
	 ON DELETE CASCADE
  ); 

go 

CREATE TABLE [order] 
  ( 
     id     INT NOT NULL PRIMARY KEY, 
     status NVARCHAR(255) 
  ); 

go 

CREATE TABLE [userorder] 
  ( 
     userid      INT NOT NULL, 
     orderid     INT NOT NULL, 
     createddate DATETIME, 
     updateddate DATETIME, 
     FOREIGN KEY (userid ) REFERENCES [user](id), 
     FOREIGN KEY (orderid ) REFERENCES [order](id) 
  ); 

go 

CREATE TABLE [product] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     quantity    INT, 
     imageurl    NVARCHAR(255), 
     description NVARCHAR(255) 
  ); 

go 

CREATE TABLE [orderproduct] 
  ( 
     orderid   INT NOT NULL, 
     productid INT NOT NULL, 
     FOREIGN KEY (orderid) REFERENCES [order] (id), 
     FOREIGN KEY (productid) REFERENCES [product] (id) 
  ); 

go 

CREATE TABLE [chip] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     bus         NVARCHAR(255), 
     quantity    INT, 
     createddate NVARCHAR(255), 
     updateddate NVARCHAR(255), 
  ); 

go 

CREATE TABLE [productchip] 
  ( 
     chipid    INT NOT NULL, 
     productid INT NOT NULL 
     FOREIGN KEY (productid) REFERENCES [product](id), 
     FOREIGN KEY (chipid) REFERENCES [chip](id) 
  ); 

go 

CREATE TABLE [ram] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     bus         NVARCHAR(255), 
     quantity    INT, 
     createddate NVARCHAR(255), 
     updateddate NVARCHAR(255), 
  ); 

go 

CREATE TABLE [productram] 
  ( 
     ramid     INT NOT NULL, 
     productid INT NOT NULL 
     FOREIGN KEY (productid) REFERENCES [product](id), 
     FOREIGN KEY (ramid) REFERENCES [ram](id) 
  ); 

go 

CREATE TABLE [monitor] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     res         NVARCHAR(255), 
     quantity    INT, 
     campany     NVARCHAR(255), 
     createddate NVARCHAR(255), 
     updateddate NVARCHAR(255), 
  ); 

go 

CREATE TABLE [productmonitor] 
  ( 
     monitorid INT NOT NULL, 
     productid INT NOT NULL 
     FOREIGN KEY (productid) REFERENCES [product](id), 
     FOREIGN KEY (monitorid) REFERENCES [monitor](id) 
  ); 

go 

CREATE TABLE [harddrive] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     quantity    INT, 
     campany     NVARCHAR(255), 
     createddate NVARCHAR(255), 
     updateddate NVARCHAR(255), 
  ); 

go 

CREATE TABLE [productharddrive] 
  ( 
     harddriveid INT NOT NULL, 
     productid   INT NOT NULL 
     FOREIGN KEY (productid) REFERENCES [product](id), 
     FOREIGN KEY (harddriveid) REFERENCES [harddrive](id) 
  ); 

go 

CREATE TABLE [power] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     quantity    INT, 
     campany     NVARCHAR(255), 
     createddate NVARCHAR(255), 
     updateddate NVARCHAR(255), 
  ); 

go 

CREATE TABLE [productpower] 
  ( 
     powerid   INT NOT NULL, 
     productid INT NOT NULL 
     FOREIGN KEY (productid) REFERENCES [product](id), 
     FOREIGN KEY (powerid) REFERENCES [power](id) 
  ); 

go 

CREATE TABLE [mainboard] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     quantity    INT, 
     campany     NVARCHAR(255), 
     createddate NVARCHAR(255), 
     updateddate NVARCHAR(255), 
  ); 

go 

CREATE TABLE [productmainboard] 
  ( 
     mainboardid INT NOT NULL, 
     productid   INT NOT NULL 
     FOREIGN KEY (productid) REFERENCES [product](id), 
     FOREIGN KEY (mainboardid) REFERENCES [mainboard](id) 
  ); 

go 

CREATE TABLE [vga] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     quantity    INT, 
     campany     NVARCHAR(255), 
     createddate NVARCHAR(255), 
     updateddate NVARCHAR(255), 
  ); 

go 

CREATE TABLE [productvga] 
  ( 
     vgaid     INT NOT NULL, 
     productid INT NOT NULL 
     FOREIGN KEY (productid) REFERENCES [product](id), 
     FOREIGN KEY (vgaid) REFERENCES [vga](id) 
  ); 

go 

CREATE TABLE [cpu] 
  ( 
     id          INT NOT NULL PRIMARY KEY, 
     NAME        NVARCHAR(255), 
     quantity    INT, 
     campany     NVARCHAR(255), 
     createddate NVARCHAR(255), 
     updateddate NVARCHAR(255), 
  ); 

go 

CREATE TABLE [productcpu] 
  ( 
     cpuid     INT NOT NULL, 
     productid INT NOT NULL 
     FOREIGN KEY (productid) REFERENCES [product](id), 
     FOREIGN KEY (cpuid) REFERENCES [cpu](id) 
  ); 

go 

ALTER TABLE productcpu 
  ADD CONSTRAINT productcpuid PRIMARY KEY (cpuid, productid); 

go 

ALTER TABLE productvga 
  ADD CONSTRAINT productcvgaid PRIMARY KEY (vgaid, productid); 

go 

ALTER TABLE productmainboard 
  ADD CONSTRAINT productmainboardid PRIMARY KEY (mainboardid, productid); 

go 

ALTER TABLE productpower 
  ADD CONSTRAINT productpowerid PRIMARY KEY (powerid, productid); 

go 

ALTER TABLE productharddrive 
  ADD CONSTRAINT productharddriveid PRIMARY KEY (harddriveid, productid); 

go 

ALTER TABLE productmonitor 
  ADD CONSTRAINT productmonitorid PRIMARY KEY (monitorid, productid); 

go 

ALTER TABLE productram 
  ADD CONSTRAINT productramid PRIMARY KEY (ramid, productid); 

go 

ALTER TABLE productchip 
  ADD CONSTRAINT productchipid PRIMARY KEY (chipid, productid); 

go 

ALTER TABLE orderproduct 
  ADD CONSTRAINT orderproductid PRIMARY KEY (orderid, productid); 

go 

ALTER TABLE userorder 
  ADD CONSTRAINT userorderid PRIMARY KEY (userid, orderid); 