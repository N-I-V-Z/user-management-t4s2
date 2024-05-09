	USE [master]
GO
drop database UserManagement
go

CREATE DATABASE [UserManagement] 

USE [UserManagement]
GO

delete tblUsers  where 1=1
go


CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', 1)

CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) PRIMARY KEY,
	[name] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL
)

INSERT INTO dbo.tblProduct(productID,name,quantity,price) values ('W001','Short Gun',100,10)
INSERT INTO dbo.tblProduct(productID,name,quantity,price) values ('W002','AK 47',100,11)
INSERT INTO dbo.tblProduct(productID,name,quantity,price) values ('W003','Water Gun(cute)',100,100)
INSERT INTO dbo.tblProduct(productID,name,quantity,price) values ('W004','Red Hat',100,1000)

CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) PRIMARY KEY,
	[userID] [nvarchar](50) FOREIGN KEY(userID) REFERENCES [dbo].[tblUsers] NOT NULL,
	[date] [date] NOT NULL,
	[total] [float] NOT NULL
)

CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) PRIMARY KEY,
	[orderID] [int]	FOREIGN KEY(orderID) REFERENCES [dbo].[tblOrder] NOT NULL,
	[productID] [nvarchar](50) FOREIGN KEY(productID) REFERENCES [dbo].[tblProduct] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL
)

