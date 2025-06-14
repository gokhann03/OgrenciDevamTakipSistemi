USE [master]
GO
/****** Object:  Database [OgrenciDevamTakip]    Script Date: 7.06.2025 21:17:08 ******/
CREATE DATABASE [OgrenciDevamTakip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OgrenciDevamTakip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OgrenciDevamTakip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OgrenciDevamTakip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OgrenciDevamTakip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OgrenciDevamTakip] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OgrenciDevamTakip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OgrenciDevamTakip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET ARITHABORT OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OgrenciDevamTakip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OgrenciDevamTakip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OgrenciDevamTakip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OgrenciDevamTakip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OgrenciDevamTakip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OgrenciDevamTakip] SET  MULTI_USER 
GO
ALTER DATABASE [OgrenciDevamTakip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OgrenciDevamTakip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OgrenciDevamTakip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OgrenciDevamTakip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OgrenciDevamTakip] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OgrenciDevamTakip] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OgrenciDevamTakip] SET QUERY_STORE = ON
GO
ALTER DATABASE [OgrenciDevamTakip] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OgrenciDevamTakip]
GO
/****** Object:  Table [dbo].[Dersler]    Script Date: 7.06.2025 21:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dersler](
	[DersID] [int] NOT NULL,
	[DersAdi] [nvarchar](100) NULL,
	[OgretmenID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DersProgrami]    Script Date: 7.06.2025 21:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DersProgrami](
	[ProgramID] [int] NOT NULL,
	[DersID] [int] NULL,
	[Sinif] [nvarchar](10) NULL,
	[Gun] [nvarchar](10) NULL,
	[Saat] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devamlar]    Script Date: 7.06.2025 21:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devamlar](
	[DevamID] [int] NOT NULL,
	[OgrenciID] [int] NULL,
	[DersID] [int] NULL,
	[Tarih] [date] NULL,
	[Durum] [bit] NULL,
	[DonemID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DevamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donemler]    Script Date: 7.06.2025 21:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donemler](
	[DonemID] [int] NOT NULL,
	[Ad] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DonemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 7.06.2025 21:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[OgrenciID] [int] NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Sinif] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[OgrenciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogretmenler]    Script Date: 7.06.2025 21:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogretmenler](
	[OgretmenID] [int] NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Brans] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OgretmenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Dersler] ([DersID], [DersAdi], [OgretmenID]) VALUES (1, N'Matematik', 1)
INSERT [dbo].[Dersler] ([DersID], [DersAdi], [OgretmenID]) VALUES (2, N'Fizik', 2)
INSERT [dbo].[Dersler] ([DersID], [DersAdi], [OgretmenID]) VALUES (3, N'Kimya', 3)
GO
INSERT [dbo].[DersProgrami] ([ProgramID], [DersID], [Sinif], [Gun], [Saat]) VALUES (1, 1, N'10A', N'Pazartesi', N'09:00')
INSERT [dbo].[DersProgrami] ([ProgramID], [DersID], [Sinif], [Gun], [Saat]) VALUES (2, 2, N'10A', N'Salı', N'10:00')
INSERT [dbo].[DersProgrami] ([ProgramID], [DersID], [Sinif], [Gun], [Saat]) VALUES (3, 3, N'10B', N'Çarşamba', N'11:00')
GO
INSERT [dbo].[Devamlar] ([DevamID], [OgrenciID], [DersID], [Tarih], [Durum], [DonemID]) VALUES (1, 1, 1, CAST(N'2025-06-01' AS Date), 1, NULL)
INSERT [dbo].[Devamlar] ([DevamID], [OgrenciID], [DersID], [Tarih], [Durum], [DonemID]) VALUES (2, 2, 1, CAST(N'2025-06-01' AS Date), 0, NULL)
INSERT [dbo].[Devamlar] ([DevamID], [OgrenciID], [DersID], [Tarih], [Durum], [DonemID]) VALUES (3, 3, 1, CAST(N'2025-06-01' AS Date), 1, NULL)
INSERT [dbo].[Devamlar] ([DevamID], [OgrenciID], [DersID], [Tarih], [Durum], [DonemID]) VALUES (4, 1, 2, CAST(N'2025-06-02' AS Date), 0, NULL)
INSERT [dbo].[Devamlar] ([DevamID], [OgrenciID], [DersID], [Tarih], [Durum], [DonemID]) VALUES (5, 2, 2, CAST(N'2025-06-02' AS Date), 1, NULL)
INSERT [dbo].[Devamlar] ([DevamID], [OgrenciID], [DersID], [Tarih], [Durum], [DonemID]) VALUES (6, 3, 2, CAST(N'2025-06-02' AS Date), 1, NULL)
GO
INSERT [dbo].[Donemler] ([DonemID], [Ad]) VALUES (1, N'1. Dönem')
INSERT [dbo].[Donemler] ([DonemID], [Ad]) VALUES (2, N'2. Dönem')
GO
INSERT [dbo].[Ogrenciler] ([OgrenciID], [Ad], [Soyad], [Sinif]) VALUES (1, N'Ali', N'Yılmaz', N'10A')
INSERT [dbo].[Ogrenciler] ([OgrenciID], [Ad], [Soyad], [Sinif]) VALUES (2, N'Ayşe', N'Demir', N'10A')
INSERT [dbo].[Ogrenciler] ([OgrenciID], [Ad], [Soyad], [Sinif]) VALUES (3, N'Mehmet', N'Kara', N'10B')
GO
INSERT [dbo].[Ogretmenler] ([OgretmenID], [Ad], [Soyad], [Brans]) VALUES (1, N'Ahmet', N'Aksoy', N'Matematik')
INSERT [dbo].[Ogretmenler] ([OgretmenID], [Ad], [Soyad], [Brans]) VALUES (2, N'Emine', N'Şahin', N'Fizik')
INSERT [dbo].[Ogretmenler] ([OgretmenID], [Ad], [Soyad], [Brans]) VALUES (3, N'Murat', N'Çelik', N'Kimya')
GO
ALTER TABLE [dbo].[Dersler]  WITH CHECK ADD FOREIGN KEY([OgretmenID])
REFERENCES [dbo].[Ogretmenler] ([OgretmenID])
GO
ALTER TABLE [dbo].[DersProgrami]  WITH CHECK ADD FOREIGN KEY([DersID])
REFERENCES [dbo].[Dersler] ([DersID])
GO
ALTER TABLE [dbo].[Devamlar]  WITH CHECK ADD FOREIGN KEY([DersID])
REFERENCES [dbo].[Dersler] ([DersID])
GO
ALTER TABLE [dbo].[Devamlar]  WITH CHECK ADD FOREIGN KEY([DonemID])
REFERENCES [dbo].[Donemler] ([DonemID])
GO
ALTER TABLE [dbo].[Devamlar]  WITH CHECK ADD FOREIGN KEY([OgrenciID])
REFERENCES [dbo].[Ogrenciler] ([OgrenciID])
GO
USE [master]
GO
ALTER DATABASE [OgrenciDevamTakip] SET  READ_WRITE 
GO
