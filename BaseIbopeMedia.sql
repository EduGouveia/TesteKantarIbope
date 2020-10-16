USE [master]
GO

/****** Object:  Database [IbopeMedia]    Script Date: 10/16/2020 03:40:30 ******/
CREATE DATABASE [IbopeMedia] ON  PRIMARY 
( NAME = N'IbopeMedia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\IbopeMedia.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IbopeMedia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\Log\IbopeMedia_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [IbopeMedia] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IbopeMedia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [IbopeMedia] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [IbopeMedia] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [IbopeMedia] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [IbopeMedia] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [IbopeMedia] SET ARITHABORT OFF 
GO

ALTER DATABASE [IbopeMedia] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [IbopeMedia] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [IbopeMedia] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [IbopeMedia] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [IbopeMedia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [IbopeMedia] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [IbopeMedia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [IbopeMedia] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [IbopeMedia] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [IbopeMedia] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [IbopeMedia] SET  DISABLE_BROKER 
GO

ALTER DATABASE [IbopeMedia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [IbopeMedia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [IbopeMedia] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [IbopeMedia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [IbopeMedia] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [IbopeMedia] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [IbopeMedia] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [IbopeMedia] SET  READ_WRITE 
GO

ALTER DATABASE [IbopeMedia] SET RECOVERY FULL 
GO

ALTER DATABASE [IbopeMedia] SET  MULTI_USER 
GO

ALTER DATABASE [IbopeMedia] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [IbopeMedia] SET DB_CHAINING OFF 
GO



USE [IbopeMedia]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 10/16/2020 03:40:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[sexo] [char](1) NULL,
	[Nascimento] [date] NOT NULL,
	[Estado] [char](2) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [IbopeMedia]
GO

/****** Object:  Table [dbo].[Compra]    Script Date: 10/16/2020 03:40:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Compra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datacompra] [date] NOT NULL,
	[idCliente] [int] NOT NULL,
	[nomeVendedor] [varchar](50) NOT NULL,
	[valorToralCompra] [numeric](16, 2) NOT NULL,
 CONSTRAINT [PK_PedidoCompra_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [IbopeMedia]
GO

/****** Object:  Table [dbo].[ItensCompra]    Script Date: 10/16/2020 03:40:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ItensCompra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCompra] [int] NOT NULL,
	[idLivro] [int] NOT NULL,
	[valorUnitario] [numeric](16, 2) NOT NULL,
	[quantidade] [int] NULL,
	[valorTotal] [numeric](16, 2) NULL,
 CONSTRAINT [PK_ItensCompra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [IbopeMedia]
GO

/****** Object:  Table [dbo].[Livro]    Script Date: 10/16/2020 03:40:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Livro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[autor] [varchar](50) NOT NULL,
	[categoria] [varchar](15) NULL,
	[preco] [numeric](16, 2) NULL,
 CONSTRAINT [PK_Livro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD CHECK  (([sexo]='S' OR [sexo]='M'))
GO

ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ('M') FOR [sexo]
GO

ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO

ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Cliente]
GO

ALTER TABLE [dbo].[ItensCompra]  WITH CHECK ADD  CONSTRAINT [FK_ItensCompra_Compra] FOREIGN KEY([idCompra])
REFERENCES [dbo].[Compra] ([id])
GO

ALTER TABLE [dbo].[ItensCompra] CHECK CONSTRAINT [FK_ItensCompra_Compra]
GO

ALTER TABLE [dbo].[ItensCompra]  WITH CHECK ADD  CONSTRAINT [FK_ItensCompra_Livro] FOREIGN KEY([idLivro])
REFERENCES [dbo].[Livro] ([id])
GO

ALTER TABLE [dbo].[ItensCompra] CHECK CONSTRAINT [FK_ItensCompra_Livro]
GO

ALTER TABLE [dbo].[Livro]  WITH CHECK ADD CHECK  (([preco]>(0)))
GO


