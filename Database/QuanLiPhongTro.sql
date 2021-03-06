USE [master]
GO
/****** Object:  Database [QuanLyPhongTro]    Script Date: 1/11/2022 9:27:59 PM ******/
CREATE DATABASE [QuanLyPhongTro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLPT', FILENAME = N'c:\dzsqls\QuanLyPhongTro.mdf' , SIZE = 4160KB , MAXSIZE = 30720KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLPT_log', FILENAME = N'c:\dzsqls\QuanLyPhongTro.ldf' , SIZE = 2368KB , MAXSIZE = 30720KB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyPhongTro] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyPhongTro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyPhongTro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyPhongTro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyPhongTro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyPhongTro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyPhongTro] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyPhongTro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyPhongTro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyPhongTro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyPhongTro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyPhongTro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyPhongTro] SET QUERY_STORE = OFF
GO
USE [QuanLyPhongTro]
GO
/****** Object:  User [alibaba_009_SQLLogin_1]    Script Date: 1/11/2022 9:28:03 PM ******/
CREATE USER [alibaba_009_SQLLogin_1] FOR LOGIN [alibaba_009_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [alibaba_009_SQLLogin_1]
GO
/****** Object:  Schema [alibaba_009_SQLLogin_1]    Script Date: 1/11/2022 9:28:04 PM ******/
CREATE SCHEMA [alibaba_009_SQLLogin_1]
GO
/****** Object:  Table [dbo].[tblAuthentication]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAuthentication](
	[userTypeID] [char](10) NOT NULL,
	[screenID] [char](10) NOT NULL,
	[isAuthenticate] [bit] NULL,
 CONSTRAINT [PK_tblAuthentication] PRIMARY KEY CLUSTERED 
(
	[userTypeID] ASC,
	[screenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblElectric]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblElectric](
	[roomID] [char](10) NOT NULL,
	[month] [varchar](10) NOT NULL,
	[oldNumber] [int] NULL,
	[newNumber] [int] NULL,
	[uPrice] [int] NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_tbtElectric] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGuest]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGuest](
	[idNumber] [char](20) NOT NULL,
	[customerName] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[birthday] [varchar](20) NULL,
	[gender] [nvarchar](50) NULL,
	[phoneNumber] [varchar](10) NULL,
	[photo] [nvarchar](200) NULL,
	[note] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblGuest] PRIMARY KEY CLUSTERED 
(
	[idNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLike]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLike](
	[postID] [int] NOT NULL,
	[userName] [char](20) NOT NULL,
	[title] [nvarchar](50) NULL,
	[img1] [varchar](500) NULL,
	[img2] [varchar](500) NULL,
	[img3] [varchar](500) NULL,
	[video] [varchar](500) NULL,
	[startDay] [datetime] NULL,
	[finishDay] [datetime] NULL,
	[status] [bit] NULL,
	[rentalTypeID] [char](10) NULL,
	[address] [nvarchar](500) NULL,
	[rentalPrice] [int] NULL,
	[area] [int] NULL,
	[contact] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblLike] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNew]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNew](
	[newsID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NULL,
	[title] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[contact] [nvarchar](150) NULL,
	[object] [nvarchar](50) NULL,
	[deposit] [int] NULL,
 CONSTRAINT [PK_tblNew] PRIMARY KEY CLUSTERED 
(
	[newsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPost]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPost](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [char](20) NULL,
	[title] [nvarchar](50) NULL,
	[img1] [varchar](500) NULL,
	[img2] [varchar](500) NULL,
	[img3] [varchar](500) NULL,
	[video] [varchar](500) NULL,
	[startDay] [datetime] NULL,
	[finishDay] [datetime] NULL,
	[status] [bit] NULL,
	[rentalTypeID] [char](10) NULL,
	[address] [nvarchar](500) NULL,
	[rentalPrice] [int] NULL,
	[area] [int] NULL,
	[contact] [nvarchar](50) NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReceipt]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReceipt](
	[roomID] [char](10) NOT NULL,
	[month] [char](10) NOT NULL,
	[roomFee] [int] NULL,
	[waterFee] [int] NULL,
	[eletricFee] [int] NULL,
	[otherFee] [int] NULL,
	[note] [nvarchar](50) NULL,
	[debt] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblReceipt] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRentalType]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRentalType](
	[rentalTypeID] [char](10) NOT NULL,
	[rentalTypeName] [nvarchar](50) NULL,
	[icon] [varchar](500) NULL,
 CONSTRAINT [PK_rentalType] PRIMARY KEY CLUSTERED 
(
	[rentalTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoom](
	[roomID] [char](10) NOT NULL,
	[location] [nvarchar](50) NULL,
	[maxQuantity] [int] NULL,
	[currentQuantity] [int] NULL,
	[roomPrice] [money] NULL,
	[waterNo] [int] NULL,
	[electricNo] [int] NULL,
	[address] [nvarchar](150) NULL,
	[roomTypeID] [char](10) NULL,
	[statusID] [char](10) NULL,
	[userTypeID] [char](10) NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoomDetail]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomDetail](
	[roomID] [char](10) NOT NULL,
	[customerIDNumber] [char](20) NOT NULL,
	[rentDay] [date] NULL,
	[finishDay] [date] NULL,
 CONSTRAINT [PK_roomDetal_1] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC,
	[customerIDNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoomType]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomType](
	[roomTypeID] [char](10) NOT NULL,
	[roomName] [nvarchar](50) NULL,
 CONSTRAINT [PK_roomType] PRIMARY KEY CLUSTERED 
(
	[roomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScreen]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblScreen](
	[screenID] [char](10) NOT NULL,
	[screenName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblScreen] PRIMARY KEY CLUSTERED 
(
	[screenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [char](10) NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userName] [char](20) NOT NULL,
	[name] [nvarchar](50) NULL,
	[gender] [nchar](10) NULL,
	[phone] [nchar](10) NULL,
	[address] [nvarchar](150) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[avatar] [varchar](max) NULL,
	[userTypeID] [char](10) NULL,
	[success] [bit] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserType](
	[userTypeID] [char](10) NOT NULL,
	[userTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_userType] PRIMARY KEY CLUSTERED 
(
	[userTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWater]    Script Date: 1/11/2022 9:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWater](
	[roomID] [char](10) NOT NULL,
	[month] [varchar](10) NOT NULL,
	[oldNumber] [int] NULL,
	[newNumber] [int] NULL,
	[uPrice] [int] NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_tblWater] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAuthentication] ([userTypeID], [screenID], [isAuthenticate]) VALUES (N'UT001     ', N'Screen001 ', NULL)
INSERT [dbo].[tblAuthentication] ([userTypeID], [screenID], [isAuthenticate]) VALUES (N'UT002     ', N'Screen002 ', NULL)
GO
INSERT [dbo].[tblElectric] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room001   ', N'7', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblElectric] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room001   ', N'8', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblElectric] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room002   ', N'7', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblElectric] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room002   ', N'8', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblElectric] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room003   ', N'8', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblGuest] ([idNumber], [customerName], [address], [birthday], [gender], [phoneNumber], [photo], [note]) VALUES (N'G001                ', N'Nguyễn Văn Hiển', N'TPHCM', N'23/5/2001', N'Nam', N'0596516865', N'hinh1.jpg', NULL)
INSERT [dbo].[tblGuest] ([idNumber], [customerName], [address], [birthday], [gender], [phoneNumber], [photo], [note]) VALUES (N'G002                ', N'Phạm Lê Huyền Anh', N'Vũng Tàu', N'12/7/2000', N'Nữ', N'0649841616', N'hinh2.jpg', NULL)
INSERT [dbo].[tblGuest] ([idNumber], [customerName], [address], [birthday], [gender], [phoneNumber], [photo], [note]) VALUES (N'G003                ', N'Trần Hoài Anh', N'Phan Thiết', N'25/4/1999', N'Nam', N'0359466166', NULL, NULL)
GO
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (65, N'testlike1           ', N'Phòng Mới Xây Ngay Ngã Tư 3/2 - Lê Đại Hành', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_03382bc2-e67e-4778-95ae-8de59e834262.jpg?alt=media&token=9fa34b9a-7312-4129-92ee-d16a022ff673', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_07a146b7-64e7-430e-ab51-8b518b20e07d.jpg?alt=media&token=6bc9c810-38d4-474b-a2be-960cc5887f87', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_07a146b7-64e7-430e-ab51-8b518b20e07d.jpg?alt=media&token=6bc9c810-38d4-474b-a2be-960cc5887f87', NULL, CAST(N'2021-12-28T12:27:07.193' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, N'RT001     ', N'Hùng Vuong', 2000000, 25, N'0785842451')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (65, N'vunguyen123         ', N'Phòng Mới Xây Ngay Ngã Tư 3/2 - Lê Đại Hành', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_03382bc2-e67e-4778-95ae-8de59e834262.jpg?alt=media&token=9fa34b9a-7312-4129-92ee-d16a022ff673', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_07a146b7-64e7-430e-ab51-8b518b20e07d.jpg?alt=media&token=6bc9c810-38d4-474b-a2be-960cc5887f87', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_07a146b7-64e7-430e-ab51-8b518b20e07d.jpg?alt=media&token=6bc9c810-38d4-474b-a2be-960cc5887f87', NULL, CAST(N'2021-12-28T12:27:07.193' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, N'RT001     ', N'Hùng Vuong', 2000000, 25, N'0785842451')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (66, N'hoang               ', N'Phòng trọ Quận Phú Nhuận 18m²', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/5277efa82d7c325c54374d4049b2b808-2741868958350573679.jpg?alt=media&token=bd99e618-e7f1-414a-b42d-30536118641f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20/13, Đường Thích Quảng Đức, Phường 5, Quận Phú Nhuận, Tp Hồ Chí Minh', 2000000, 18, N'0914771931')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (66, N'namphan1999         ', N'Phòng trọ Quận Phú Nhuận 18m²', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/5277efa82d7c325c54374d4049b2b808-2741868958350573679.jpg?alt=media&token=bd99e618-e7f1-414a-b42d-30536118641f', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/e6af0d3c0111c209123bc76cdb356a07-2741868958282095803.jpg?alt=media&token=1aab8427-c17e-4bdb-a5b9-508dfc47d71a', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/af34bfc11d5b0424def9285f117f5441-2741868958232661699.jpg?alt=media&token=d63e6d81-5f78-43e5-90ac-d02eff51d316', NULL, CAST(N'2021-12-28T12:27:12.957' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, N'RT001     ', N'20/13, Đường Thích Quảng Đức, Phường 5, Quận Phú Nhuận, Tp Hồ Chí Minh', 2000000, NULL, NULL)
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (66, N'testlike1           ', N'Phòng trọ Quận Phú Nhuận 18m²', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/5277efa82d7c325c54374d4049b2b808-2741868958350573679.jpg?alt=media&token=bd99e618-e7f1-414a-b42d-30536118641f', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/e6af0d3c0111c209123bc76cdb356a07-2741868958282095803.jpg?alt=media&token=1aab8427-c17e-4bdb-a5b9-508dfc47d71a', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/af34bfc11d5b0424def9285f117f5441-2741868958232661699.jpg?alt=media&token=d63e6d81-5f78-43e5-90ac-d02eff51d316', NULL, CAST(N'2021-12-28T12:27:12.957' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, N'RT001     ', N'20/13, Đường Thích Quảng Đức, Phường 5, Quận Phú Nhuận, Tp Hồ Chí Minh', 2000000, 18, N'0914771931')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (66, N'vunguyen123         ', N'Phòng trọ Quận Phú Nhuận 18m²', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/5277efa82d7c325c54374d4049b2b808-2741868958350573679.jpg?alt=media&token=bd99e618-e7f1-414a-b42d-30536118641f', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/e6af0d3c0111c209123bc76cdb356a07-2741868958282095803.jpg?alt=media&token=1aab8427-c17e-4bdb-a5b9-508dfc47d71a', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/af34bfc11d5b0424def9285f117f5441-2741868958232661699.jpg?alt=media&token=d63e6d81-5f78-43e5-90ac-d02eff51d316', NULL, CAST(N'2021-12-28T12:27:12.957' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, N'RT001     ', N'20/13, Đường Thích Quảng Đức, Phường 5, Quận Phú Nhuận, Tp Hồ Chí Minh', 2000000, 18, N'0914771931')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (67, N'hoang               ', N'Nhà mới xây phòng đẹp như khách sạn', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', NULL, NULL, NULL, NULL, NULL, 1, N'RT004     ', N'Đường Cộng Hòa, Phường 4, Quận Tân Bình, Tp Hồ Chí Minh', 3000000, 30, N'0919227968')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (67, N'nam                 ', N'Nhà mới xây phòng đẹp như khách sạn', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/3c5221aae01532a854dbf2c5d2f8919b-2752302081911322029.jpg?alt=media&token=98c0ede2-03d8-4e18-852b-9fc1a5134466', NULL, CAST(N'2021-12-28T12:27:17.127' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1, N'RT004     ', N'Đường Cộng Hòa, Phường 4, Quận Tân Bình, Tp Hồ Chí Minh', 3000000, NULL, NULL)
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (67, N'testlike1           ', N'Nhà mới xây phòng đẹp như khách sạn', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/3c5221aae01532a854dbf2c5d2f8919b-2752302081911322029.jpg?alt=media&token=98c0ede2-03d8-4e18-852b-9fc1a5134466', NULL, CAST(N'2021-12-28T12:27:17.127' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1, N'RT004     ', N'Đường Cộng Hòa, Phường 4, Quận Tân Bình, Tp Hồ Chí Minh', 3000000, 30, N'0919227968')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (67, N'vunguyen123         ', N'Nhà mới xây phòng đẹp như khách sạn', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/3c5221aae01532a854dbf2c5d2f8919b-2752302081911322029.jpg?alt=media&token=98c0ede2-03d8-4e18-852b-9fc1a5134466', NULL, CAST(N'2021-12-28T12:27:17.127' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1, N'RT004     ', N'Đường Cộng Hòa, Phường 4, Quận Tân Bình, Tp Hồ Chí Minh', 3000000, 30, N'0919227968')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (68, N'hoang               ', N'Phòng đầy đủ nội thất đường CỘNG HOÀ', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/c72676b1d4318af9e7d1e55fe4e68900-2699227116810527746.jpg?alt=media&token=f8614ee5-265e-429a-a087-42d3c06baa1b', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/4ab62d23c7d66d0f6d6099db3c91ec8f-2699227116936773189.jpg?alt=media&token=fdd977f5-317a-4a8a-9600-03c2819d0519', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/f7b441bf51f56457af2a6c982974cbc0-2699227156622855096.jpg?alt=media&token=bc56e4f6-15d8-4078-aab8-e0ba927f8151', NULL, CAST(N'2021-12-28T13:05:56.597' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1, N'RT001     ', N'
636, Đường Cộng Hòa, Phường 13, Quận Tân Bình, Tp Hồ Chí Minh', 3000000, 17, N'0984378686')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (68, N'namphan1999         ', N'Phòng đầy đủ nội thất đường CỘNG HOÀ', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/c72676b1d4318af9e7d1e55fe4e68900-2699227116810527746.jpg?alt=media&token=f8614ee5-265e-429a-a087-42d3c06baa1b', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/4ab62d23c7d66d0f6d6099db3c91ec8f-2699227116936773189.jpg?alt=media&token=fdd977f5-317a-4a8a-9600-03c2819d0519', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/f7b441bf51f56457af2a6c982974cbc0-2699227156622855096.jpg?alt=media&token=bc56e4f6-15d8-4078-aab8-e0ba927f8151', NULL, CAST(N'2021-12-28T13:05:56.597' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1, N'RT001     ', N'
636, Đường Cộng Hòa, Phường 13, Quận Tân Bình, Tp Hồ Chí Minh', 3000000, NULL, NULL)
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (91, N'testlike1           ', N'Phòng trọ số 4 Nguyễn Sáng', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/2.png?alt=media&token=e6fbaa1d-5920-46ee-accb-594df7c79465', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/3.png?alt=media&token=908c334b-10cf-43c7-b794-4e4d488add5b', NULL, NULL, CAST(N'2022-01-02T03:37:24.000' AS DateTime), NULL, 1, N'RT001     ', N'4 Nguyễn Sáng', 200000, 30, N'0343509216')
INSERT [dbo].[tblLike] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (91, N'vu0110              ', N'Phòng trọ số 4 Nguyễn Sáng', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/2.png?alt=media&token=e6fbaa1d-5920-46ee-accb-594df7c79465', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/3.png?alt=media&token=908c334b-10cf-43c7-b794-4e4d488add5b', NULL, NULL, CAST(N'2022-01-02T03:37:24.000' AS DateTime), NULL, 1, N'RT001     ', N'4 Nguyễn Sáng', 200000, 30, N'0343509216')
GO
SET IDENTITY_INSERT [dbo].[tblNew] ON 

INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (28, 65, N'Phòng Mới Xây Ngay Ngã Tư 3/2 - Lê Đại Hành', N'- Giờ giấc TỰ DO , có BẢO VỆ an ninh và trông coi xe 24/24, Có nhà ĐỂ XE RIÊNG; Phòng rộng thoáng, có GÁC LỮNG và Toilet riêng;

- Có bếp nấu ăn

- Wifi miễn phí

- Có người DỌN DẸP VỆ SINH', N'0785842451', N'', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (29, 66, N'Phòng trọ Quận Phú Nhuận 18m²', N'PHÒNG RỘNG, THOÁNG,MÁT, CÓ CỬA SỔ RIÊNG TỪNG PHÒNG, CÓ BAN CÔNG. ĐẢM BẢO XEM PHÒNG ƯNG NGAY.TIỆN ÍCH FREE : CHỖ ĐỂ XE, WIFI. GIỜ GIẤC TỰ DO, RA VÀO BẰNG KHOÁ VÂN TAY, 2 LỚP.', N'0914771931', N'Nữ', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (30, 67, N'Nhà mới xây phòng đẹp như khách sạn', N'- phòng mới đẹp như hình toilét riêng
-máy lạnh daikin mới
- có chỗ nấu ăn cho để xe tự do không ở với chu
-điện ưu đãi 3000k 1 kw nước 50 k một người
- thoáng mát yên tĩnh có máy giặt
- đối diện macximac cộng hoà
-108/4/17cong hoa 200 m toi vin com 300 m toi cong vien hoang van thu
- co bep nau an rong rai san vuon 30 m', N'0919227968', N'', 3000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (34, 68, N'Phòng đầy đủ nội thất đường CỘNG HOÀ', N'Phòng trọ Tân BÌNH giá rẻ đây Mn ơiii, Mn ơiiiii
Mình còn 2 phòng trống
Phòng 2.6 tr full nội thất, CÓ GÁC, có CỬA SỔ
+CÓ MÁY GIẶT FREE, THANG MÁY
+Máy lạnh cực mát
+Có chỗ để xe, bảo vệ 24/24, camera giám sát
+Toilet riêng mỗi phòng
+Điện 3.5k/kg, nước 80k/ng, xe 100k/xe, WIFI tốc độ cao
+Kệ bếp tiện nghi, Được nấu ăn
+Phòng mới sơn lại nên rất sạch sẽ
Vị trí thuận tiện đi lại: Đối diện Etown Cộng Hòa, ĐI lại thuận tiện các quận trung tâm, gần chợ, Bách Hóa Xanh...', N'0984378686', N'', 3000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (35, 69, N'Phong tro gia re', N'Phomg tro an ninh sach se thoang mat.', N'0846464682', N'', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (36, 70, N'Phong tro gia re', N'Phomg tro an ninh sach se thoang mat.', N'0846464682', N'', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (37, 70, N'Phòng Mới Xây Ngay Ngã Tư 3/2 - Lê Đại Hành', N'- Giờ giấc TỰ DO , có BẢO VỆ an ninh và trông coi xe 24/24, Có nhà ĐỂ XE RIÊNG; Phòng rộng thoáng, có GÁC LỮNG và Toilet riêng;

- Có bếp nấu ăn

- Wifi miễn phí

- Có người DỌN DẸP VỆ SINH', N'0785842451', N'Tất cả', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (44, 91, N'vu123', N'', N'03333', N'Nam', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (45, NULL, N'vu123', NULL, N'03333', N'Nam', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (46, NULL, N'vu123', NULL, N'03333', N'Nam', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (47, NULL, N'vu123', NULL, N'03333', N'Nam', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (48, NULL, N'vu123', NULL, N'03333', N'Nam', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (49, NULL, N'vu123', NULL, N'03333', N'Nam', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (50, NULL, N'vu123', NULL, N'03333', N'Nam', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (51, 92, N'vu123', N'Phòng trọ số 4 Nguyễn SángPhòng trọ số 4 Nguyễn SángPhòng trọ số 4 Nguyễn SángPhòng trọ số 4 Nguyễn SángPhòng trọ số 4 Nguyễn SángPhòng trọ số 4 Nguyễn Sáng
', N'03333', N'Nam', 2000000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (52, 93, N'Phong tro moi xay', N'Phong tro moi xay sach see thoang mat', N'0817658856', N'Tất cả', 1500000)
INSERT [dbo].[tblNew] ([newsID], [postID], [title], [description], [contact], [object], [deposit]) VALUES (53, 94, N'vu123', N'Vũ mới đăngVũ mới đăngVũ mới đăng', N'03333', N'Nam', 2000000)
SET IDENTITY_INSERT [dbo].[tblNew] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPost] ON 

INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (65, N'hoang               ', N'Phòng Mới Xây Ngay Ngã Tư 3/2 - Lê Đại Hành', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_03382bc2-e67e-4778-95ae-8de59e834262.jpg?alt=media&token=9fa34b9a-7312-4129-92ee-d16a022ff673', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_07a146b7-64e7-430e-ab51-8b518b20e07d.jpg?alt=media&token=6bc9c810-38d4-474b-a2be-960cc5887f87', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_07a146b7-64e7-430e-ab51-8b518b20e07d.jpg?alt=media&token=6bc9c810-38d4-474b-a2be-960cc5887f87', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/VID_20211219_152718.mp4?alt=media&token=eef0800a-4389-430b-b998-9d9ddfd6cd8d', CAST(N'2021-12-28T12:27:07.193' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, N'RT001     ', N'Hùng Vuong', 2000000, 25, N'0785842451')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (66, N'hoang               ', N'Phòng trọ Quận Phú Nhuận 18m²', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/5277efa82d7c325c54374d4049b2b808-2741868958350573679.jpg?alt=media&token=bd99e618-e7f1-414a-b42d-30536118641f', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/e6af0d3c0111c209123bc76cdb356a07-2741868958282095803.jpg?alt=media&token=1aab8427-c17e-4bdb-a5b9-508dfc47d71a', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/af34bfc11d5b0424def9285f117f5441-2741868958232661699.jpg?alt=media&token=d63e6d81-5f78-43e5-90ac-d02eff51d316', NULL, CAST(N'2021-12-28T12:27:12.957' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, N'RT001     ', N'20/13, Đường Thích Quảng Đức, Phường 5, Quận Phú Nhuận, Tp Hồ Chí Minh', 2000000, 18, N'0914771931')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (67, N'hoang               ', N'Nhà mới xây phòng đẹp như khách sạn', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/6bfd03036ccb2efa3def7c421aeb6997-2752302082351177520.jpg?alt=media&token=5e787e74-e17c-42d6-bdf6-fa434fff1aba', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/3c5221aae01532a854dbf2c5d2f8919b-2752302081911322029.jpg?alt=media&token=98c0ede2-03d8-4e18-852b-9fc1a5134466', NULL, CAST(N'2021-12-28T12:27:17.127' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1, N'RT004     ', N'Đường Cộng Hòa, Phường 4, Quận Tân Bình, Tp Hồ Chí Minh', 3000000, 30, N'0919227968')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (68, N'hoang               ', N'Phòng đầy đủ nội thất đường CỘNG HOÀ', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/c72676b1d4318af9e7d1e55fe4e68900-2699227116810527746.jpg?alt=media&token=f8614ee5-265e-429a-a087-42d3c06baa1b', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/4ab62d23c7d66d0f6d6099db3c91ec8f-2699227116936773189.jpg?alt=media&token=fdd977f5-317a-4a8a-9600-03c2819d0519', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/f7b441bf51f56457af2a6c982974cbc0-2699227156622855096.jpg?alt=media&token=bc56e4f6-15d8-4078-aab8-e0ba927f8151', NULL, CAST(N'2021-12-28T13:05:56.597' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1, N'RT001     ', N'
636, Đường Cộng Hòa, Phường 13, Quận Tân Bình, Tp Hồ Chí Minh', 3000000, 17, N'0984378686')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (69, N'nam                 ', N'Phong tro gia re', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_cca8f74c-b755-411d-b70c-8b94c51419d7.jpg?alt=media&token=a1d814af-daa5-4748-be8a-3b8137f028d6', NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/VID_20211225_182626.mp4?alt=media&token=b14d55a5-a608-48ce-99c3-94dc1dcd6d0c', CAST(N'2022-01-02T03:37:24.000' AS DateTime), NULL, 1, N'RT006     ', N'35 Nguyen Huu Tien,tpHCM', 2000000, 30, N'0846464682')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (70, N'nam                 ', N'Phong tro gia re', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_cca8f74c-b755-411d-b70c-8b94c51419d7.jpg?alt=media&token=a1d814af-daa5-4748-be8a-3b8137f028d6', NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/VID_20211225_182626.mp4?alt=media&token=b14d55a5-a608-48ce-99c3-94dc1dcd6d0c', CAST(N'2022-01-02T03:37:24.000' AS DateTime), NULL, 1, N'RT006     ', N'35 Nguyen Huu Tien,tpHCM', 2000000, 30, N'0846464682')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (91, N'vu                  ', N'Phòng trọ số 4 Nguyễn Sáng', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/2.png?alt=media&token=e6fbaa1d-5920-46ee-accb-594df7c79465', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/3.png?alt=media&token=908c334b-10cf-43c7-b794-4e4d488add5b', NULL, NULL, CAST(N'2022-01-02T03:37:24.000' AS DateTime), NULL, 1, N'RT001     ', N'4 Nguyễn Sáng', 200000, 30, N'0343509216')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (92, N'vu                  ', N'Phòng trọ số 4 Nguyễn Sáng', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/de1.JPG?alt=media&token=1c2efa7a-5896-4bea-9782-fd859a050be2', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/de2.JPG?alt=media&token=c68bc990-17e4-4d4e-8b4d-d8932ea3bc66', NULL, NULL, CAST(N'2022-01-02T03:37:24.000' AS DateTime), NULL, 1, N'RT001     ', N'4 Nguyễn Sáng, Tây Thạnh, Tân Phú', 99999, 19, N'0343509216')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (93, N'namphan1999         ', N'Phong tro moi xay', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_ac155d5c-04a3-48cb-8ca0-cfc3696efb52.jpg?alt=media&token=db47e8b8-3523-4ba8-acf1-0b142b148b56', NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/VID_20211225_182626.mp4?alt=media&token=dcfc8ac1-731d-4474-8f0b-bea9b0b1ac26', CAST(N'2022-01-08T08:11:27.000' AS DateTime), NULL, 1, N'RT003     ', N'35 Nguyen Huu Tien , Tay Thanh, Tan Phu, TPHCM', 1500000, 20, N'0817658856')
INSERT [dbo].[tblPost] ([postID], [userName], [title], [img1], [img2], [img3], [video], [startDay], [finishDay], [status], [rentalTypeID], [address], [rentalPrice], [area], [contact]) VALUES (94, N'vu                  ', N'Vũ mới đăng', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/bg-chrome.jpg?alt=media&token=bfb0a799-5130-4c77-9e28-82b5ef110835', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/12.JPG?alt=media&token=52d6e16a-a660-4239-9aa6-142b041538a2', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/448e9ef392635b3d0272.jpg?alt=media&token=c24ec376-46e6-4ae9-ac60-81da0b6a21a7', NULL, CAST(N'2022-01-02T03:37:24.000' AS DateTime), NULL, 1, N'RT001     ', N'4 Nguyễn Sáng, Tây Thạnh, Tân Phú', 200000, 30, N'0343509216')
SET IDENTITY_INSERT [dbo].[tblPost] OFF
GO
INSERT [dbo].[tblReceipt] ([roomID], [month], [roomFee], [waterFee], [eletricFee], [otherFee], [note], [debt], [status]) VALUES (N'Room001   ', N'7         ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblReceipt] ([roomID], [month], [roomFee], [waterFee], [eletricFee], [otherFee], [note], [debt], [status]) VALUES (N'Room001   ', N'8         ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRentalType] ([rentalTypeID], [rentalTypeName], [icon]) VALUES (N'RT001     ', N'Phòng Trọ cho Thuê', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/Icons%2Ficon1.png?alt=media&token=174e97a7-5c24-4f83-846c-478e31737e7f')
INSERT [dbo].[tblRentalType] ([rentalTypeID], [rentalTypeName], [icon]) VALUES (N'RT002     ', N'Ký Túc Xá Cho Thuê', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/Icons%2Ficon6.png?alt=media&token=6d36c9e3-d6b2-48be-9c48-78ad70941e9e')
INSERT [dbo].[tblRentalType] ([rentalTypeID], [rentalTypeName], [icon]) VALUES (N'RT003     ', N'Tìm Người Ở Ghép', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/Icons%2Ficon5.png?alt=media&token=c55a619f-7f44-4561-a3bc-33ab1cca69ba')
INSERT [dbo].[tblRentalType] ([rentalTypeID], [rentalTypeName], [icon]) VALUES (N'RT004     ', N'Nhà Nguyên Căn', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/Icons%2Ficon2.png?alt=media&token=e48f182c-c555-4c72-9482-169765b0a85f')
INSERT [dbo].[tblRentalType] ([rentalTypeID], [rentalTypeName], [icon]) VALUES (N'RT005     ', N'Căn Hộ Cho Thuê', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/Icons%2Ficon3.png?alt=media&token=b7bcfcb4-bb3e-45d1-9653-a05fbdbd78db')
INSERT [dbo].[tblRentalType] ([rentalTypeID], [rentalTypeName], [icon]) VALUES (N'RT006     ', N'Mặt Bằng Cho Thuê', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/Icons%2Ficon4.png?alt=media&token=93b68154-0b86-485a-b9fe-100496490116')
GO
INSERT [dbo].[tblRoom] ([roomID], [location], [maxQuantity], [currentQuantity], [roomPrice], [waterNo], [electricNo], [address], [roomTypeID], [statusID], [userTypeID]) VALUES (N'Room001   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblRoom] ([roomID], [location], [maxQuantity], [currentQuantity], [roomPrice], [waterNo], [electricNo], [address], [roomTypeID], [statusID], [userTypeID]) VALUES (N'Room002   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblRoom] ([roomID], [location], [maxQuantity], [currentQuantity], [roomPrice], [waterNo], [electricNo], [address], [roomTypeID], [statusID], [userTypeID]) VALUES (N'Room003   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRoomDetail] ([roomID], [customerIDNumber], [rentDay], [finishDay]) VALUES (N'Room001   ', N'G001                ', NULL, NULL)
INSERT [dbo].[tblRoomDetail] ([roomID], [customerIDNumber], [rentDay], [finishDay]) VALUES (N'Room001   ', N'G002                ', NULL, NULL)
GO
INSERT [dbo].[tblRoomType] ([roomTypeID], [roomName]) VALUES (N'RT001     ', N'Phòng không có gác')
INSERT [dbo].[tblRoomType] ([roomTypeID], [roomName]) VALUES (N'RT002     ', NULL)
GO
INSERT [dbo].[tblScreen] ([screenID], [screenName]) VALUES (N'Screen001 ', NULL)
INSERT [dbo].[tblScreen] ([screenID], [screenName]) VALUES (N'Screen002 ', NULL)
GO
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'1         ', N'Test')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'2         ', N'Test1')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'3         ', NULL)
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'4         ', N'1Test')
GO
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'001test             ', N'Vô danh', N'Nam       ', N'0358481651', NULL, NULL, NULL, N'https://thuthuatnhanh.com/wp-content/uploads/2021/02/Anh-avatar-bua-cute-dep-390x390.jpg', NULL, NULL)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'01test              ', N'Vô danh', N'Nam       ', N'0348496465', N'HCM', N'vd@gmail.com', N'1', NULL, N'UT001     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'02test              ', N'Vô danh 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'123zo               ', N'namnam', N'Nam       ', N'1234444   ', N'1 hoang dieu', N'asdad@gmail.com', N'1', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'1Test               ', N'1', NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'1Test1              ', N'Hoàng', N'Nam       ', N'0688564842', N'HCM', N'nhh@gmail.com', N'1', NULL, N'UT001     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'ádasdasd            ', N'ádasdasd', N'Nam       ', N'0123456   ', N'ádasdasd', N'asdasd@gmail.com', N'123', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'birthday12          ', N'hung lê', N'Nam       ', N'0387650796', N'quang tri', N'birthday2x@gmail.com', N'123456', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Fufhfufj            ', N'Meno', N'Nam       ', N'04546     ', N'Hshshs', N'Hahsv@gmail.com', N'123', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_9b0f46be-8e8e-49f6-ab0e-72968c82545e.jpg?alt=media&token=37dfb53e-e1f2-4f80-bc36-e37622da5d37', N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Fufu                ', N'Fjgi', N'Nam       ', N'8686      ', N'Chxh', N'Fyggy@gmail.com', N'333', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Gdyd                ', N'Bkh', N'Nam       ', N'898       ', N'Fufh', N'Hfuf@gmail.com', N'12', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Hdhfh               ', N'Dhfhfu12', N'Nam       ', N'098686    ', N'Dhfjj', N'Chch', N'123', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Hdhxhfh             ', N'Rjfjfh', N'Nam       ', N'Tigjc     ', N'Dhfjf', N'Ncbcn', N'123123', N'aaaaaaaaaaaaaaaaaaaaa', N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Hfhr                ', N'Bfhc', N'Nam       ', N'05645566  ', N'Cncj', N'Fjfj@gmail.com', N'223123', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'hhhhh               ', N'a', N'Nam       ', N'123       ', N'a', N'aaaa@gmail.com', N'123', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_b61da32e-f253-4f3f-9cb5-3c6b05eb04e1.jpg?alt=media&token=b5a989ac-9d69-4c12-ba2a-c26666b618cd', N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'hoang               ', N'Hoàng Nam', N'Nam       ', N'0688564842', N'HCM', N'nhh@gmail.com', N'1', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_66cedd7e-f817-4c2f-b6b4-d426464ba2b2.jpg?alt=media&token=547403b7-f5fe-4886-abbd-d71ebb977702', N'UT001     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'hungmaster          ', N'Hoàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'nam                 ', N'Nam', N'Nam       ', N'0846464682', N'HCM', N'phn@gmail.com', N'nam123', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_beef6d5c-3be8-4442-a9cd-c1386de6429e.jpg?alt=media&token=837eb684-15d6-4ca5-954a-e470b18e688a', N'UT001     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'namhoang            ', N'phan ', N'Nam       ', N'aa        ', N'avc', N'hoangnam@gmail.com', N'123444', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'namphan1999         ', N'nam phan', N'Nam       ', N'0817658856', N'daklak', N'hoangnamgreat@gmail.com', N'nampro123', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_ccff0e27-80f8-4a78-ba19-d591b1f3554f.jpg?alt=media&token=be5efd77-d646-4fdb-8735-4533250cab1c', N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'nguyenvu123         ', N'Nguyễn Văn Vũ1', N'Nam       ', N'0333424784', N'140 Lê Trọng Tấn', N'vun574111198@gmail.com', N'123123', NULL, NULL, 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'nhuquynh2000        ', N'Dinh Thi Nhu Quynh', N'Nữ        ', N'0869091049', N'Phu Yen', N'nhuquynh@gmail.com', N'123456', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Testavatar          ', N'Avatar', N'Nam       ', N'45757     ', N'J ch vùh', N'Cnchfj', N'123456', N'', N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'testdk1             ', N'Hello World', N'Nam       ', N'0999999999', N'Hai Lang - Quang Tri', N'abc@gmail.com', N'123456', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/rn_image_picker_lib_temp_080f80ae-c3db-4701-8912-0d5d3f84e3e5.jpg?alt=media&token=3b725661-67cb-487f-af40-2ad565d2cbeb', N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Testfbggg           ', N'Hưng Lê', N'Nam       ', N'099558    ', N'Vhh', N'lehungqtiter@gmail.com', N'123', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'testlike1           ', N'Nguyễn Văn Vũ', N'Nam       ', N'0343509123', N'140 Lê Trọng Tấn', N'vun574121298@gmail.com', N'123123', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/3.png?alt=media&token=1500e1cc-f4b2-4348-9795-d8e1f68d55ad', NULL, 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'vu                  ', N'Nguyễn Văn Vũ', N'Nam       ', N'0343509216', N'140 Lê Trọng Tấn', N'vun57498@gmail.com', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'vu0110              ', N'Nguyễn Văn Vũ', N'Nam       ', N'0343509123', NULL, N'vun57498@gmail.com', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'vunguyen            ', N'Nguyễn Văn Anh12', N'Nam       ', N'0343509123', N'140 Lê Trọng Tấn', N'vun57498@gmail.com', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'vunguyen123         ', NULL, NULL, NULL, NULL, N'vun57498@gmail.com', N'123123', NULL, N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'vunguyen123123      ', N'Nguyễn Văn Anh', N'Nam       ', N'0343509216', N'140 Lê Trọng Tấn', N'vun512217498@gmail.com', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'vuthu7              ', N'Nguyễn Văn Vũ', N'Nam       ', N'0343509216', N'140 Lê Trọng Tấn', N'vun512127498@gmail.com', N'123123', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-develop.appspot.com/o/bg-chrome.jpg?alt=media&token=c233c708-f5f7-44ee-adcf-55af91a7183f', NULL, 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Xhfjgi              ', N'Chcbvj', N'Nam       ', N'989890909 ', N'Cnfjgj', N'Dunfjc@gmail.com', N'123123', N'https://firebasestorage.googleapis.com/v0/b/phongtro123-dev.appspot.com/o/rn_image_picker_lib_temp_c64f4485-50e8-4fb8-98ae-89a6b6ba0527.jpg?alt=media&token=b08a7286-0d34-4f2e-8275-6958eb542391', N'UT002     ', 1)
INSERT [dbo].[tblUser] ([userName], [name], [gender], [phone], [address], [email], [password], [avatar], [userTypeID], [success]) VALUES (N'Ðuhfhfh             ', N'Fbfhtuti', N'Nam       ', N'00586     ', N'Hdhfjcj', N'Bdjfz@gmail.com', N'1', NULL, N'UT002     ', 1)
GO
INSERT [dbo].[tblUserType] ([userTypeID], [userTypeName]) VALUES (N'UT001     ', N'Admin')
INSERT [dbo].[tblUserType] ([userTypeID], [userTypeName]) VALUES (N'UT002     ', N'Người dùng')
GO
INSERT [dbo].[tblWater] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room001   ', N'7', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblWater] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room001   ', N'8', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblWater] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room002   ', N'7', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblWater] ([roomID], [month], [oldNumber], [newNumber], [uPrice], [amount]) VALUES (N'Room002   ', N'8', NULL, NULL, NULL, NULL)
GO
ALTER TABLE [dbo].[tblPost] ADD  CONSTRAINT [df_status]  DEFAULT ('False') FOR [status]
GO
ALTER TABLE [dbo].[tblAuthentication]  WITH CHECK ADD  CONSTRAINT [FK_tblAuthentication_tblAuthentication] FOREIGN KEY([userTypeID])
REFERENCES [dbo].[tblUserType] ([userTypeID])
GO
ALTER TABLE [dbo].[tblAuthentication] CHECK CONSTRAINT [FK_tblAuthentication_tblAuthentication]
GO
ALTER TABLE [dbo].[tblAuthentication]  WITH CHECK ADD  CONSTRAINT [FK_tblAuthentication_tblScreen] FOREIGN KEY([screenID])
REFERENCES [dbo].[tblScreen] ([screenID])
GO
ALTER TABLE [dbo].[tblAuthentication] CHECK CONSTRAINT [FK_tblAuthentication_tblScreen]
GO
ALTER TABLE [dbo].[tblElectric]  WITH CHECK ADD  CONSTRAINT [FK_tbtElectric_tblRoom] FOREIGN KEY([roomID])
REFERENCES [dbo].[tblRoom] ([roomID])
GO
ALTER TABLE [dbo].[tblElectric] CHECK CONSTRAINT [FK_tbtElectric_tblRoom]
GO
ALTER TABLE [dbo].[tblLike]  WITH CHECK ADD  CONSTRAINT [FK_tblLike_tblPost] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPost] ([postID])
GO
ALTER TABLE [dbo].[tblLike] CHECK CONSTRAINT [FK_tblLike_tblPost]
GO
ALTER TABLE [dbo].[tblLike]  WITH CHECK ADD  CONSTRAINT [FK_tblLike_tblUser] FOREIGN KEY([userName])
REFERENCES [dbo].[tblUser] ([userName])
GO
ALTER TABLE [dbo].[tblLike] CHECK CONSTRAINT [FK_tblLike_tblUser]
GO
ALTER TABLE [dbo].[tblNew]  WITH CHECK ADD  CONSTRAINT [FK_news_post] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPost] ([postID])
GO
ALTER TABLE [dbo].[tblNew] CHECK CONSTRAINT [FK_news_post]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblRentalType] FOREIGN KEY([rentalTypeID])
REFERENCES [dbo].[tblRentalType] ([rentalTypeID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblRentalType]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblUser] FOREIGN KEY([userName])
REFERENCES [dbo].[tblUser] ([userName])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblUser]
GO
ALTER TABLE [dbo].[tblReceipt]  WITH CHECK ADD  CONSTRAINT [FK_tblReceipt_room] FOREIGN KEY([roomID])
REFERENCES [dbo].[tblRoom] ([roomID])
GO
ALTER TABLE [dbo].[tblReceipt] CHECK CONSTRAINT [FK_tblReceipt_room]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK_room_roomType] FOREIGN KEY([roomTypeID])
REFERENCES [dbo].[tblRoomType] ([roomTypeID])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK_room_roomType]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK_room_status] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK_room_status]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK_tblRoom_tblUserType] FOREIGN KEY([userTypeID])
REFERENCES [dbo].[tblUserType] ([userTypeID])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK_tblRoom_tblUserType]
GO
ALTER TABLE [dbo].[tblRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_roomDetal_room] FOREIGN KEY([roomID])
REFERENCES [dbo].[tblRoom] ([roomID])
GO
ALTER TABLE [dbo].[tblRoomDetail] CHECK CONSTRAINT [FK_roomDetal_room]
GO
ALTER TABLE [dbo].[tblRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblRoomDetail_tblRoomDetail] FOREIGN KEY([customerIDNumber])
REFERENCES [dbo].[tblGuest] ([idNumber])
GO
ALTER TABLE [dbo].[tblRoomDetail] CHECK CONSTRAINT [FK_tblRoomDetail_tblRoomDetail]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_user_userType] FOREIGN KEY([userTypeID])
REFERENCES [dbo].[tblUserType] ([userTypeID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_user_userType]
GO
ALTER TABLE [dbo].[tblWater]  WITH CHECK ADD  CONSTRAINT [FK_tblWater_tblRoom] FOREIGN KEY([roomID])
REFERENCES [dbo].[tblRoom] ([roomID])
GO
ALTER TABLE [dbo].[tblWater] CHECK CONSTRAINT [FK_tblWater_tblRoom]
GO
/****** Object:  StoredProcedure [dbo].[doimk]    Script Date: 1/11/2022 9:28:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doimk](@username char(10), @newpass varchar(50))
as
begin
	update tbluser set password=@newpass where @username=username
end
	
GO
/****** Object:  StoredProcedure [dbo].[GetUserNameByPhone]    Script Date: 1/11/2022 9:28:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetUserNameByPhone] @Phone char(20)
as
select username from tbluser where phone = @Phone
GO
/****** Object:  StoredProcedure [dbo].[updateStatus]    Script Date: 1/11/2022 9:28:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateStatus](@id int)
AS
BEGIN
	DECLARE @status bit
	SELECT @status = status from tblPost
	WHERE postID=@id

	IF (@status='true')
		BEGIN
			UPDATE tblPost
			SET status = 'false'
			WHERE @id=postID
		END
	ELSE 
		BEGIN
			UPDATE tblPost
			SET status = 'true'
			WHERE @id=postID
		END
END
GO
USE [master]
GO
ALTER DATABASE [QuanLyPhongTro] SET  READ_WRITE 
GO
