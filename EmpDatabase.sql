USE [master]
GO
/****** Object:  Database [OfficeManagement]    Script Date: 29-02-2020 12:58:50 ******/
CREATE DATABASE [OfficeManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OfficeManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLDEV2016\MSSQL\DATA\OfficeManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OfficeManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLDEV2016\MSSQL\DATA\OfficeManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OfficeManagement] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OfficeManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OfficeManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OfficeManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OfficeManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OfficeManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OfficeManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [OfficeManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OfficeManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OfficeManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OfficeManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OfficeManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OfficeManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OfficeManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OfficeManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OfficeManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OfficeManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OfficeManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OfficeManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OfficeManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OfficeManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OfficeManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OfficeManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OfficeManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OfficeManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [OfficeManagement] SET  MULTI_USER 
GO
ALTER DATABASE [OfficeManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OfficeManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OfficeManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OfficeManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OfficeManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OfficeManagement', N'ON'
GO
ALTER DATABASE [OfficeManagement] SET QUERY_STORE = OFF
GO
USE [OfficeManagement]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OfficeManagement]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](20) NOT NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DesignationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EId] [int] IDENTITY(1,1) NOT NULL,
	[EName] [nvarchar](20) NOT NULL,
	[DesignationId] [int] NULL,
	[DesignationName] [nvarchar](20) NULL,
	[DateOfJoining] [date] NULL,
	[PhoneNo] [nvarchar](10) NULL,
	[Email] [nvarchar](20) NULL,
	[Username] [nvarchar](20) NULL,
	[PasswordHash] [binary](64) NULL,
	[Status] [bit] NULL,
	[ManagerId] [int] NOT NULL,
	[ReportingTo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[PId] [int] IDENTITY(1,1) NOT NULL,
	[PName] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Client] [nvarchar](20) NULL,
	[Technology] [nvarchar](10) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Relation]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relation](
	[Id] [int] NOT NULL,
	[EId] [int] NOT NULL,
	[PId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Relations]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relations](
	[RelationId] [int] IDENTITY(1,1) NOT NULL,
	[PId] [int] NULL,
	[EId] [int] NULL,
	[RId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Designation] ON 

GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (3, N'Developer', 0)
GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (1, N'Director', 1)
GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (7, N'HR', 0)
GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (2, N'Manager', 1)
GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (8, N'SystemAdmin', 1)
GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (1, N'TestEngineer', 0)
GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (5, N'Testing', 0)
GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (4, N'Trainee Software', 1)
GO
INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [Status]) VALUES (6, N'UI', 0)
GO
SET IDENTITY_INSERT [dbo].[Designation] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (1, N'Raghu', 1, N'Director', CAST(N'2000-09-12' AS Date), N'9543213456', N'Raghu@gmail.com', N'Raghu', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 1, N'Raghu')
GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (2, N'Sanjeev', 1, N'Director', CAST(N'2000-03-22' AS Date), N'7621903245', N'Sanjeev@gmail.com', N'Sanjeev', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 1, N'Raghu')
GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (3, N'SrinivasRao', 2, N'Manager', CAST(N'2003-11-05' AS Date), N'9743261789', N'Srinivas@gmail.com', N'Srinivas', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0, 2, N'Sanjeev')
GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (4, N'Mohan', 3, N'Developer', CAST(N'2012-06-10' AS Date), N'9876543034', N'Mohan@gmail.com', N'Mohan', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 3, N'SrinivasRao')
GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (5, N'Ravi', 3, N'Developer', CAST(N'2013-07-04' AS Date), N'9843109231', N'Ravi@gmail.com', N'Ravi', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 3, N'SrinivasRao')
GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (6, N'Ashish', 2, N'Manager', CAST(N'2000-04-09' AS Date), N'8786532134', N'Ashish@gmail.com', N'Ashish', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 2, N'Sanjeev')
GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (7, N'Chethan', 5, N'Testing', CAST(N'2014-08-06' AS Date), N'9863445211', N'Chethan@gmail.com', N'Chethan', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0, 6, N'Ashish')
GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (8, N'Bharath', 6, N'UI', CAST(N'2015-01-07' AS Date), N'9901232345', N'Bharath@gmail.com', N'Bharath', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0, 6, N'Ashish')
GO
INSERT [dbo].[Employee] ([EId], [EName], [DesignationId], [DesignationName], [DateOfJoining], [PhoneNo], [Email], [Username], [PasswordHash], [Status], [ManagerId], [ReportingTo]) VALUES (10, N'Akshatha', 4, N'Trainee Software', CAST(N'2019-08-29' AS Date), N'9903456733', N'Akshatha@gmail.com', N'Akshatha', 0x30390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 4, N'Mohan')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

GO
INSERT [dbo].[Project] ([PId], [PName], [Description], [Client], [Technology], [StartDate], [EndDate], [Status]) VALUES (1, N'Hospital Management', N'Manages Hospital Database ', N'Promed', N'MVC', CAST(N'2015-04-12' AS Date), CAST(N'2020-09-06' AS Date), 1)
GO
INSERT [dbo].[Project] ([PId], [PName], [Description], [Client], [Technology], [StartDate], [EndDate], [Status]) VALUES (2, N'School Management', N'Manages School Database  ', N'Apollo Public School', N'ASP.NET', CAST(N'2018-05-03' AS Date), CAST(N'2021-04-09' AS Date), 0)
GO
INSERT [dbo].[Project] ([PId], [PName], [Description], [Client], [Technology], [StartDate], [EndDate], [Status]) VALUES (5, N'VJNL', N'Stores database of Water Resources', N'Karnataka Government', N'MVC', NULL, NULL, 0)
GO
INSERT [dbo].[Project] ([PId], [PName], [Description], [Client], [Technology], [StartDate], [EndDate], [Status]) VALUES (6, N'HHA', N'Maintains Hospital Database', N'Infosys', N'Asp.Net', NULL, NULL, 0)
GO
INSERT [dbo].[Project] ([PId], [PName], [Description], [Client], [Technology], [StartDate], [EndDate], [Status]) VALUES (7, N'WRDO', N'Water Resource Management', N'Unisys', N'WebForms', NULL, NULL, 0)
GO
INSERT [dbo].[Project] ([PId], [PName], [Description], [Client], [Technology], [StartDate], [EndDate], [Status]) VALUES (8, N'HangMan', N'Works on Gamingggg', N'Wipro', N'Angular', NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (1, 2, 1)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (2, 6, 1)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (3, 4, 5)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (4, 5, 6)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (5, 10, 5)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (6, 7, 2)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (7, 8, 7)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (8, 11, 6)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (9, 12, 4)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (10, 3, 8)
GO
INSERT [dbo].[Relation] ([Id], [EId], [PId]) VALUES (11, 1054, 9)
GO
SET IDENTITY_INSERT [dbo].[Relations] ON 

GO
INSERT [dbo].[Relations] ([RelationId], [PId], [EId], [RId]) VALUES (1, 1, 2, 1)
GO
INSERT [dbo].[Relations] ([RelationId], [PId], [EId], [RId]) VALUES (2, 1, 3, 1)
GO
INSERT [dbo].[Relations] ([RelationId], [PId], [EId], [RId]) VALUES (3, 1, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Relations] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([DesignationName])
REFERENCES [dbo].[Designation] ([DesignationName])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employee] ([EId])
GO
ALTER TABLE [dbo].[Relations]  WITH CHECK ADD FOREIGN KEY([EId])
REFERENCES [dbo].[Employee] ([EId])
GO
ALTER TABLE [dbo].[Relations]  WITH CHECK ADD FOREIGN KEY([PId])
REFERENCES [dbo].[Project] ([PId])
GO
ALTER TABLE [dbo].[Relations]  WITH CHECK ADD FOREIGN KEY([RId])
REFERENCES [dbo].[Employee] ([EId])
GO
ALTER TABLE [dbo].[Designation]  WITH CHECK ADD  CONSTRAINT [chk_Status] CHECK  (([Status]=(1) OR [Status]=(0)))
GO
ALTER TABLE [dbo].[Designation] CHECK CONSTRAINT [chk_Status]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [check_Status] CHECK  (([Status]=(1) OR [Status]=(0)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [check_Status]
GO
/****** Object:  StoredProcedure [dbo].[Deletedesignation]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Deletedesignation] (@DesId INTEGER) 
AS 
  BEGIN 
      DELETE Designation 
     WHERE  DesignationId = @DesId; 
  END
GO
/****** Object:  StoredProcedure [dbo].[Deleteemployee]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Deleteemployee] (@EId INTEGER) 
AS 
  BEGIN 
      DELETE employee 
      WHERE  EId = @EId; 
  END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProject]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[DeleteProject] (@PId INTEGER) 
AS 
  BEGIN 
      DELETE Project 
     WHERE  PId = @PId; 
  END
GO
/****** Object:  StoredProcedure [dbo].[Employee_detailss]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_detailss](@EId int)
 
AS
BEGIN
  select Employee.EId,Employee.Ename,Employee.DesignationId,Employee.DesignationName,Employee.DateOfJoining,
  Employee.PhoneNo,Employee.Email,Employee.Status,Employee.ManagerId,Employee.ReportingTo,
  Designation.DesignationName from Employee 
  join Designation on
  Employee.DesignationName=Designation.DesignationName
  where Employee.EId=@EId;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertupdateDesignation]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsertupdateDesignation] ( 
                                       @DesId   INTEGER,
									   @DesName NVARCHAR(20),
									   
									   @Status BIT,
									   
                                       @Action  VARCHAR(10)) 
AS 
  BEGIN 
      IF @Action = 'Insert' 
        BEGIN 
            INSERT INTO Designation
                        ( 
                         DesignationId, 
						 DesignationName,
						 
						 Status
						 
						 ) 
            VALUES     ( 
                        @DesId,
						@DesName,
						
						@Status
						); 
        END 
      IF @Action = 'Update' 
        BEGIN 
            UPDATE Designation
            SET    
                   DesignationId = @DesId,
				   DesignationName =@DesName,
				   
				   Status = @Status
				   
            WHERE  DesignationId = @DesId; 
        END 
  END

GO
/****** Object:  StoredProcedure [dbo].[Insertupdateemploye]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Insertupdateemploye] (@EId      INTEGER, 
                                       @EName    NVARCHAR(20), 
									   @DesName NVARCHAR(20),
                                       @Email NVARCHAR(20), 
									   @PhoneNo NVARCHAR(10),
									   @Status BIT,
									   @ManagerId INTEGER,
                                       @Action  VARCHAR(10)) 
AS 
  BEGIN 
      IF @Action = 'Insert' 
        BEGIN 
            INSERT INTO employee 
                        (EName, 
						 DesignationName,
                         Email, 
                         PhoneNo,
						 Status,
						 ManagerId
						 ) 
            VALUES     (@EName, 
						@DesName,
                        @Email, 
                        @PhoneNo,
						@Status,
						@ManagerId
						); 
        END 
      IF @Action = 'Update' 
        BEGIN 
            UPDATE employee 
            SET    EName = @EName,    
				   DesignationName =@DesName,
                   Email = @Email, 
                   PhoneNo = @PhoneNo,
				   Status = @Status,
				   ManagerId = @ManagerId
				   
            WHERE  EId = @EId; 
        END 
  END
GO
/****** Object:  StoredProcedure [dbo].[Insertupdateemployee]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insertupdateemployee] (@EId      INTEGER, 
                                       @EName    NVARCHAR(20), 
                                       @DesId   INTEGER,
									   @DesName NVARCHAR(20),
									 
                                       @Email NVARCHAR(20), 
									   @PhoneNo NVARCHAR(10),
									   @Status BIT,
									   @ManagerId INTEGER,
									   @ReportingTo NVARCHAR(50),
                                       @Action  VARCHAR(10)) 
AS 
  BEGIN 
      IF @Action = 'Insert' 
        BEGIN 
            INSERT INTO employee 
                        (EName, 
                         DesignationId, 
						 DesignationName,
					
                         Email, 
                         PhoneNo,
						 Status,
						 ManagerId,
						 ReportingTo
						 ) 
            VALUES     (@EName, 
                        @DesId,
						@DesName,
						
                        @Email, 
                        @PhoneNo,
						@Status,
						@ManagerId,
						@ReportingTo); 
        END 
      IF @Action = 'Update' 
        BEGIN 
            UPDATE employee 
            SET    EName = @EName, 
                   DesignationId = @DesId,
				   DesignationName =@DesName,
				
                   Email = @Email, 
                   PhoneNo = @PhoneNo,
				   Status = @Status,
				   ManagerId = @ManagerId,
				   ReportingTo = @ReportingTo
            WHERE  EId = @EId; 
        END 
  END

GO
/****** Object:  StoredProcedure [dbo].[Insertupdateemployeee]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Insertupdateemployeee] (@EId      INTEGER, 
                                       @EName    NVARCHAR(20), 
									   @DesName NVARCHAR(20),
                                       @Email NVARCHAR(20), 
									   @PhoneNo NVARCHAR(10),
									   @Status BIT,
                                       @Action  VARCHAR(10)) 
AS 
  BEGIN 
      IF @Action = 'Insert' 
        BEGIN 
            INSERT INTO employee 
                        (EName, 
						 DesignationName,
                         Email, 
                         PhoneNo,
						 Status
						 ) 
            VALUES     (@EName, 
						@DesName,
                        @Email, 
                        @PhoneNo,
						@Status
						); 
        END 
      IF @Action = 'Update' 
        BEGIN 
            UPDATE employee 
            SET    EName = @EName,    
				   DesignationName =@DesName,
                   Email = @Email, 
                   PhoneNo = @PhoneNo,
				   Status = @Status
				   
            WHERE  EId = @EId; 
        END 
  END
GO
/****** Object:  StoredProcedure [dbo].[Insertupdateemployees]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Insertupdateemployees] (@EId      INTEGER, 
                                       @EName    NVARCHAR(20), 
                                      
									   @DesName NVARCHAR(20),
									 
                                       @Email NVARCHAR(20), 
									   @PhoneNo NVARCHAR(10),
									   @Status BIT,
									   @ManagerId INTEGER,
									   @ReportingTo NVARCHAR(50),
                                       @Action  VARCHAR(10)) 
AS 
  BEGIN 
      IF @Action = 'Insert' 
        BEGIN 
            INSERT INTO employee 
                        (EName, 
                       
						 DesignationName,
					
                         Email, 
                         PhoneNo,
						 Status,
						 ManagerId,
						 ReportingTo
						 ) 
            VALUES     (@EName, 
                        
						@DesName,
						
                        @Email, 
                        @PhoneNo,
						@Status,
						@ManagerId,
						@ReportingTo); 
        END 
      IF @Action = 'Update' 
        BEGIN 
            UPDATE employee 
            SET    EName = @EName, 
                   
				   DesignationName =@DesName,
				
                   Email = @Email, 
                   PhoneNo = @PhoneNo,
				   Status = @Status,
				   ManagerId = @ManagerId,
				   ReportingTo = @ReportingTo
            WHERE  EId = @EId; 
        END 
  END
GO
/****** Object:  StoredProcedure [dbo].[InsertupdateProject]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertupdateProject] (@PId      INTEGER, 
                                       @PName    NVARCHAR(20), 
									   @Desc NVARCHAR(50),
                                       @Client NVARCHAR(20), 
									   @Technology NVARCHAR(10),
									   
									   @Status BIT,
                                       @Action  VARCHAR(10)) 
AS 
  BEGIN 
      IF @Action = 'Insert' 
        BEGIN 
            INSERT INTO Project
                        (PName, 
						 Description,
                         Client, 
                         Technology,
						
						 Status
						 
						 ) 
            VALUES     (@PName, 
						@Desc,
                        @Client, 
                        @Technology,
						
						@Status
						); 
        END 
      IF @Action = 'Update' 
        BEGIN 
            UPDATE Project
            SET    PName = @PName,    
				   Description =@Desc,
                   Client = @Client, 
                   Technology = @Technology,
				   
				   Status=@Status
				   
            WHERE  PId = @PId; 
        END 
  END
GO
/****** Object:  StoredProcedure [dbo].[ProjectFlow]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[ProjectFlow](@Pid int)as begin
Select Project.PId,Employee.EId,(select top(1) Employee.EId From Employee inner join Relation on Employee.EId = Relations.RId where Relations.PId=@Pid   )as Manager
From Project
Inner Join Relations on Project.PId=Relations.PId
Inner Join Employee On Employee.EId= Relations.EId
where Project.PId=@Pid
END
GO
/****** Object:  StoredProcedure [dbo].[Selectemployee]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Selectemployee] 
AS 
  BEGIN 
      SELECT * 
      FROM   employee; 
  END 


GO
/****** Object:  StoredProcedure [dbo].[SelectProject]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProject]
AS 
  BEGIN 
      SELECT * 
      FROM   Project; 
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateDesignation]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[sp_CreateDesignation]
(
@DesId int,@DesName nvarchar(20),@status int
)
AS BEGIN

  INSERT INTO Designation(DesignationId,DesignationName,Status)
  Values(@DesId,@DesName,@status)

  END

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProjectDetails]    Script Date: 29-02-2020 12:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_SelectProjectDetails](@PId int)
as
begin
select Employee.EName,Employee.EId, Project.PName,Project.Description,
Project.Client,Project.Status,Project.Technology,Project.StartDate,
Project.EndDate
from Relation join Project
on Relation.PId=Project.PId
join Employee
on Employee.EId=Relation.EId
where Project.PId=@PId
end
GO
USE [master]
GO
ALTER DATABASE [OfficeManagement] SET  READ_WRITE 
GO
