-- Create database Blog
CREATE DATABASE Blog
GO
USE [Blog]
GO
-- Database

-- Create Table User
CREATE TABLE [User]
(
    [Id] int not NULL IDENTITY(1,1),
    [Name] NVARCHAR (80) NOT NULL,
    [Email] NVARCHAR (200) NOT NULL,
    [PasswordHash] VARCHAR (255) NOT NULL,
    [Bio] Text NOT NULL,
    [Image] VARCHAR (2000) NOT NULL,
    [Slug] VARCHAR (80) NOT NULL,

    CONSTRAINT [Pk_User] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_User_Email] UNIQUE([Email]),
    CONSTRAINT [UQ_User_Slug] UNIQUE([Slug])
)

CREATE NONCLUSTERED INDEX [IX_User_Email] ON [User]([Email])
CREATE NONCLUSTERED INDEX [IX_User_Slug] ON [User]([Slug])
-- End Table User
-- Create Table role
CREATE TABLE [Role]
(
    [Id] Int NOT NULL IDENTITY(1,1),
    [Name] VARCHAR (80) NOT NULL,
    [Slug] VARCHAR (80) NOT NULL,

    CONSTRAINT [Pk_Role] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_Role_Slug] UNIQUE([Slug])
)

CREATE NONCLUSTERED INDEX [IX_Role_Slug] ON [Role]([Slug])

-- End Table Role
-- Create Table UserRole
Create TABLE [UserRole]
(
    [UserId] int NOT NULL,
    [RoleId] INT NOT NULL,

    CONSTRAINT [Pk_UserRole] PRIMARY KEY ([UserId],[RoleId])
)
-- End Table UseRole

-- Create Table Category
CREATE TABLE [Category]
(
    [Id] INT NOT NULL IDENTITY(1,1),
    [Name] VARCHAR(80) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,

    CONSTRAINT [Pk_Category] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_Category_Slug] UNIQUE([Slug])
)

CREATE NONCLUSTERED INDEX [IX_Category_Slug] ON [Category]([Slug])

-- End Table Category

-- Create Table Post
CREATE TABLE [Post]
(
    [Id] INT NOT NULL IDENTITY(1,1),
    [CategoryId] int NOT NULL,
    [AuthorId] int NOT NULL,
    [Title] VARCHAR(160) not NULL,
    [Summary] VARCHAR(255) not NULL,
    [Body] Text not NULL,
    [Slug] VARCHAR(80) not NULL,
    [CreateDate] DATETIME not  NULL DEFAULT(GETDATE()),
    [LastUpdateDate] DATETIME not  NULL DEFAULT(GETDATE()),


    CONSTRAINT [PK_Post] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Post_Category] FOREIGN KEY([CategoryId]) REFERENCES [Category]([Id]),
    CONSTRAINT [FK_Post_Author] FOREIGN KEY ([AuthorId]) REFERENCES [User]([Id]),
    CONSTRAINT [UQ_Post_Slug] UNIQUE ([Slug])
)

CREATE NONCLUSTERED INDEX [IX_Post_Slug] On [Post]([Slug])
-- End Table Post

-- Create Table Tag
CREATE TABLE [Tag]
(
    [Id] INT NOT NULL IDENTITY(1,1),
    [Name] VARCHAR(80) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,

    CONSTRAINT [Pk_Tag] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_Tag_Slug] UNIQUE([Slug])
)

CREATE NONCLUSTERED INDEX [IX_Category_Slug] ON [Tag]([Slug])

-- End Table Tag

-- Create Table PostTag
Create TABLE [UserRole]
(
    [UserId] int NOT NULL,
    [RoleId] INT NOT NULL,

    CONSTRAINT [Pk_UserRole] PRIMARY KEY ([UserId],[RoleId])
)
-- End Table PostTag