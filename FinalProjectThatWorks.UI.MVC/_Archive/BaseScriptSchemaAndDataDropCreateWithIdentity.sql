/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_Cars]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cars]') AND type in (N'U'))
ALTER TABLE [dbo].[Cars] DROP CONSTRAINT IF EXISTS [FK_Cars_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[Reservations]
GO
/****** Object:  Table [dbo].[OwnerAssets]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[OwnerAssets]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[Cars]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cars]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cars](
	[OwnerAssetId] [int] IDENTITY(1,1) NOT NULL,
	[CarName] [varchar](50) NOT NULL,
	[OwnerId] [nvarchar](128) NOT NULL,
	[CarPhoto] [varchar](50) NULL,
	[SpecialNotes] [varchar](300) NULL,
	[IsActive] [bit] NOT NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[OwnerAssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[ReservationLimit] [tinyint] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OwnerAssets]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OwnerAssets](
	[OwnerAssetId] [int] NOT NULL,
	[AssetName] [nchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[OwnerAssetId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
	[WorkNotes] [varchar](300) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202101261424506_InitialCreate', N'FinalProjectThatWorks.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D0D3EEC269F99219CC1ADD099CB67BD7C8F882697B92B7015B62B7B523518A443936827C591EF693F617B6A8BB7891A86EF5C54180C02D154F158B8764B1549CFFFDF1DFF1F72FBE673CE328760332314F46C7A681891D382E594DCC842EBFF9607EFFDD5FFF32BE72FC17E3732177C6E4A0258927E613A5E1B965C5F613F6513CF25D3B0AE260494776E05BC809ACD3E3E37F5A272716060813B00C63FC2921D4F571FA037E4E0362E39026C8BB091CECC5F97378334F518D5BE4E33844369E98339720EF3E0AFE836DFAF084E84F41F4351E3D5E8F6E3E4F475973D3B8F05C04A6CDB1B7340D4448401105C3CF1F633CA7514056F3101E20EFE135C420B7445E8CF30E9D57E2BA7D3B3E657DB3AA8605949DC434F07B029E9CE5CEB2F8E66BB9DC2C9D09EEBC02B7D357D6EBD4A513F3DAC1E9A34F81070EE0159E4FBD88094FCC9B52C5451CDE623A2A1A8E32C8590470BFC2508CEA88478676BBA3925CA7A363F6DF91314D3C9A447842704223E41D19F7C9C273ED1FF1EB43F01593C9D9C96279F6E1DD7BE49CBDFF169FBDABF714FA0A728D07F0086813E2086CC3CBB2FFA66135DB597CC3B259AD4DE615E012CC13D3B8412F1F3159D1279841A71F4C63E6BE60A7789293EB91B830ADA0118D12F8799B781E5A78B87C6FB5EA64FF6FD17AFAEEFD205A6FD1B3BB4A879ED30F13278279F5097BE9DBF8C90DB3E9D518EF2FB9D82C0A7CF6BBC9AFECED9779904436EB4CA0147940D10AD3A67563AB22AF16A519D4F0B42E500F9FDACC5291DE5251D6A1756642A162D7B3A1B077BB7AB519771186307829B59847DA08A7B17B8D38B823A3AD5145AE135D7211E8F49F79ADBCF291EB0DB0586A6881C065E9463E2E7BF94300D444A4B7CDF7288E61AD70FE8DE2A716D3E1CF014C9F633B8980C2738AFC70EBDAEE9F02826F137FC166C6EE740D36340FBF063364D320BA22ACD5C6781F03FB6B90D02BE25C228A1FA95D00B29F0FAEAF0F30883917B68DE3780664C6CE3480B8BC00BC26F4ECB4371C5BB1F61DAC4C3DE4FAF268855B5BBF14A255C4229710A21685982C726933F563B072899EA985A8DAD44CA2D3D45CACAFA90C4CCFD25C526D682AD069672635582C988ED0F0C1600A7BF8D1E0669BB76A2DA8B9710E2B24FE1726388265CCB94794E2885423A0B36EEC235848878F29DDFADE946AFA8CBC6468556BCD867411187E36A4B0873F1B5233E1F1B3EBB0A844E388540803BC96BCFCF4D53DE738CB763D1D1ADDDCB5F2DDAC01AAE97211C781EDA6B340921CCB531B4DFB218633BAF31C596FF85C09740C88EEB22D0F9E40DF4C9E5477E4127B9862E3C2CE92875314DBC811DD081D727A1856ECA812C3AA9C49D3B87F083A81E938628D103B04C530535D42C569E112DB0D91D7E925AEA5E616C6FA5EEAE0DF5CE21013A6B0D3133ACAE529126640A9871B942E0F8DAD1AE3DA89A8885A5563DE15C256E32E642E76C2C98ED859C1CB3C7EDB0A31DB3DB60372B6BB44C70065BA6F1F04CDCF2ABA04E00F2E874650EEC4A420681E52ED84A04D8FED81A04D97BC3982664754DDF1E7CEAB8746CFE64179F7DB7AABBBF6C0CD863F0E8C9A59EC096D28B4C09148CFCB057B895FA8E4700676E6E7B3380F75798A30F039A6CD944D15EF4AE350AB1D8427511B6045B40ED0FC43A100244CA81EC615B9BC56EBF228A2076C91776B85CDD77E0EB6C60111BBFEC1B426A8FEACCA9353EBF451F6AC64834072ADC3420D4742087EF16A765CC329AABCACE8189D58B84F345CEB583E182D0EEA885C154E2A3A33B8970A6A767B491690F509C936F212173E29BC547466702FE51CED76922428E811166CE4A2E6163ED0642B321DE56E53BE1B5B596155FE606C292AB0C637280C5DB2AA5564E54F8C79568E35FD66DEBF2CC9CF302C3B96542795D6969A6810A115E6DE826AB074E64631BD44142D10CBF34C1D5F1093EEAD8AE5BF5059DF3EC5412CF681429AFD9DB5D0F9BCDFD87CC5E824079D41977D16E2A479750921E4CD0D5632873C144952F9D3C04B7CA28EB8D4ADB30F7AF5F6D91311616C71F60B1195E03E21EE6D8E85D64889B3645BA3564638EB8F9C1A42E5FF223EAD8F802A6655A31429AC3A8A2AADB5B79154853A9B8D1E1F56F61FBC4E84EDCCBCBC96A50E903FEA89512B8710C06AEFF4519B152B75CCE61B7D44AE2CA50EC9BDEA6165BDF8A46164FDC55A780A8FCA25F43588E5267574F1AD3EB2A4F0A40E2D79BD06B6C466FE9D3EAAA436A50E2C79AD8F5D15AAF0ABEA01EF6DCAC3CE709B5B7640DE6C7753606C67891C6673ACD501D4816A8F7B62E55FFA05B0FCF941D24B794A1C8E5E59A264337A2930D46B53E3937A73696AAD03506336BE933796FFB63A01355E3F126F952AC2A9911729B597A747EE9438CE4F6CDD977984235C26621A851B61EB7F8D29F6474C6034FFC59B7A2E660B7D21708388BBC431CD6A43CCD3E39353EEFACFE15CC5B1E2D8F124275ED57D9CE698EDA0CC8B3CA3C87E42915874B1C175950A54C8675F1307BF4CCCDFD256E7696A84FD953E3E32AEE347E2FE92C08B8728C1C6EF6211E930E5FB1A17464A437F7F133731F45D7EFDF397ACE9917117C1743A378E3947AF33FCCDFB19BDACC99A6E60CDDAB736DEEE6C6B5C7890A272B365FDFB0D0B970E72B7A1B0F26F3E7AF97B5FD3A4F717364294DC51180A6F1017AAEE20AC83A5BC7FE0C04F9ADE3FE8D759F97D84754C53DE4570497F30FE2682FE3254B4DCE33E243941ED62494AFDDC59C9BD5159E7BEF726A1E07BA3892E1675F7801BB4707BB310E58D15440FB6754AEA9D07C3DE27EFB75EE47C2875CD55D0BEDF72E65D5630B77C83FA53152E1F40A99DA47468FFE5C9BBE69A2A257CE0359EFD8A900F8C6CF936BFFF52E35D934D95203E70B2F52A283E30AEED6BFFDC33D3B4B7D0BD97078B954E8A4F3BB22C7257F96F967287E3FF220012641165766B535E6FD6562BDBA1B012512B5517BAF18A858923E81524DAD5F6EB6BBEE1B77636976957AB280F6DD39DAFFFADBA739976DD8AA2CB7D142E4BCB1E65C5E41DEB585BC5D55B2A546EF4A4A32EBE2B666DFD4EFF96EA9207714A63F628BE2EBF9D32E4415C32E4D4E951762C7E2886BDB3F66F43C2FE1DBBAB0A82FD4B9104DB8D5DB394B926CBA0D8BC398B0A112E4373832972604BBD88A8BB443685D72C019D5E3B4F937AEC33C8023BD7E42EA16142A1CBD85F788D84170B02DAF4A7B5D54D9BC77721FB150FD10530D36589FB3BF243E27A4E69F74C92135240B0E8224FF7B2B1A42CEDBB7A2D916E03A20994BBAF0C8A1EB01F7A0016DF91397AC6EBD806F4FB8857C87EAD32802A90EE8168BA7D7CE9A25584FC38C7A8DAC34FE0B0E3BF7CF77F454E036722550000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4394ad11-8375-4414-a71f-16eb58871617', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5071e44c-6a47-4a53-a9bb-445189232a15', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b4efb6ab-349f-4522-9232-c4adca50d637', N'Owner')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6f32954f-13ba-4642-910d-44dea4f89660', N'4394ad11-8375-4414-a71f-16eb58871617')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b2ccb8e6-8e68-401f-b0b4-1918cd3ff2a0', N'5071e44c-6a47-4a53-a9bb-445189232a15')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b9670b05-1267-4fd2-ae77-57d24af6f172', N'b4efb6ab-349f-4522-9232-c4adca50d637')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6f32954f-13ba-4642-910d-44dea4f89660', N'admin@finalproject.com', 0, N'ANaN6UZ7D43WZnXuMjqk3Ufnc+lQjn/amG/MRRf7IbfVVGxjnkLpAcJbELiG8cWzCg==', N'a717429f-3b07-4b0f-85df-7a83906f59a2', NULL, 0, 0, NULL, 1, 0, N'admin@finalproject.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b2ccb8e6-8e68-401f-b0b4-1918cd3ff2a0', N'employee@employee.com', 0, N'AKfOHQhVi/CwfWmRKrdYjvjw2EdVRkTj+sjOyuhwsL2Pq6+HRqexREGkzjnN0exOrQ==', N'd245fc68-8816-4ecf-b651-d97d6c8fd64d', NULL, 0, 0, NULL, 1, 0, N'employee@employee.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b9670b05-1267-4fd2-ae77-57d24af6f172', N'owner@owneremail.com', 0, N'ABHiwm5wHOmgIhE5I/6X7MJFO+LPl4p+RCAip5Q6pabeMlxuU5wXP9RaAcj92DuSyg==', N'9911bfc1-81a8-4235-961c-cf242e60a841', NULL, 0, 0, NULL, 1, 0, N'owner@owneremail.com')
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([OwnerAssetId], [CarName], [OwnerId], [CarPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (4, N'Mercedes Benz', N'6f32954f-13ba-4642-910d-44dea4f89660', N'06dc9c9d-a57f-4959-bd63-12b0d0b47481.jpg', NULL, 1, CAST(N'2021-01-26' AS Date))
INSERT [dbo].[Cars] ([OwnerAssetId], [CarName], [OwnerId], [CarPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (5, N'Kia Sportage', N'b2ccb8e6-8e68-401f-b0b4-1918cd3ff2a0', NULL, NULL, 1, CAST(N'2021-01-24' AS Date))
INSERT [dbo].[Cars] ([OwnerAssetId], [CarName], [OwnerId], [CarPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (6, N'Hyundai SantaFe', N'b2ccb8e6-8e68-401f-b0b4-1918cd3ff2a0', NULL, NULL, 0, CAST(N'2021-01-10' AS Date))
INSERT [dbo].[Cars] ([OwnerAssetId], [CarName], [OwnerId], [CarPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (7, N'Toyota Tacoma', N'b9670b05-1267-4fd2-ae77-57d24af6f172', NULL, NULL, 1, CAST(N'2021-01-26' AS Date))
INSERT [dbo].[Cars] ([OwnerAssetId], [CarName], [OwnerId], [CarPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (8, N'Honda Civic', N'b9670b05-1267-4fd2-ae77-57d24af6f172', NULL, NULL, 0, CAST(N'2021-01-05' AS Date))
INSERT [dbo].[Cars] ([OwnerAssetId], [CarName], [OwnerId], [CarPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (9, N'Mitsubishi Lancer', N'b9670b05-1267-4fd2-ae77-57d24af6f172', NULL, NULL, 1, CAST(N'2021-01-26' AS Date))
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (1, N'GenericAutoRepair', N'6130 Troost Avenue', N'Kansas City', N'MO', N'64110', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (2, N'Rival Auto Repair', N'5810 Merriam Drive', N'Merriam', N'KS', N'66203', 50)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (3, N'Main Auto Repair', N'3619 Main St', N'Kansas City', N'MO', N'64111', 45)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (4, N'Random Auto Repair', N'505 SW Blvd', N'Kansas City', N'MO', N'64108', 25)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (5, N'Other Auto Shop', N'7915 Troost Avenue', N'Kansas City', N'MO', N'64131', 30)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate], [WorkNotes]) VALUES (2, 4, 1, CAST(N'2021-01-26' AS Date), N'Broken Windshield.')
INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate], [WorkNotes]) VALUES (3, 5, 2, CAST(N'2021-01-24' AS Date), N'Brakes need tightening.')
SET IDENTITY_INSERT [dbo].[Reservations] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'6f32954f-13ba-4642-910d-44dea4f89660', N'Mack', N'Jones')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'b2ccb8e6-8e68-401f-b0b4-1918cd3ff2a0', N'Joe', N'Brown')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'b9670b05-1267-4fd2-ae77-57d24af6f172', N'John', N'Smith')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cars_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cars]'))
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_UserDetails] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cars_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cars]'))
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Cars]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Cars] FOREIGN KEY([OwnerAssetId])
REFERENCES [dbo].[Cars] ([OwnerAssetId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Cars]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Cars]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
