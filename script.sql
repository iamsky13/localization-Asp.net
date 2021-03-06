USE [nav]
GO
ALTER TABLE [dbo].[localization_detail] DROP CONSTRAINT [FK__localizat__nav_i__25869641]
GO
/****** Object:  View [dbo].[vw_localization]    Script Date: 3/9/2018 1:03:19 AM ******/
DROP VIEW [dbo].[vw_localization]
GO
/****** Object:  Table [dbo].[language]    Script Date: 3/9/2018 1:03:19 AM ******/
DROP TABLE [dbo].[language]
GO
/****** Object:  Table [dbo].[localization_detail]    Script Date: 3/9/2018 1:03:19 AM ******/
DROP TABLE [dbo].[localization_detail]
GO
/****** Object:  Table [dbo].[nav_menu]    Script Date: 3/9/2018 1:03:19 AM ******/
DROP TABLE [dbo].[nav_menu]
GO
/****** Object:  Table [dbo].[nav_menu]    Script Date: 3/9/2018 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nav_menu](
	[id] [int] NOT NULL,
	[nav_name] [varchar](50) NOT NULL,
	[rank] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localization_detail]    Script Date: 3/9/2018 1:03:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localization_detail](
	[id] [int] NOT NULL,
	[localized_name] [varchar](50) NOT NULL,
	[nav_id] [int] NOT NULL,
	[language_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[language]    Script Date: 3/9/2018 1:03:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[language](
	[id] [int] NOT NULL,
	[language] [varchar](50) NOT NULL,
	[code] [varchar](10) NULL,
 CONSTRAINT [PK_language] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_localization]    Script Date: 3/9/2018 1:03:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_localization] 
as

select nm.id as nav_id,nav_name,rank,ld.id as localization_id,ld.localized_name,ld.language_id
,l.language,l.code from nav_menu nm
inner join localization_detail ld on nm.id=ld.nav_id
inner join language l on ld.language_id=l.id 
GO
INSERT [dbo].[language] ([id], [language], [code]) VALUES (1, N'Nepali', N'ne')
INSERT [dbo].[language] ([id], [language], [code]) VALUES (2, N'English', N'en')
INSERT [dbo].[language] ([id], [language], [code]) VALUES (3, N'Indian', N'in')
INSERT [dbo].[language] ([id], [language], [code]) VALUES (4, N'Spanish', N'sp')
INSERT [dbo].[language] ([id], [language], [code]) VALUES (5, N'Korean', N'ko')
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (1, N'menu1_nep', 1, 1)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (2, N'menu1_eng', 1, 2)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (3, N'menu1_ind', 1, 3)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (4, N'menu1_spa', 1, 4)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (5, N'menu1_kor', 1, 5)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (6, N'menu2_nep', 2, 1)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (7, N'menu2_eng', 2, 2)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (8, N'menu2_ind', 2, 3)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (9, N'menu2_spa', 2, 4)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (10, N'menu2_kor', 2, 5)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (11, N'menu3_nep', 3, 1)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (12, N'menu3_eng', 3, 2)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (13, N'menu3_ind', 3, 3)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (14, N'menu3_spa', 3, 4)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (15, N'menu3_kor', 3, 5)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (16, N'menu4_nep', 4, 1)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (17, N'menu4_eng', 4, 2)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (18, N'menu4_ind', 4, 3)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (19, N'menu4_spa', 4, 4)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (20, N'menu4_kor', 4, 5)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (21, N'menu5_nep', 5, 1)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (22, N'menu5_eng', 5, 2)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (23, N'menu5_ind', 5, 3)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (24, N'menu5_spa', 5, 4)
INSERT [dbo].[localization_detail] ([id], [localized_name], [nav_id], [language_id]) VALUES (25, N'menu5_kor', 5, 5)
INSERT [dbo].[nav_menu] ([id], [nav_name], [rank]) VALUES (1, N'menu1', 1)
INSERT [dbo].[nav_menu] ([id], [nav_name], [rank]) VALUES (2, N'menu2', 2)
INSERT [dbo].[nav_menu] ([id], [nav_name], [rank]) VALUES (3, N'menu3', 3)
INSERT [dbo].[nav_menu] ([id], [nav_name], [rank]) VALUES (4, N'menu4', 4)
INSERT [dbo].[nav_menu] ([id], [nav_name], [rank]) VALUES (5, N'menu5', 5)
ALTER TABLE [dbo].[localization_detail]  WITH CHECK ADD FOREIGN KEY([nav_id])
REFERENCES [dbo].[nav_menu] ([id])
GO
