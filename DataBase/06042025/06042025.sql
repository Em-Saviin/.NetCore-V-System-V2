USE [DB_POS3]
GO
/****** Object:  Table [dbo].[tbl_BussinessType]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BussinessType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Bussiness_Name] [nvarchar](120) NULL,
	[Remark] [nvarchar](100) NULL,
	[Is_Active] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_BussinessType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [nvarchar](200) NULL,
	[company_code] [nvarchar](200) NULL,
	[bussiness_type] [nvarchar](100) NULL,
	[register_number] [varchar](50) NULL,
	[register_date] [datetime] NULL,
	[logo] [nvarchar](200) NULL,
	[path_logo] [nvarchar](200) NULL,
	[address] [nvarchar](100) NULL,
	[contact_name] [nvarchar](50) NULL,
	[contact_email] [varchar](50) NULL,
	[contact_phone] [varchar](50) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_tbl_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Department]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[create_date] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_tbl_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Icons]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Icons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](50) NULL,
	[label_icon] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_Icons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Menus]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Name] [nvarchar](100) NOT NULL,
	[Menu_Name_Kh] [nvarchar](120) NULL,
	[Icon] [varchar](50) NULL,
	[Level] [int] NULL,
	[Partial_Name] [nvarchar](120) NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_Tbl_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Modules]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Modules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Module_Name] [nvarchar](150) NOT NULL,
	[Module_Name_Kh] [nvarchar](200) NULL,
	[Icon] [varchar](100) NULL,
	[Level] [int] NULL,
	[Menu_Id] [int] NOT NULL,
	[Partial_Name] [nvarchar](200) NULL,
	[Url] [nvarchar](100) NULL,
	[Is_Active] [bit] NULL,
	[Controller] [varchar](100) NULL,
	[Views] [varchar](100) NULL,
 CONSTRAINT [PK_Tbl_Module] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Permission_Module_On_Role]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Permission_Module_On_Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[module_id] [int] NULL,
	[role_id] [int] NULL,
	[company_code] [varchar](100) NULL,
	[full] [bit] NULL,
	[list] [bit] NULL,
	[add] [bit] NULL,
	[edit] [bit] NULL,
	[view] [bit] NULL,
	[print] [bit] NULL,
	[delete] [bit] NULL,
	[is_active] [bit] NULL,
	[assign_date] [datetime] NULL,
	[assign_by] [int] NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_Module_Role_Permission_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Permission_Module_On_User]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Permission_Module_On_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[module_id] [int] NULL,
	[user_id] [int] NULL,
	[role_id] [int] NULL,
	[company_code] [varchar](100) NULL,
	[full] [bit] NULL,
	[list] [bit] NULL,
	[add] [bit] NULL,
	[edit] [bit] NULL,
	[print] [bit] NULL,
	[view] [bit] NULL,
	[delete] [bit] NULL,
	[is_active] [bit] NULL,
	[assign_date] [datetime] NULL,
	[assign_by] [int] NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK__ModulePe__3214EC27B6241D80] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Permissions]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Permission_Name] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_tbl_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role_Module_Permissions]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role_Module_Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[Module_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Company_Id] [int] NULL,
	[Is_Active] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Role_Module_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](100) NULL,
	[Description] [nvarchar](240) NULL,
 CONSTRAINT [PK_tbl_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_StatusFlow]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StatusFlow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](60) NULL,
	[create_date] [date] NULL,
	[is_delete] [bit] NULL,
	[remark] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_StatusFlow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_System]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_System](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[System_Name] [nvarchar](150) NULL,
	[Description] [nvarchar](200) NULL,
	[Is_Active] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_System] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Telgram_Users]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Telgram_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[first_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[user_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Telgram_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserRoles]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Role_Id] [int] NOT NULL,
	[Assigned_Date] [datetime] NULL,
	[Delete_Date] [datetime] NULL,
	[Assign_By] [int] NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_tbl_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[firstname] [nvarchar](100) NULL,
	[lastname] [nvarchar](100) NULL,
	[email] [varchar](200) NULL,
	[password] [varchar](max) NULL,
	[is_active] [bit] NULL,
	[sex] [varchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [varchar](10) NULL,
	[image] [nvarchar](200) NULL,
	[image_path] [nvarchar](200) NULL,
	[company_id] [int] NULL,
	[department_id] [int] NULL,
 CONSTRAINT [PK__tbl_User__3214EC2760787119] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Workflow_Entity]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Workflow_Entity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[workflow_name] [nvarchar](100) NULL,
	[remark] [nvarchar](50) NULL,
	[module_id] [int] NULL,
	[first_status_id] [int] NULL,
	[last_status_id] [int] NULL,
	[is_delete] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [date] NULL,
	[delete_date] [date] NULL,
 CONSTRAINT [PK_tbl_Workflow_Entity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Workflow_Transaction]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Workflow_Transaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[workflow_id] [int] NULL,
	[status_from] [int] NULL,
	[status_to] [int] NULL,
	[role_id] [int] NULL,
	[create_by] [int] NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_tbl_Workflow_Transaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Workflow_TransactionLog]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Workflow_TransactionLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[workflow_id] [int] NULL,
	[status_from] [int] NULL,
	[status_to] [int] NULL,
	[role_id] [int] NULL,
	[create_by] [int] NULL,
	[create_date] [date] NULL,
	[delete_by] [int] NULL,
	[delete_date] [date] NULL,
 CONSTRAINT [PK_tbl_Workflow_TransactionLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_BussinessType] ON 

INSERT [dbo].[tbl_BussinessType] ([ID], [Bussiness_Name], [Remark], [Is_Active]) VALUES (1, N'Coffee Shop', N'A business that serves coffee and snacks.', 1)
INSERT [dbo].[tbl_BussinessType] ([ID], [Bussiness_Name], [Remark], [Is_Active]) VALUES (2, N'Construction', N'A business involved in construction and infrastructure.', 1)
INSERT [dbo].[tbl_BussinessType] ([ID], [Bussiness_Name], [Remark], [Is_Active]) VALUES (3, N'IT Services', N'A business that provides IT consulting and services.', 1)
SET IDENTITY_INSERT [dbo].[tbl_BussinessType] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Company] ON 

INSERT [dbo].[tbl_Company] ([ID], [company_name], [company_code], [bussiness_type], [register_number], [register_date], [logo], [path_logo], [address], [contact_name], [contact_email], [contact_phone], [is_active]) VALUES (1, N'Jing Hab Company', N'JH007', N'Coffee', N'1212111233', CAST(N'2025-01-27T00:00:00.000' AS DateTime), N'jing_hab_company.png', N'/lib/uploads/companylogo/jing_hab_company.png', N'Takeo Province.', N'Mrr. Jing Hab', N'JingHab123@gmail.com', N'123123123123', 1)
INSERT [dbo].[tbl_Company] ([ID], [company_name], [company_code], [bussiness_type], [register_number], [register_date], [logo], [path_logo], [address], [contact_name], [contact_email], [contact_phone], [is_active]) VALUES (2, N'Jing Hab 2', N'JS0017', N'Coffee', N'1212111233', CAST(N'2025-01-27T00:00:00.000' AS DateTime), N'jing_hab_2.png', N'/lib/uploads/companylogo/jing_hab_2.png', N'Takeo Province.', N'Mrr. Jing Hab', N'JingHab123@gmail.com', N'123123123123', 0)
INSERT [dbo].[tbl_Company] ([ID], [company_name], [company_code], [bussiness_type], [register_number], [register_date], [logo], [path_logo], [address], [contact_name], [contact_email], [contact_phone], [is_active]) VALUES (3, N'Jinghab3', N'#2121', N'Jinghab BS', N'112121233', CAST(N'2025-01-31T00:00:00.000' AS DateTime), N'jinghab3.png', N'/lib/uploads/companylogo/jinghab3.png', N'Poipet', N'Jing Hab Brother', N'ing@gamial.com', N'121212133311', 1)
SET IDENTITY_INSERT [dbo].[tbl_Company] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Department] ON 

INSERT [dbo].[tbl_Department] ([ID], [name], [create_date], [is_active]) VALUES (1, N'Finance', NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_Department] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Icons] ON 

INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (1, N'bi-123', N'123 Icon')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (2, N'bi-alarm-fill', N'Alarm Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (3, N'bi-alarm', N'Alarm')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (4, N'bi-align-bottom', N'Align Bottom')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (5, N'bi-align-center', N'Align Center')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (6, N'bi-align-end', N'Align End')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (7, N'bi-align-middle', N'Align Middle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (8, N'bi-align-start', N'Align Start')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (9, N'bi-align-top', N'Align Top')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (10, N'bi-alt', N'Alt')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (11, N'bi-app-indicator', N'App Indicator')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (12, N'bi-app', N'App')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (13, N'bi-archive-fill', N'Archive Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (14, N'bi-archive', N'Archive')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (15, N'bi-arrow-90deg-down', N'Arrow 90° Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (16, N'bi-arrow-90deg-left', N'Arrow 90° Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (17, N'bi-arrow-90deg-right', N'Arrow 90° Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (18, N'bi-arrow-90deg-up', N'Arrow 90° Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (19, N'bi-arrow-bar-down', N'Arrow Bar Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (20, N'bi-arrow-bar-left', N'Arrow Bar Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (21, N'bi-arrow-bar-right', N'Arrow Bar Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (22, N'bi-arrow-bar-up', N'Arrow Bar Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (23, N'bi-arrow-clockwise', N'Arrow Clockwise')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (24, N'bi-arrow-counterclockwise', N'Arrow Counterclockwise')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (25, N'bi-arrow-down-circle-fill', N'Arrow Down Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (26, N'bi-arrow-down-circle', N'Arrow Down Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (27, N'bi-arrow-down-left-circle-fill', N'Arrow Down Left Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (28, N'bi-arrow-down-left-circle', N'Arrow Down Left Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (29, N'bi-arrow-down-left-square-fill', N'Arrow Down Left Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (30, N'bi-arrow-down-left-square', N'Arrow Down Left Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (31, N'bi-arrow-down-left', N'Arrow Down Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (32, N'bi-arrow-down-right-circle-fill', N'Arrow Down Right Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (33, N'bi-arrow-down-right-circle', N'Arrow Down Right Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (34, N'bi-arrow-down-right-square-fill', N'Arrow Down Right Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (35, N'bi-arrow-down-right-square', N'Arrow Down Right Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (36, N'bi-arrow-down-right', N'Arrow Down Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (37, N'bi-arrow-down-short', N'Arrow Down Short')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (38, N'bi-arrow-down-square-fill', N'Arrow Down Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (39, N'bi-arrow-down-square', N'Arrow Down Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (40, N'bi-arrow-down-up', N'Arrow Down Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (41, N'bi-arrow-down', N'Arrow Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (42, N'bi-arrow-left-circle-fill', N'Arrow Left Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (43, N'bi-arrow-left-circle', N'Arrow Left Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (44, N'bi-arrow-left-right', N'Arrow Left Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (45, N'bi-arrow-left-short', N'Arrow Left Short')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (46, N'bi-arrow-left-square-fill', N'Arrow Left Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (47, N'bi-arrow-left-square', N'Arrow Left Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (48, N'bi-arrow-left', N'Arrow Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (49, N'bi-arrow-repeat', N'Arrow Repeat')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (50, N'bi-arrow-return-left', N'Arrow Return Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (51, N'bi-arrow-return-right', N'Arrow Return Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (52, N'bi-arrow-right-circle-fill', N'Arrow Right Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (53, N'bi-arrow-right-circle', N'Arrow Right Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (54, N'bi-arrow-right-short', N'Arrow Right Short')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (55, N'bi-arrow-right-square-fill', N'Arrow Right Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (56, N'bi-arrow-right-square', N'Arrow Right Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (57, N'bi-arrow-right', N'Arrow Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (58, N'bi-arrow-up-circle-fill', N'Arrow Up Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (59, N'bi-arrow-up-circle', N'Arrow Up Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (60, N'bi-arrow-up-left-circle-fill', N'Arrow Up Left Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (61, N'bi-arrow-up-left-circle', N'Arrow Up Left Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (62, N'bi-arrow-up-left-square-fill', N'Arrow Up Left Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (63, N'bi-arrow-up-left-square', N'Arrow Up Left Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (64, N'bi-arrow-up-left', N'Arrow Up Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (65, N'bi-arrow-up-right-circle-fill', N'Arrow Up Right Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (66, N'bi-arrow-up-right-circle', N'Arrow Up Right Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (67, N'bi-arrow-up-right-square-fill', N'Arrow Up Right Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (68, N'bi-arrow-up-right-square', N'Arrow Up Right Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (69, N'bi-arrow-up-right', N'Arrow Up Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (70, N'bi-arrow-up-short', N'Arrow Up Short')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (71, N'bi-arrow-up-square-fill', N'Arrow Up Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (72, N'bi-arrow-up-square', N'Arrow Up Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (73, N'bi-arrow-up', N'Arrow Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (74, N'bi-arrows-angle-contract', N'Arrows Angle Contract')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (75, N'bi-arrows-angle-expand', N'Arrows Angle Expand')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (76, N'bi-arrows-collapse', N'Arrows Collapse')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (77, N'bi-arrows-expand', N'Arrows Expand')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (78, N'bi-arrows-fullscreen', N'Arrows Fullscreen')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (79, N'bi-arrows-move', N'Arrows Move')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (80, N'bi-aspect-ratio-fill', N'Aspect Ratio Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (81, N'bi-aspect-ratio', N'Aspect Ratio')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (82, N'bi-asterisk', N'Asterisk')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (83, N'bi-at', N'At Symbol')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (84, N'bi-award-fill', N'Award Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (85, N'bi-award', N'Award')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (86, N'bi-back', N'Back')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (87, N'bi-backspace-fill', N'Backspace Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (88, N'bi-backspace-reverse-fill', N'Backspace Reverse Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (89, N'bi-backspace-reverse', N'Backspace Reverse')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (90, N'bi-backspace', N'Backspace')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (91, N'bi-badge-3d-fill', N'Badge 3D Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (92, N'bi-badge-3d', N'Badge 3D')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (93, N'bi-badge-4k-fill', N'Badge 4K Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (94, N'bi-badge-4k', N'Badge 4K')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (95, N'bi-badge-8k-fill', N'Badge 8K Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (96, N'bi-badge-8k', N'Badge 8K')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (97, N'bi-badge-ad-fill', N'Badge Ad Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (98, N'bi-badge-ad', N'Badge Ad')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (99, N'bi-badge-ar-fill', N'Badge AR Fill')
GO
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (100, N'bi-badge-ar', N'Badge AR')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (101, N'bi-badge-cc-fill', N'Badge CC Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (102, N'bi-badge-cc', N'Badge CC')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (103, N'bi-badge-hd-fill', N'Badge HD Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (104, N'bi-badge-hd', N'Badge HD')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (105, N'bi-badge-tm-fill', N'Badge TM Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (106, N'bi-badge-tm', N'Badge TM')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (107, N'bi-badge-vo-fill', N'Badge VO Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (108, N'bi-badge-vo', N'Badge VO')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (109, N'bi-badge-vr-fill', N'Badge VR Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (110, N'bi-badge-vr', N'Badge VR')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (111, N'bi-badge-wc-fill', N'Badge WC Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (112, N'bi-badge-wc', N'Badge WC')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (113, N'bi-bag-check-fill', N'Bag Check Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (114, N'bi-bag-check', N'Bag Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (115, N'bi-bag-dash-fill', N'Bag Dash Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (116, N'bi-bag-dash', N'Bag Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (117, N'bi-bag-fill', N'Bag Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (118, N'bi-bag-plus-fill', N'Bag Plus Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (119, N'bi-bag-plus', N'Bag Plus')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (120, N'bi-bag-x-fill', N'Bag X Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (121, N'bi-bag-x', N'Bag X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (122, N'bi-bag', N'Bag')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (123, N'bi-bar-chart-fill', N'Bar Chart Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (124, N'bi-bar-chart-line-fill', N'Bar Chart Line Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (125, N'bi-bar-chart-line', N'Bar Chart Line')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (126, N'bi-bar-chart-steps', N'Bar Chart Steps')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (127, N'bi-bar-chart', N'Bar Chart')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (128, N'bi-basket-fill', N'Basket Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (129, N'bi-basket', N'Basket')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (130, N'bi-basket2-fill', N'Basket 2 Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (131, N'bi-basket2', N'Basket 2')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (132, N'bi-basket3-fill', N'Basket 3 Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (133, N'bi-basket3', N'Basket 3')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (134, N'bi-battery-charging', N'Battery Charging')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (135, N'bi-battery-full', N'Battery Full')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (136, N'bi-battery-half', N'Battery Half')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (137, N'bi-battery', N'Battery')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (138, N'bi-bell-fill', N'Bell Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (139, N'bi-bell', N'Bell')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (140, N'bi-bezier', N'Bezier')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (141, N'bi-bezier2', N'Bezier 2')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (142, N'bi-bicycle', N'Bicycle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (143, N'bi-binoculars-fill', N'Binoculars Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (144, N'bi-binoculars', N'Binoculars')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (145, N'bi-blockquote-left', N'Blockquote Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (146, N'bi-blockquote-right', N'Blockquote Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (147, N'bi-book-fill', N'Book Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (148, N'bi-book-half', N'Book Half')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (149, N'bi-book', N'Book')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (150, N'bi-bookmark-check-fill', N'Bookmark Check Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (151, N'bi-bookmark-check', N'Bookmark Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (152, N'bi-bookmark-dash-fill', N'Bookmark Dash Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (153, N'bi-bookmark-dash', N'Bookmark Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (154, N'bi-bookmark-fill', N'Bookmark Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (155, N'bi-bookmark-heart-fill', N'Bookmark Heart Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (156, N'bi-bookmark-heart', N'Bookmark Heart')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (157, N'bi-bookmark-plus-fill', N'Bookmark Plus Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (158, N'bi-bookmark-plus', N'Bookmark Plus')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (159, N'bi-bookmark-star-fill', N'Bookmark Star Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (160, N'bi-bookmark-star', N'Bookmark Star')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (161, N'bi-bookmark-x-fill', N'Bookmark X Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (162, N'bi-bookmark-x', N'Bookmark X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (163, N'bi-bookmark', N'Bookmark')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (164, N'bi-bookmarks-fill', N'Bookmarks Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (165, N'bi-bookmarks', N'Bookmarks')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (166, N'bi-bookshelf', N'Bookshelf')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (167, N'bi-bootstrap-fill', N'Bootstrap Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (168, N'bi-bootstrap-reboot', N'Bootstrap Reboot')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (169, N'bi-bootstrap', N'Bootstrap')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (170, N'bi-border-all', N'Border All')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (171, N'bi-border-bottom', N'Border Bottom')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (172, N'bi-border-center', N'Border Center')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (173, N'bi-border-inner', N'Border Inner')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (174, N'bi-border-left', N'Border Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (175, N'bi-border-middle', N'Border Middle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (176, N'bi-border-outer', N'Border Outer')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (177, N'bi-border-right', N'Border Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (178, N'bi-border-style', N'Border Style')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (179, N'bi-border-top', N'Border Top')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (180, N'bi-border-width', N'Border Width')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (181, N'bi-border', N'Border')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (182, N'bi-bounding-box-circles', N'Bounding Box Circles')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (183, N'bi-bounding-box', N'Bounding Box')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (184, N'bi-box-arrow-down-left', N'Box Arrow Down Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (185, N'bi-box-arrow-down-right', N'Box Arrow Down Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (186, N'bi-box-arrow-down', N'Box Arrow Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (187, N'bi-box-arrow-in-down-left', N'Box Arrow In Down Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (188, N'bi-box-arrow-in-down-right', N'Box Arrow In Down Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (189, N'bi-box-arrow-in-down', N'Box Arrow In Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (190, N'bi-box-arrow-in-left', N'Box Arrow In Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (191, N'bi-box-arrow-in-right', N'Box Arrow In Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (192, N'bi-box-arrow-in-up-left', N'Box Arrow In Up Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (193, N'bi-box-arrow-in-up-right', N'Box Arrow In Up Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (194, N'bi-box-arrow-in-up', N'Box Arrow In Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (195, N'bi-box-arrow-left', N'Box Arrow Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (196, N'bi-box-arrow-right', N'Box Arrow Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (197, N'bi-box-arrow-up-left', N'Box Arrow Up Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (198, N'bi-box-arrow-up-right', N'Box Arrow Up Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (199, N'bi-box-arrow-up', N'Box Arrow Up')
GO
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (200, N'bi-box-seam', N'Box Seam')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (201, N'bi-box', N'Box')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (202, N'bi-braces', N'Braces')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (203, N'bi-bricks', N'Bricks')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (204, N'bi-briefcase-fill', N'Briefcase Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (205, N'bi-briefcase', N'Briefcase')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (206, N'bi-brightness-alt-high-fill', N'Brightness Alt High Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (207, N'bi-brightness-alt-high', N'Brightness Alt High')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (208, N'bi-brightness-alt-low-fill', N'Brightness Alt Low Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (209, N'bi-brightness-alt-low', N'Brightness Alt Low')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (210, N'bi-brightness-high-fill', N'Brightness High Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (211, N'bi-brightness-high', N'Brightness High')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (212, N'bi-brightness-low-fill', N'Brightness Low Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (213, N'bi-brightness-low', N'Brightness Low')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (214, N'bi-broadcast-pin', N'Broadcast Pin')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (215, N'bi-broadcast', N'Broadcast')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (216, N'bi-brush-fill', N'Brush Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (217, N'bi-brush', N'Brush')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (218, N'bi-bucket-fill', N'Bucket Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (219, N'bi-bucket', N'Bucket')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (220, N'bi-bug-fill', N'Bug Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (221, N'bi-bug', N'Bug')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (222, N'bi-building', N'Building')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (223, N'bi-bullseye', N'Bullseye')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (224, N'bi-calculator-fill', N'Calculator Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (225, N'bi-calculator', N'Calculator')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (226, N'bi-calendar-check-fill', N'Calendar Check Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (227, N'bi-calendar-check', N'Calendar Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (228, N'bi-calendar-date-fill', N'Calendar Date Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (229, N'bi-calendar-date', N'Calendar Date')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (230, N'bi-cart-dash', N'Cart Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (231, N'bi-cart-fill', N'Cart Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (232, N'bi-cart-plus-fill', N'Cart Plus Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (233, N'bi-cart-plus', N'Cart Plus')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (234, N'bi-cart-x-fill', N'Cart X Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (235, N'bi-cart-x', N'Cart X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (236, N'bi-cart', N'Cart')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (237, N'bi-cart2', N'Cart 2')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (238, N'bi-cart3', N'Cart 3')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (239, N'bi-cart4', N'Cart 4')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (240, N'bi-cash-stack', N'Cash Stack')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (241, N'bi-cash', N'Cash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (242, N'bi-cast', N'Cast')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (243, N'bi-chat-dots-fill', N'Chat Dots Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (244, N'bi-chat-dots', N'Chat Dots')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (245, N'bi-chat-fill', N'Chat Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (246, N'bi-chat-left-dots-fill', N'Chat Left Dots Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (247, N'bi-chat-left-dots', N'Chat Left Dots')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (248, N'bi-chat-left-fill', N'Chat Left Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (249, N'bi-chat-left-quote-fill', N'Chat Left Quote Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (250, N'bi-chat-left-quote', N'Chat Left Quote')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (251, N'bi-chat-left-text-fill', N'Chat Left Text Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (252, N'bi-chat-left-text', N'Chat Left Text')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (253, N'bi-chat-left', N'Chat Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (254, N'bi-chat-quote-fill', N'Chat Quote Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (255, N'bi-chat-quote', N'Chat Quote')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (256, N'bi-chat-right-dots-fill', N'Chat Right Dots Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (257, N'bi-chat-right-dots', N'Chat Right Dots')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (258, N'bi-chat-right-fill', N'Chat Right Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (259, N'bi-chat-right-quote-fill', N'Chat Right Quote Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (260, N'bi-chat-right-quote', N'Chat Right Quote')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (261, N'bi-chat-right-text-fill', N'Chat Right Text Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (262, N'bi-chat-right-text', N'Chat Right Text')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (263, N'bi-chat-right', N'Chat Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (264, N'bi-chat-square-dots-fill', N'Chat Square Dots Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (265, N'bi-chat-square-dots', N'Chat Square Dots')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (266, N'bi-chat-square-fill', N'Chat Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (267, N'bi-chat-square-quote-fill', N'Chat Square Quote Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (268, N'bi-chat-square-quote', N'Chat Square Quote')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (269, N'bi-chat-square-text-fill', N'Chat Square Text Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (270, N'bi-chat-square-text', N'Chat Square Text')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (271, N'bi-chat-square', N'Chat Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (272, N'bi-chat-text-fill', N'Chat Text Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (273, N'bi-chat-text', N'Chat Text')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (274, N'bi-chat', N'Chat')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (275, N'bi-check-all', N'Check All')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (276, N'bi-check-circle-fill', N'Check Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (277, N'bi-check-circle', N'Check Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (278, N'bi-check-square-fill', N'Check Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (279, N'bi-check-square', N'Check Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (280, N'bi-check', N'Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (281, N'bi-check2-all', N'Check2 All')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (282, N'bi-check2-circle', N'Check2 Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (283, N'bi-check2-square', N'Check2 Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (284, N'bi-check2', N'Check2')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (285, N'bi-chevron-bar-contract', N'Chevron Bar Contract')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (286, N'bi-chevron-bar-down', N'Chevron Bar Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (287, N'bi-chevron-bar-expand', N'Chevron Bar Expand')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (288, N'bi-chevron-bar-left', N'Chevron Bar Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (289, N'bi-chevron-bar-right', N'Chevron Bar Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (290, N'bi-chevron-bar-up', N'Chevron Bar Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (291, N'bi-chevron-compact-down', N'Chevron Compact Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (292, N'bi-chevron-compact-left', N'Chevron Compact Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (293, N'bi-chevron-compact-right', N'Chevron Compact Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (294, N'bi-chevron-compact-up', N'Chevron Compact Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (295, N'bi-chevron-contract', N'Chevron Contract')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (296, N'bi-chevron-double-down', N'Chevron Double Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (297, N'bi-chevron-double-left', N'Chevron Double Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (298, N'bi-chevron-double-right', N'Chevron Double Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (299, N'bi-chevron-double-up', N'Chevron Double Up')
GO
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (300, N'bi-chevron-down', N'Chevron Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (301, N'bi-chevron-expand', N'Chevron Expand')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (302, N'bi-chevron-left', N'Chevron Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (303, N'bi-chevron-right', N'Chevron Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (304, N'bi-chevron-up', N'Chevron Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (305, N'bi-circle-fill', N'Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (306, N'bi-circle-half', N'Circle Half')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (307, N'bi-circle-square', N'Circle Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (308, N'bi-circle', N'Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (309, N'bi-clipboard-check', N'Clipboard Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (310, N'bi-clipboard-data', N'Clipboard Data')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (311, N'bi-clipboard-minus', N'Clipboard Minus')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (312, N'bi-clipboard-plus', N'Clipboard Plus')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (313, N'bi-clipboard-x', N'Clipboard X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (314, N'bi-clipboard', N'Clipboard')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (315, N'bi-clock-fill', N'Clock Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (316, N'bi-clock-history', N'Clock History')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (317, N'bi-clock', N'Clock')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (318, N'bi-cloud-arrow-down-fill', N'Cloud Arrow Down Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (319, N'bi-cloud-arrow-down', N'Cloud Arrow Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (320, N'bi-cloud-arrow-up-fill', N'Cloud Arrow Up Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (321, N'bi-cloud-arrow-up', N'Cloud Arrow Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (322, N'bi-cloud-check-fill', N'Cloud Check Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (323, N'bi-cloud-check', N'Cloud Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (324, N'bi-cloud-download-fill', N'Cloud Download Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (325, N'bi-cloud-download', N'Cloud Download')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (326, N'bi-cloud-drizzle-fill', N'Cloud Drizzle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (327, N'bi-cloud-drizzle', N'Cloud Drizzle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (328, N'bi-cloud-fill', N'Cloud Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (329, N'bi-cloud-fog-fill', N'Cloud Fog Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (330, N'bi-cloud-fog', N'Cloud Fog')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (331, N'bi-cloud-fog2-fill', N'Cloud Fog2 Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (332, N'bi-cloud-fog2', N'Cloud Fog2')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (333, N'bi-cloud-hail-fill', N'Cloud Hail Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (334, N'bi-cloud-hail', N'Cloud Hail')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (335, N'bi-cloud-haze-fill', N'Cloud Haze Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (336, N'bi-cloud-haze', N'cloud-haze')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (337, N'bi-cloud-haze2-fill', N'cloud-haze2-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (338, N'bi-cloud-lightning-fill', N'cloud-lightning-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (339, N'bi-cloud-lightning-rain-fill', N'cloud-lightning-rain-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (340, N'bi-cloud-lightning-rain', N'cloud-lightning-rain')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (341, N'bi-cloud-lightning', N'cloud-lightning')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (342, N'bi-cloud-minus-fill', N'cloud-minus-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (343, N'bi-cloud-minus', N'cloud-minus')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (344, N'bi-cloud-moon-fill', N'cloud-moon-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (345, N'bi-cloud-moon', N'cloud-moon')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (346, N'bi-cloud-plus-fill', N'cloud-plus-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (347, N'bi-cloud-plus', N'cloud-plus')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (348, N'bi-cloud-rain-fill', N'cloud-rain-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (349, N'bi-cloud-rain-heavy-fill', N'cloud-rain-heavy-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (350, N'bi-cloud-rain-heavy', N'cloud-rain-heavy')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (351, N'bi-cloud-rain', N'cloud-rain')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (352, N'bi-cloud-slash-fill', N'cloud-slash-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (353, N'bi-cloud-slash', N'cloud-slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (354, N'bi-cloud-sleet-fill', N'cloud-sleet-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (355, N'bi-cloud-sleet', N'cloud-sleet')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (356, N'bi-cloud-snow-fill', N'cloud-snow-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (357, N'bi-cloud-snow', N'cloud-snow')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (358, N'bi-cloud-sun-fill', N'cloud-sun-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (359, N'bi-cloud-sun', N'cloud-sun')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (360, N'bi-cloud-upload-fill', N'cloud-upload-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (361, N'bi-cloud-upload', N'cloud-upload')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (362, N'bi-cloud', N'cloud')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (363, N'bi-clouds-fill', N'clouds-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (364, N'bi-clouds', N'clouds')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (365, N'bi-cloudy-fill', N'cloudy-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (366, N'bi-cloudy', N'cloudy')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (367, N'bi-code-slash', N'code-slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (368, N'bi-code-square', N'code-square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (369, N'bi-code', N'code')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (370, N'bi-collection-fill', N'collection-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (371, N'bi-collection-play-fill', N'collection-play-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (372, N'bi-collection-play', N'collection-play')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (373, N'bi-collection', N'collection')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (374, N'bi-columns-gap', N'columns-gap')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (375, N'bi-columns', N'columns')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (376, N'bi-command', N'command')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (377, N'bi-compass-fill', N'compass-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (378, N'bi-compass', N'compass')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (379, N'bi-cone-striped', N'cone-striped')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (380, N'bi-cone', N'cone')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (381, N'bi-controller', N'controller')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (382, N'bi-cpu-fill', N'cpu-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (383, N'bi-cpu', N'cpu')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (384, N'bi-credit-card-2-back-fill', N'credit-card-2-back-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (385, N'bi-credit-card-2-back', N'credit-card-2-back')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (386, N'bi-credit-card-2-front-fill', N'credit-card-2-front-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (387, N'bi-credit-card-2-front', N'credit-card-2-front')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (388, N'bi-credit-card-fill', N'credit-card-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (389, N'bi-credit-card', N'credit-card')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (390, N'bi-crop', N'crop')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (391, N'bi-cup-fill', N'cup-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (392, N'bi-cup-straw', N'cup-straw')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (393, N'bi-cup', N'cup')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (394, N'bi-cursor-fill', N'cursor-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (395, N'bi-cursor-text', N'cursor-text')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (396, N'bi-cursor', N'cursor')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (397, N'bi-dash-circle-dotted', N'dash-circle-dotted')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (398, N'bi-dash-circle-fill', N'dash-circle-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (399, N'bi-dash-circle', N'dash-circle')
GO
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (400, N'bi-dash-square-dotted', N'dash-square-dotted')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (401, N'bi-dash-square-fill', N'dash-square-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (402, N'bi-dash-square', N'dash-square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (403, N'bi-dash', N'dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (404, N'bi-diagram-2-fill', N'diagram-2-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (405, N'bi-diagram-2', N'diagram-2')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (406, N'bi-diagram-3-fill', N'diagram-3-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (407, N'bi-diagram-3', N'diagram-3')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (408, N'bi-diamond-fill', N'diamond-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (409, N'bi-diamond-half', N'diamond-half')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (410, N'bi-diamond', N'diamond')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (411, N'bi-dice-1-fill', N'dice-1-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (412, N'bi-dice-1', N'dice-1')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (413, N'bi-dice-2-fill', N'dice-2-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (414, N'bi-dice-2', N'dice-2')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (415, N'bi-dice-3-fill', N'dice-3-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (416, N'bi-dice-3', N'dice-3')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (417, N'bi-dice-4-fill', N'dice-4-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (418, N'bi-dice-4', N'dice-4')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (419, N'bi-dice-5-fill', N'dice-5-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (420, N'bi-dice-5', N'dice-5')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (421, N'bi-dice-6-fill', N'dice-6-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (422, N'bi-dice-6', N'dice-6')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (423, N'bi-disc-fill', N'disc-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (424, N'bi-disc', N'disc')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (425, N'bi-discord', N'discord')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (426, N'bi-display-fill', N'display-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (427, N'bi-display', N'display')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (428, N'bi-distribute-horizontal', N'distribute-horizontal')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (429, N'bi-distribute-vertical', N'distribute-vertical')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (430, N'bi-door-closed-fill', N'door-closed-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (431, N'bi-door-closed', N'door-closed')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (432, N'bi-door-open-fill', N'door-open-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (433, N'bi-door-open', N'door-open')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (434, N'bi-dot', N'dot')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (435, N'bi-download', N'download')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (436, N'bi-droplet-fill', N'droplet-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (437, N'bi-droplet-half', N'droplet-half')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (438, N'bi-droplet', N'droplet')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (439, N'bi-earbuds', N'earbuds')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (440, N'bi-easel-fill', N'easel-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (441, N'bi-easel', N'easel')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (442, N'bi-egg-fill', N'egg-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (443, N'bi-egg-fried', N'egg-fried')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (444, N'bi-egg', N'egg')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (445, N'bi-eject-fill', N'eject-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (446, N'bi-eject', N'eject')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (447, N'bi-emoji-angry-fill', N'emoji-angry-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (448, N'bi-emoji-angry', N'emoji-angry')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (449, N'bi-emoji-dizzy-fill', N'emoji-dizzy-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (450, N'bi-emoji-dizzy', N'emoji-dizzy')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (451, N'bi-emoji-expressionless-fill', N'emoji-expressionless-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (452, N'bi-emoji-expressionless', N'emoji-expressionless')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (453, N'bi-emoji-frown-fill', N'emoji-frown-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (454, N'bi-emoji-frown', N'emoji-frown')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (455, N'bi-emoji-heart-eyes-fill', N'emoji-heart-eyes-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (456, N'bi-emoji-heart-eyes', N'emoji-heart-eyes')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (457, N'bi-emoji-laughing-fill', N'emoji-laughing-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (458, N'bi-emoji-laughing', N'emoji-laughing')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (459, N'bi-emoji-neutral-fill', N'emoji-neutral-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (460, N'bi-emoji-neutral', N'emoji-neutral')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (461, N'bi-emoji-smile-fill', N'emoji-smile-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (462, N'bi-emoji-smile-upside-down-fill', N'emoji-smile-upside-down-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (463, N'bi-emoji-smile-upside-down', N'emoji-smile-upside-down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (464, N'bi-emoji-smile', N'emoji-smile')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (465, N'bi-emoji-sunglasses-fill', N'emoji-sunglasses-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (466, N'bi-emoji-sunglasses', N'emoji-sunglasses')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (467, N'bi-emoji-wink-fill', N'emoji-wink-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (468, N'bi-emoji-wink', N'emoji-wink')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (469, N'bi-envelope-fill', N'envelope-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (470, N'bi-envelope-open-fill', N'envelope-open-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (471, N'bi-envelope-open', N'envelope-open')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (472, N'bi-envelope', N'envelope')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (473, N'bi-eraser-fill', N'eraser-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (474, N'bi-eraser', N'eraser')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (475, N'bi-exclamation-circle-fill', N'exclamation-circle-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (476, N'bi-exclamation-circle', N'exclamation-circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (477, N'bi-exclamation-diamond-fill', N'exclamation-diamond-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (478, N'bi-exclamation-diamond', N'exclamation-diamond')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (479, N'bi-exclamation-octagon-fill', N'exclamation-octagon-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (480, N'bi-exclamation-octagon', N'exclamation-octagon')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (481, N'bi-exclamation-square-fill', N'exclamation-square-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (482, N'bi-exclamation-square', N'exclamation-square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (483, N'bi-exclamation-triangle-fill', N'exclamation-triangle-fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (484, N'bi-exclamation-triangle', N'exclamation-triangle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (485, N'bi-exclamation', N'exclamation')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (486, N'bi-universal-access-circle', N'Universal Access Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (487, N'bi-universal-access', N'Universal Access')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (488, N'bi-virus', N'Virus')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (489, N'bi-virus2', N'Virus 2')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (490, N'bi-wechat', N'WeChat')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (491, N'bi-yelp', N'Yelp')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (492, N'bi-sign-stop-fill', N'Sign Stop Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (493, N'bi-sign-stop-lights-fill', N'Sign Stop Lights Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (494, N'bi-sign-stop-lights', N'Sign Stop Lights')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (495, N'bi-sign-stop', N'Sign Stop')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (496, N'bi-sign-turn-left-fill', N'Sign Turn Left Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (497, N'bi-sign-turn-left', N'Sign Turn Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (498, N'bi-sign-turn-right-fill', N'Sign Turn Right Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (499, N'bi-sign-turn-right', N'Sign Turn Right')
GO
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (500, N'bi-sign-turn-slight-left-fill', N'Sign Turn Slight Left Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (501, N'bi-sign-turn-slight-left', N'Sign Turn Slight Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (502, N'bi-sign-turn-slight-right-fill', N'Sign Turn Slight Right Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (503, N'bi-sign-turn-slight-right', N'Sign Turn Slight Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (504, N'bi-sign-yield-fill', N'Sign Yield Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (505, N'bi-sign-yield', N'Sign Yield')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (506, N'bi-ev-station-fill', N'EV Station Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (507, N'bi-ev-station', N'EV Station')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (508, N'bi-fuel-pump-diesel-fill', N'Fuel Pump Diesel Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (509, N'bi-fuel-pump-diesel', N'Fuel Pump Diesel')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (510, N'bi-fuel-pump-fill', N'Fuel Pump Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (511, N'bi-fuel-pump', N'Fuel Pump')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (512, N'bi-0-circle-fill', N'0 Circle Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (513, N'bi-0-circle', N'0 Circle')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (514, N'bi-0-square-fill', N'0 Square Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (515, N'bi-0-square', N'0 Square')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (516, N'bi-rocket-fill', N'Rocket Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (517, N'bi-rocket-takeoff-fill', N'Rocket Takeoff Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (518, N'bi-rocket-takeoff', N'Rocket Takeoff')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (519, N'bi-rocket', N'Rocket')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (520, N'bi-stripe', N'Stripe')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (521, N'bi-subscript', N'Subscript')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (522, N'bi-superscript', N'Superscript')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (523, N'bi-trello', N'Trello')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (524, N'bi-envelope-at-fill', N'Envelope At Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (525, N'bi-envelope-at', N'Envelope At')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (526, N'bi-regex', N'Regex')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (527, N'bi-text-wrap', N'Text Wrap')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (528, N'bi-sign-dead-end-fill', N'Sign Dead End Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (529, N'bi-sign-dead-end', N'Sign Dead End')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (530, N'bi-sign-do-not-enter-fill', N'Sign Do Not Enter Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (531, N'bi-sign-do-not-enter', N'Sign Do Not Enter')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (532, N'bi-sign-intersection-fill', N'Sign Intersection Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (533, N'bi-sign-intersection-side-fill', N'Sign Intersection Side Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (534, N'bi-sign-intersection-side', N'Sign Intersection Side')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (535, N'bi-sign-intersection-t-fill', N'Sign Intersection T Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (536, N'bi-sign-intersection-t', N'Sign Intersection T')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (537, N'bi-sign-intersection-y-fill', N'Sign Intersection Y Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (538, N'bi-sign-intersection-y', N'Sign Intersection Y')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (539, N'bi-sign-intersection', N'Sign Intersection')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (540, N'bi-sign-merge-left-fill', N'Sign Merge Left Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (541, N'bi-sign-merge-left', N'Sign Merge Left')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (542, N'bi-sign-merge-right-fill', N'Sign Merge Right Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (543, N'bi-sign-merge-right', N'Sign Merge Right')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (544, N'bi-sign-no-left-turn-fill', N'Sign No Left Turn Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (545, N'bi-sign-no-left-turn', N'Sign No Left Turn')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (546, N'bi-sign-no-parking-fill', N'Sign No Parking Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (547, N'bi-sign-no-parking', N'Sign No Parking')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (548, N'bi-sign-no-right-turn-fill', N'Sign No Right Turn Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (549, N'bi-sign-no-right-turn', N'Sign No Right Turn')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (550, N'bi-sign-railroad-fill', N'Sign Railroad Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (551, N'bi-sign-railroad', N'Sign Railroad')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (552, N'bi-building-add', N'Building Add')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (553, N'bi-building-check', N'Building Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (554, N'bi-building-dash', N'Building Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (555, N'bi-building-down', N'Building Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (556, N'bi-building-exclamation', N'Building Exclamation')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (557, N'bi-building-fill-add', N'Building Fill Add')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (558, N'bi-building-fill-check', N'Building Fill Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (559, N'bi-building-fill-dash', N'Building Fill Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (560, N'bi-building-fill-down', N'Building Fill Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (561, N'bi-building-fill-exclamation', N'Building Fill Exclamation')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (562, N'bi-building-fill-gear', N'Building Fill Gear')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (563, N'bi-building-fill-lock', N'Building Fill Lock')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (564, N'bi-building-fill-slash', N'Building Fill Slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (565, N'bi-building-fill-up', N'Building Fill Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (566, N'bi-building-fill-x', N'Building Fill X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (567, N'bi-building-fill', N'Building Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (568, N'bi-building-gear', N'Building Gear')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (569, N'bi-building-lock', N'Building Lock')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (570, N'bi-building-slash', N'Building Slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (571, N'bi-building-up', N'Building Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (572, N'bi-building-x', N'Building X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (573, N'bi-buildings-fill', N'Buildings Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (574, N'bi-buildings', N'Buildings')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (575, N'bi-bus-front-fill', N'Bus Front Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (576, N'bi-bus-front', N'Bus Front')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (577, N'bi-ev-front-fill', N'EV Front Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (578, N'bi-ev-front', N'EV Front')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (579, N'bi-globe-americas', N'Globe Americas')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (580, N'bi-globe-asia-australia', N'Globe Asia Australia')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (581, N'bi-globe-central-south-asia', N'Globe Central South Asia')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (582, N'bi-globe-europe-africa', N'Globe Europe Africa')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (583, N'bi-house-add-fill', N'House Add Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (584, N'bi-house-add', N'House Add')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (585, N'bi-house-check-fill', N'House Check Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (586, N'bi-house-check', N'House Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (587, N'bi-house-dash-fill', N'House Dash Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (588, N'bi-house-dash', N'House Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (589, N'bi-house-down-fill', N'House Down Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (590, N'bi-house-down', N'House Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (591, N'bi-house-exclamation-fill', N'House Exclamation Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (592, N'bi-house-exclamation', N'House Exclamation')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (593, N'bi-house-gear-fill', N'House Gear Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (594, N'bi-house-gear', N'House Gear')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (595, N'bi-house-lock-fill', N'House Lock Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (596, N'bi-house-lock', N'House Lock')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (597, N'bi-house-slash-fill', N'House Slash Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (598, N'bi-house-slash', N'House Slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (599, N'bi-house-up-fill', N'House Up Fill')
GO
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (600, N'bi-house-up', N'House Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (601, N'bi-house-x-fill', N'House X Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (602, N'bi-house-x', N'House X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (603, N'bi-person-add', N'Person Add')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (604, N'bi-person-down', N'Person Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (605, N'bi-person-exclamation', N'Person Exclamation')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (606, N'bi-person-fill-add', N'Person Fill Add')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (607, N'bi-person-fill-check', N'Person Fill Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (608, N'bi-person-fill-dash', N'Person Fill Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (609, N'bi-person-fill-down', N'Person Fill Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (610, N'bi-person-fill-exclamation', N'Person Fill Exclamation')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (611, N'bi-person-fill-gear', N'Person Fill Gear')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (612, N'bi-person-fill-lock', N'Person Fill Lock')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (613, N'bi-person-fill-slash', N'Person Fill Slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (614, N'bi-person-fill-up', N'Person Fill Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (615, N'bi-person-fill-x', N'Person Fill X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (616, N'bi-person-gear', N'Person Gear')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (617, N'bi-person-lock', N'Person Lock')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (618, N'bi-person-slash', N'Person Slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (619, N'bi-person-up', N'Person Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (620, N'bi-scooter', N'Scooter')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (621, N'bi-taxi-front-fill', N'Taxi Front Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (622, N'bi-taxi-front', N'Taxi Front')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (623, N'bi-amd', N'AMD')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (624, N'bi-database-add', N'Database Add')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (625, N'bi-database-check', N'Database Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (626, N'bi-database-dash', N'Database Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (627, N'bi-database-down', N'Database Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (628, N'bi-database-exclamation', N'Database Exclamation')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (629, N'bi-database-fill-add', N'Database Fill Add')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (630, N'bi-database-fill-check', N'Database Fill Check')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (631, N'bi-database-fill-dash', N'Database Fill Dash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (632, N'bi-database-fill-down', N'Database Fill Down')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (633, N'bi-database-fill-exclamation', N'Database Fill Exclamation')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (634, N'bi-database-fill-gear', N'Database Fill Gear')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (635, N'bi-database-fill-lock', N'Database Fill Lock')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (636, N'bi-database-fill-slash', N'Database Fill Slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (637, N'bi-database-fill-up', N'Database Fill Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (638, N'bi-database-fill-x', N'Database Fill X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (639, N'bi-database-fill', N'Database Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (640, N'bi-database-gear', N'Database Gear')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (641, N'bi-database-lock', N'Database Lock')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (642, N'bi-database-slash', N'Database Slash')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (643, N'bi-database-up', N'Database Up')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (644, N'bi-database-x', N'Database X')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (645, N'bi-database', N'Database')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (646, N'bi-houses-fill', N'Houses Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (647, N'bi-houses', N'Houses')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (648, N'bi-nvidia', N'Nvidia')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (649, N'bi-person-vcard-fill', N'Person VCard Fill')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (650, N'bi-person-vcard', N'Person VCard')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (651, N'bi-sina-weibo', N'Sina Weibo')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (652, N'bi-tencent-qq', N'Tencent QQ')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (653, N'bi-wikipedia', N'Wikipedia')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (654, N'bi-alphabet-uppercase', N'Alphabet Uppercase')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (655, N'bi-alphabet', N'Alphabet')
INSERT [dbo].[tbl_Icons] ([ID], [class_name], [label_icon]) VALUES (656, N'bi-amazon', N'Amazon')
SET IDENTITY_INSERT [dbo].[tbl_Icons] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Menus] ON 

INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (1, N'Dashboard', N'Dashboard', N'bi bi-speedometer2', 1, N'#', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (2, N'Sale', N'លក់', N'bi-cart', 2, N'##', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (3, N'Integration', N'Integration', N'bi bi-plug', 3, N'##', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (4, N'Inventory Management ', N'ឃ្លាំង', N'bi-archive', 4, N'##', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (5, N'Reports & Analytics', N'Reports & Analytics', N'bi-file-earmark-bar-graph', 7, N'##', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (6, N'Settings', N'កំណត់', N'bi-gear', 6, N'##', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (7, N'Admin Management', N'Admin Management', N'bi-person-fill', 10, N'##', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (8, N'Customer Management', N'Customer Management', N'bi bi-people', 8, N'###', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (13, N'Employee Management', N'Employee Management', N'bi bi-shield-lock', 9, N'#', 1)
INSERT [dbo].[tbl_Menus] ([ID], [Menu_Name], [Menu_Name_Kh], [Icon], [Level], [Partial_Name], [Is_Active]) VALUES (14, N'Security Management', N'Security  Management', N'bi bi-key', 5, N'#', 1)
SET IDENTITY_INSERT [dbo].[tbl_Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Modules] ON 

INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (2, N'Sale History', N'ប្រវត្តិលក់', N'bi bi-bar-chart-line', 2, 2, N'_SaleHistory', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (3, N'Accounting Software', N'Accounting Software', N'bi bi-file-earmark-ruled', 1, 3, N'_AccountingSoftware', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (4, N'Product List', N'Product List', N'bi bi-grid', 1, 4, N'_ProductList', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (5, N'Sales Reports', N'របាយការណ៍លក់', N'bi-file-earmark-bar-graph', 1, 5, N'_SalesReports', N'#', 1, N'SalesReport', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (6, N'General Settings', N'General Setting', N'bi-gear', 1, 6, N'_GeneralSetting', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (7, N'Menu', N'ម៉ឺនុយ', N'bi-list', 1, 7, N'_Menu', N'#', 1, N'Menu', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (8, N'Module', N'Module', N'bi bi-globe', 2, 7, N'_Module', N'#', 1, N'Module', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (23, N'Role Management', N'Role Management', N'bi bi-reception-3', 4, 7, N'_RoleManagement', N'#', 0, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (24, N'Profile Setting', N'Profile Setting', N'bi bi-person-circle', 2, 6, N'_ProfileSetting', N'#', 1, N'ProfileSetting', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (25, N'Settting123', N'Setting123', N'bi bi-setting', 4, 6, N'_Setting123', N'#', 0, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (26, N'costaccountteste', N'costaccounttest', N'bi bi-cart', 8, 8, N'_CostAcctest', N'#', 0, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (27, N'Overview', N'Overview', N'bi bi-fan', 1, 1, N'_Overview', N'#', 1, N'Overview', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (28, N'Recent Transactions ', N'Recent Transactions', N'bi bi-arrow-right-circle', 2, 1, N'_RecentTransactions', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (29, N'Sales Performance', N'Sales Performance', N'bi bi-bar-chart', 3, 1, N'_SalesPerformance', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (30, N'New Sale', N'New Sale', N'bi bi-tags', 2, 2, N'_NewSales', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (31, N'Refund/Return', N'Refund/Return', N'bi bi-hand-thumbs-up', 3, 2, N'_Refund', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (32, N'Discounts & Coupons', N'Discounts & Coupons', N'bi bi-tag', 4, 2, N'_Discount', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (33, N'Stock Management', N'Stock Management', N'bi bi-file-earmark', 3, 4, N'_StockManagement', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (34, N'Low Stock Alerts', N'Low Stock Alerts', N'bi bi-exclamation-triangle', 4, 4, N'_LowStockAlerts', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (35, N'Inventory Reports', N'Inventory Reports', N'bi bi-clipboard', 6, 4, N'_InventoryReports', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (36, N'Customer Profiles', N'Customer Profiles', N'bi bi-person-lines-fill', 1, 8, N'_CustomerProfiles', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (37, N'Loyalty Programs', N'Loyalty Programs', N'bi bi-gift', 3, 8, N'_LoyaltyPrograms', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (38, N'Customer Communication', N'Customer Communication', N'bi bi-envelope', 4, 8, N'_CustomerCommunication', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (39, N'Employee Roles', N'Employee Roles', N'bi bi-person-badge', 1, 13, N'_EmployeeRoles', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (40, N'Timesheets', N'Timesheets', N'bi bi-calendar', 2, 13, N'_Timesheets', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (41, N'Sales Tracking by Employee', N'Sales Tracking by Employee', N'bi bi-bar-chart-line', 3, 13, N'_SalesTrackingByEmployee', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (42, N'Inventory Reports', N'របាយការណ៍ក្នុងឃ្លាំង', N'bi bi-table', 1, 5, N'_InventoryReports', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (43, N'Financial Reports', N'Financial Reports', N'bi bi-cash', 3, 5, N'_FinancialReports', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (44, N'Audit Logs', N'Audit Logs', N'bi bi-journal-text', 4, 5, N'_AuditLogs', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (45, N'Payment Settings', N'Payment Settings', N'bi bi-credit-card', 3, 6, N'_PaymentSetting', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (46, N'Receipt Settings', N'Receipt Settings', N'bi bi-receipt', 4, 6, N'_ReceiptSetting', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (47, N'Backup & Data Recovery', N'Backup & Data Recovery', N'bi bi-arrow-counterclockwise', 5, 6, N'_BackupDataRecovery', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (48, N'E-commerce Integration', N'E-commerce Integration', N'bi bi-shop', 2, 3, N'_EcommerceIntegration', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (49, N'Third-Party Apps', N'Third-Party Apps', N'bi bi-app', 3, 3, N'_ThirdPartyApps', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (50, N'User Permissions', N'User Permissions', N'bi bi-person-badge', 1, 14, N'_UserPermissions', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (51, N'Login & Authentication', N'Login & Authentication', N'bi bi-person-check', 2, 14, N'_LoginAuthentication', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (52, N'Password Management', N'Password Management', N'bi bi-key', 3, 14, N'_PasswordManagement', N'#', 1, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (54, N'dasdf', N'asdfsadf', NULL, 1, 1, NULL, N'#', 0, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (59, N'Register Company', N'Register Company', N'bi bi-building-fill-add', 4, 7, N'_RegisterCompany', N'#', 1, N'RegisterCompany', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (60, N'Register User', N'Register User', N'bi bi-person-plus-fill', 5, 7, N'_RegisterUsers', N'#', 1, N'RegisterUsers', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (61, N'Department', N'Department', N'bi-house-x', 5, 7, N'_Department', N'#', 1, N'Department', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (62, N'Role', N'Role', N'bi bi-role', 7, 7, N'_Role', N'#', 0, NULL, NULL)
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (63, N'Boostrap Icons', N'Boostrap Icons', N'bi-emoji-heart-eyes-fill', 7, 7, N'_BoostrapIcons', N'#', 1, N'BoostrapIcons', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (64, N'Manage Role', N'Manage Role', N'bi-command', 8, 7, N'_RoleManagement', N'#', 0, N'RoleManagement', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (65, N'Permission', N'Permission', N'bi-universal-access', 8, 7, N'#', N'#', 1, N'Permission', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (1065, N'Finger Scan', N'Finger Scan', N'abcde', 9, 3, NULL, N'#', 1, N'FingerScan', N'Index')
INSERT [dbo].[tbl_Modules] ([ID], [Module_Name], [Module_Name_Kh], [Icon], [Level], [Menu_Id], [Partial_Name], [Url], [Is_Active], [Controller], [Views]) VALUES (1066, N'Developer', N'Developer', N'bi-person-gear', 11, 7, NULL, N'#', 1, N'Developer', N'Index')
SET IDENTITY_INSERT [dbo].[tbl_Modules] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Permission_Module_On_Role] ON 

INSERT [dbo].[tbl_Permission_Module_On_Role] ([ID], [module_id], [role_id], [company_code], [full], [list], [add], [edit], [view], [print], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1, 29, 1, NULL, 0, 0, 1, 1, NULL, 1, 1, 1, CAST(N'2025-03-08T19:28:48.590' AS DateTime), 1, CAST(N'2025-03-08T20:23:56.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Permission_Module_On_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Permission_Module_On_User] ON 

INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1, 29, NULL, 1, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-08T22:10:24.683' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (2, 28, NULL, 1, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-08T22:10:24.683' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (3, 27, NULL, 1, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-08T22:10:24.683' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (7, 32, NULL, 5, NULL, 0, 0, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-08T22:21:17.930' AS DateTime), 0, CAST(N'2025-03-10T08:54:29.207' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (9, 29, NULL, 5, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-09T20:44:14.193' AS DateTime), 1, CAST(N'2025-03-10T08:54:29.207' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (11, 3, NULL, 2, NULL, 0, 1, 1, 0, 1, NULL, 1, 1, CAST(N'2025-03-09T23:50:09.763' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (12, 3, 2, 2, NULL, 0, 1, 1, 0, 1, NULL, 1, 1, CAST(N'2025-03-09T23:51:07.280' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (15, 32, NULL, 1, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (16, 31, NULL, 1, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (17, 30, NULL, 1, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (18, 2, NULL, 1, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (19, 1065, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (20, 49, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (21, 48, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (22, 3, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (23, 35, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (24, 34, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (25, 33, NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (26, 4, NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (27, 44, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (28, 43, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (29, 42, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (30, 5, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (31, 47, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (32, 46, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (33, 45, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (34, 24, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (35, 6, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (36, 65, NULL, 1, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (37, 64, NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-03-26T21:55:37.783' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (38, 63, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (39, 61, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (40, 60, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (41, 59, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (42, 8, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (43, 7, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (44, 38, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (45, 37, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (46, 36, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (47, 41, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (48, 40, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (49, 39, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (50, 52, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (51, 51, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (52, 50, NULL, 1, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:52:39.817' AS DateTime), 1, CAST(N'2025-04-01T22:27:48.593' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (53, 27, NULL, 2, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T08:55:20.390' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (54, 27, 2, 2, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-10T09:21:33.370' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (55, 65, NULL, 2, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-10T12:50:47.797' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1015, 65, 2, 2, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-11T08:36:00.483' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1056, 32, NULL, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T11:10:33.240' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1057, 31, NULL, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T11:10:33.240' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1058, 30, NULL, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T11:10:33.240' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1059, 38, NULL, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T11:10:33.240' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1060, 52, NULL, 2, NULL, 0, 0, 1, 1, 0, NULL, 0, 1, CAST(N'2025-03-11T11:10:33.240' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1061, 30, 2, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T11:19:47.940' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1062, 31, 2, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T11:19:47.940' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1063, 32, 2, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T11:19:47.940' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1064, 38, 2, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T11:19:47.940' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1065, 52, 2, 2, NULL, 0, 0, 1, 1, 0, NULL, 0, 1, CAST(N'2025-03-11T11:19:47.940' AS DateTime), 2, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1101, 41, NULL, 2, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T14:21:17.757' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1102, 41, 2, 2, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T14:31:28.233' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1103, 8, NULL, 2, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T14:36:23.440' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1104, 7, NULL, 2, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T14:36:23.440' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1105, 7, 2, 2, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T14:53:22.590' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1106, 8, 2, 2, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-11T14:53:22.590' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1118, 51, NULL, 3, NULL, 0, 1, 1, 0, 0, NULL, 0, 1, CAST(N'2025-03-13T09:00:55.020' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1119, 51, 3, 3, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-13T10:01:54.830' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1121, 51, NULL, 2, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime), 1, CAST(N'2025-03-13T11:20:18.710' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1122, 27, NULL, 3, NULL, 0, 1, 0, 1, 0, NULL, 0, 1, CAST(N'2025-03-13T11:40:33.737' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1123, 27, 3, 3, NULL, 0, 1, 0, 1, 0, NULL, 0, 1, CAST(N'2025-03-13T13:18:08.840' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1125, 24, NULL, 3, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, CAST(N'2025-03-13T13:22:57.087' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1127, 24, 3, 3, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-15T23:28:49.767' AS DateTime), 3, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1128, 30, NULL, 3, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-15T23:31:36.650' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1129, 2, NULL, 3, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-15T23:31:36.650' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1130, 2, 3, 3, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-15T23:32:20.167' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1131, 30, 3, 3, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-15T23:32:20.167' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1132, 65, NULL, 3, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime), 1, CAST(N'2025-03-15T23:33:05.287' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1133, 65, 3, 3, NULL, 0, 0, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-15T23:33:33.927' AS DateTime), 1, NULL)
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1134, 29, NULL, 1005, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1135, 28, NULL, 1005, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1136, 27, NULL, 1005, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1137, 32, NULL, 1005, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1138, 31, NULL, 1005, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1139, 30, NULL, 1005, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1140, 2, NULL, 1005, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1141, 1065, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1142, 49, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1143, 48, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1144, 3, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1145, 35, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1146, 34, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1147, 33, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1148, 4, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1149, 44, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1150, 43, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1151, 42, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1152, 5, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1153, 47, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1154, 46, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
GO
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1155, 45, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1156, 24, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1157, 6, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1158, 65, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1159, 64, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-03-26T21:57:49.543' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1160, 63, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1161, 61, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1162, 60, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1163, 59, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1164, 8, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1165, 7, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1166, 38, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1167, 37, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1168, 36, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1169, 41, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1170, 40, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1171, 39, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1172, 52, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1173, 51, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1174, 50, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T21:57:49.540' AS DateTime), 1, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1216, 2, 1, 1005, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1217, 3, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1218, 4, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1219, 5, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1220, 6, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1221, 7, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1222, 8, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1223, 24, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1224, 27, 1, 1005, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1225, 28, 1, 1005, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1226, 29, 1, 1005, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1227, 30, 1, 1005, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1228, 31, 1, 1005, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1229, 32, 1, 1005, NULL, 0, 1, 0, 1, 1, NULL, 1, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1230, 33, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1231, 34, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1232, 35, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1233, 36, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1234, 37, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1235, 38, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1236, 39, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1237, 40, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1238, 41, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1239, 42, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1240, 43, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1241, 44, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1242, 45, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1243, 46, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1244, 47, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1245, 48, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1246, 49, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1247, 50, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1248, 51, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1249, 52, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1250, 59, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1251, 60, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1252, 61, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1253, 63, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1254, 64, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, NULL)
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1255, 65, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1256, 1065, 1, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-03-26T22:02:07.163' AS DateTime), 2, CAST(N'2025-04-01T22:27:56.323' AS DateTime))
INSERT [dbo].[tbl_Permission_Module_On_User] ([ID], [module_id], [user_id], [role_id], [company_code], [full], [list], [add], [edit], [print], [view], [delete], [is_active], [assign_date], [assign_by], [update_date]) VALUES (1257, 1066, NULL, 1005, NULL, 0, 1, 0, 0, 0, NULL, 0, 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime), 1, CAST(N'2025-04-03T22:35:51.943' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Permission_Module_On_User] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Permissions] ON 

INSERT [dbo].[tbl_Permissions] ([ID], [Permission_Name], [Description], [Is_Active]) VALUES (1, N'View', N'Permission to view details.', NULL)
INSERT [dbo].[tbl_Permissions] ([ID], [Permission_Name], [Description], [Is_Active]) VALUES (2, N'Edit', N'Permission to edit details.', NULL)
INSERT [dbo].[tbl_Permissions] ([ID], [Permission_Name], [Description], [Is_Active]) VALUES (3, N'Delete', N'Permission to delete.', NULL)
INSERT [dbo].[tbl_Permissions] ([ID], [Permission_Name], [Description], [Is_Active]) VALUES (4, N'Add', N'Permission to add new entries.', NULL)
INSERT [dbo].[tbl_Permissions] ([ID], [Permission_Name], [Description], [Is_Active]) VALUES (5, N'Manage', N'Permission to manage roles and permissions.', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Role_Module_Permissions] ON 

INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (1, 1, 7, 1, 5, 1)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (2, 1, 8, 1, 5, 1)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (3, 1, 23, 1, 5, 1)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (4, 1, 4, 2, 2, 1)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (5, 2, 1, 2, 2, 1)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (6, 2, 2, 2, 2, 1)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (7, 2, 3, 2, 2, 1)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (8, 2, 4, 2, 2, 0)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (9, 3, 1, 2, 2, 1)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (10, 3, 2, 2, 2, 0)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (11, 3, 3, 2, 2, 0)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (12, 3, 4, 2, 2, 0)
INSERT [dbo].[tbl_Role_Module_Permissions] ([ID], [Role_Id], [Module_Id], [User_Id], [Company_Id], [Is_Active]) VALUES (14, 2, 48, 2, NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_Role_Module_Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Roles] ON 

INSERT [dbo].[tbl_Roles] ([ID], [Role_Name], [Description]) VALUES (1, N'Admin', N'Full access to all features and settings.')
INSERT [dbo].[tbl_Roles] ([ID], [Role_Name], [Description]) VALUES (2, N'Manager', N'Limited access to settings and data management.')
INSERT [dbo].[tbl_Roles] ([ID], [Role_Name], [Description]) VALUES (3, N'User', N'Basic access to the system with limited permissions.')
INSERT [dbo].[tbl_Roles] ([ID], [Role_Name], [Description]) VALUES (4, N'Guest', N'View only')
INSERT [dbo].[tbl_Roles] ([ID], [Role_Name], [Description]) VALUES (1005, N'Super Admin', N'This role user can see all module')
SET IDENTITY_INSERT [dbo].[tbl_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_StatusFlow] ON 

INSERT [dbo].[tbl_StatusFlow] ([ID], [status_name], [create_date], [is_delete], [remark]) VALUES (1, N'Draft', CAST(N'2025-04-03' AS Date), NULL, NULL)
INSERT [dbo].[tbl_StatusFlow] ([ID], [status_name], [create_date], [is_delete], [remark]) VALUES (2, N'Submit', CAST(N'2025-04-03' AS Date), NULL, NULL)
INSERT [dbo].[tbl_StatusFlow] ([ID], [status_name], [create_date], [is_delete], [remark]) VALUES (3, N'Cancel', CAST(N'2025-04-03' AS Date), NULL, NULL)
INSERT [dbo].[tbl_StatusFlow] ([ID], [status_name], [create_date], [is_delete], [remark]) VALUES (4, N'Aprroved', CAST(N'2025-04-03' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_StatusFlow] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_System] ON 

INSERT [dbo].[tbl_System] ([ID], [System_Name], [Description], [Is_Active]) VALUES (1, N'POS System', N'Point of Sale system for retail businesses.', 1)
INSERT [dbo].[tbl_System] ([ID], [System_Name], [Description], [Is_Active]) VALUES (2, N'Inventory Management', N'System for managing inventory and stock levels.', 1)
INSERT [dbo].[tbl_System] ([ID], [System_Name], [Description], [Is_Active]) VALUES (3, N'CRM System', N'Customer Relationship Management system.', 1)
SET IDENTITY_INSERT [dbo].[tbl_System] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Telgram_Users] ON 

INSERT [dbo].[tbl_Telgram_Users] ([ID], [user_id], [first_name], [last_name], [user_name]) VALUES (1, 1426993662, N'Savin', N'EM', N'S_Viin')
SET IDENTITY_INSERT [dbo].[tbl_Telgram_Users] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_UserRoles] ON 

INSERT [dbo].[tbl_UserRoles] ([ID], [User_Id], [Role_Id], [Assigned_Date], [Delete_Date], [Assign_By], [Remark]) VALUES (2, 2, 2, CAST(N'2025-01-16T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tbl_UserRoles] ([ID], [User_Id], [Role_Id], [Assigned_Date], [Delete_Date], [Assign_By], [Remark]) VALUES (4, 4, 4, CAST(N'2025-02-20T13:54:58.170' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tbl_UserRoles] ([ID], [User_Id], [Role_Id], [Assigned_Date], [Delete_Date], [Assign_By], [Remark]) VALUES (1010, 3, 3, CAST(N'2025-03-13T09:00:20.183' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[tbl_UserRoles] ([ID], [User_Id], [Role_Id], [Assigned_Date], [Delete_Date], [Assign_By], [Remark]) VALUES (1013, 1, 1005, CAST(N'2025-03-26T21:59:22.360' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[tbl_UserRoles] ([ID], [User_Id], [Role_Id], [Assigned_Date], [Delete_Date], [Assign_By], [Remark]) VALUES (1016, 4, 2, CAST(N'2025-03-26T22:10:14.720' AS DateTime), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[tbl_UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([ID], [username], [firstname], [lastname], [email], [password], [is_active], [sex], [address], [phone], [image], [image_path], [company_id], [department_id]) VALUES (1, N'Savin.Em', N'Savin', N'Em', N'john.doe@email.com', N'123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Users] ([ID], [username], [firstname], [lastname], [email], [password], [is_active], [sex], [address], [phone], [image], [image_path], [company_id], [department_id]) VALUES (2, N'Manager', N'Vannak', N'Chhoeng', N'jane.smith@email.com', N'123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Users] ([ID], [username], [firstname], [lastname], [email], [password], [is_active], [sex], [address], [phone], [image], [image_path], [company_id], [department_id]) VALUES (3, N'User', N'Sommang', N'Soum', N'michael.brown@email.com', N'123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Users] ([ID], [username], [firstname], [lastname], [email], [password], [is_active], [sex], [address], [phone], [image], [image_path], [company_id], [department_id]) VALUES (4, N'Guest.User', N'Guest', N'Guest', N'Guest@gmail.com', N'123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
ALTER TABLE [dbo].[tbl_Menus] ADD  CONSTRAINT [DF_tbl_Menus_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [dbo].[tbl_Modules] ADD  CONSTRAINT [DF_tbl_Modules_Is_Active]  DEFAULT ((0)) FOR [Is_Active]
GO
ALTER TABLE [dbo].[tbl_Permission_Module_On_User] ADD  CONSTRAINT [DF__ModulePerm__Full__1BC821DD]  DEFAULT ((0)) FOR [full]
GO
ALTER TABLE [dbo].[tbl_Permission_Module_On_User] ADD  CONSTRAINT [DF__ModulePerm__List__1CBC4616]  DEFAULT ((0)) FOR [list]
GO
ALTER TABLE [dbo].[tbl_Permission_Module_On_User] ADD  CONSTRAINT [DF__ModulePermi__Add__1DB06A4F]  DEFAULT ((0)) FOR [add]
GO
ALTER TABLE [dbo].[tbl_Permission_Module_On_User] ADD  CONSTRAINT [DF__ModulePerm__Edit__1EA48E88]  DEFAULT ((0)) FOR [edit]
GO
ALTER TABLE [dbo].[tbl_Permission_Module_On_User] ADD  CONSTRAINT [DF__ModulePer__Print__1F98B2C1]  DEFAULT ((0)) FOR [print]
GO
ALTER TABLE [dbo].[tbl_Permission_Module_On_User] ADD  CONSTRAINT [DF__ModulePer__Is_Ac__208CD6FA]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tbl_Permission_Module_On_User] ADD  CONSTRAINT [DF__ModulePer__Assig__2180FB33]  DEFAULT (getdate()) FOR [assign_date]
GO
ALTER TABLE [dbo].[tbl_Role_Module_Permissions] ADD  CONSTRAINT [DF_tbl_Role_Module_Permissions_Is_Active]  DEFAULT ((0)) FOR [Is_Active]
GO
/****** Object:  StoredProcedure [dbo].[SP_ASSIGN_ROLE_TO_USER]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_ASSIGN_ROLE_TO_USER]
    @RoleId INT = NULL,
    @AssignBy INT = NULL,
    @JsonData NVARCHAR(MAX) = NULL,
    @Remark NVARCHAR(200) = NULL,
    @Message NVARCHAR(255) OUTPUT
AS
BEGIN
    -- Declare the necessary variables
    DECLARE @tblResult TABLE (user_id INT);
    DECLARE @TransactionError INT = 0;
	 
    BEGIN TRY
        BEGIN TRANSACTION; 
 
         INSERT INTO @tblResult (user_id)
        SELECT 
            js.userDataId
        FROM OPENJSON(@JsonData) 
        WITH (
            userDataId INT '$.userDataId'
        ) js;
 
        INSERT INTO DBO.tbl_UserRoles (User_Id, Role_Id, Assigned_Date, Assign_By, Remark)
        SELECT
            R.user_id,
            @RoleId,
            GETDATE(),
            @AssignBy,
            @Remark
        FROM @tblResult R
        WHERE R.user_id NOT IN (SELECT ur.User_Id FROM dbo.tbl_UserRoles ur WHERE ur.Role_Id = @RoleId);
		 
        SET @Message = 'Role assigned successfully from stored procedure!';

        -- Commit the transaction if no errors occurred
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH 
        SET @Message = 'Error occurred while assigning role: ' + ERROR_MESSAGE();
		 
        ROLLBACK TRANSACTION;
    END CATCH
END;



 --select * from dbo.tbl_UserRoles;

--DECLARE @ResultMessage NVARCHAR(255);

--EXEC SP_ASSIGN_ROLE_TO_USER  
--    @RoleId = 123,  
--    @JsonData = '{"userDataId": [2, 3]}',  -- Fixed JSON format
--    @Remark = 'remark',
--    @Message = @ResultMessage OUTPUT;  -- Correct way to get output value

--PRINT @ResultMessage;
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_ROLE_FROM_USER]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_ROLE_FROM_USER]
    @RoleId INT = NULL,
    @UserId INT = NULL, 
    @Message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @CODE INT = 0;
    DECLARE @Success BIT = 1;

    BEGIN TRANSACTION;

    BEGIN TRY
 
        DELETE FROM dbo.tbl_UserRoles WHERE Role_Id = @RoleId AND User_Id = @UserId;
        
        -- Check if delete was successful
        IF @@ROWCOUNT > 0
        BEGIN 
            DELETE FROM dbo.tbl_Permission_Module_On_User WHERE user_id = @UserId AND role_id = @RoleId;
            SET @CODE = 1;
        END
        ELSE
        BEGIN 
            SET @Success = 0;
            THROW 50001, 'Failed to delete from tbl_UserRoles', 1;
        END

        -- If all successful, commit transaction
        IF @Success = 1
        BEGIN
            COMMIT TRANSACTION;
            SET @Message = 'Success Delete';
        END
        ELSE 
        BEGIN
            ROLLBACK TRANSACTION;
            SET @Message = 'Error Delete';
        END

    END TRY 
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Message = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MENU_PERMISSION_ON_SCREEN]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE [dbo].[SP_GET_MENU_PERMISSION_ON_SCREEN]
	   @UserId INT  = NULL
AS BEGIN 
			DECLARE @TempTable TABLE (_RoleId INT , _UserId INT);
			INSERT INTO @TempTable 
			SELECT 
				UR.Role_Id AS _RoleId,
				UR.User_Id AS _UserId
			FROM tbl_UserRoles UR WHERE UR.User_Id = @UserId AND UR.Delete_Date IS NULL
			  
			DECLARE @TempTableMenu1 TABLE (
											ID INT,
											menu_name NVARCHAR(100),
											menu_name_kh NVARCHAR(100),
											level  INT ,
											is_active BIT,
											icon NVARCHAR(50),
											partial_name NVARCHAR(100)
											)

			DECLARE @TempTableMenu2 TABLE (
											ID INT,
											menu_name NVARCHAR(100),
											menu_name_kh NVARCHAR(100),
											level  INT ,
											is_active BIT,
											icon NVARCHAR(50),
											partial_name NVARCHAR(100)
											);
		    DECLARE @TempTableMenu3  TABLE (
											ID INT,
											menu_name NVARCHAR(100),
											menu_name_kh NVARCHAR(100),
											level  INT ,
											is_active BIT,
											icon NVARCHAR(50),
											partial_name NVARCHAR(100)
											)
		
	 
		 INSERT INTO @TempTableMenu2 
			SELECT DISTINCT
				m.ID as ID ,
				m.Menu_Name as menu_name,
				m.Menu_Name_Kh as menu_name_kh,
				m.Level as level,
				m.Is_Active as is_active,
				m.Icon as icon ,
				m.Partial_Name as partial_name
		       FROM DBO.tbl_Permission_Module_On_User PMU
								INNER JOIN DBO.tbl_Modules MD
								ON MD.ID = PMU.module_id
								INNER JOIN DBO.tbl_Menus M
								ON M.ID = MD.Menu_Id 
								INNER JOIN @TempTable TP ON TP._RoleId = PMU.role_id 
								AND MD.Is_Active = 1
								AND PMU.is_active = 1
								AND PMU.list = 1 
							 	AND PMU.user_id IS NOT NULL 
						     	AND PMU.module_id  IN (SELECT UUU.module_id  FROM DBO.tbl_Permission_Module_On_User UUU WHERE UUU.user_id = @UserId AND UUU.module_id = PMU.module_id AND UUU.role_id =PMU.role_id AND UUU.list =1 ) 
								AND  EXISTS ( (SELECT 1  FROM DBO.tbl_Permission_Module_On_User UUU WHERE UUU.user_id = @UserId AND UUU.module_id = PMU.module_id AND UUU.role_id =PMU.role_id   ));  
			
			

		 INSERT INTO @TempTableMenu2 
			SELECT DISTINCT
				m.ID as ID ,
				m.Menu_Name as menu_name,
				m.Menu_Name_Kh as menu_name_kh,
				m.Level as level,
				m.Is_Active as is_active,
				m.Icon as icon ,
				m.Partial_Name as partial_name
		        FROM DBO.tbl_Permission_Module_On_User PMU
								INNER JOIN DBO.tbl_Modules MD
								ON MD.ID = PMU.module_id
								INNER JOIN DBO.tbl_Menus M
								ON M.ID = MD.Menu_Id 
								INNER JOIN @TempTable TP ON TP._RoleId = PMU.role_id 
								AND MD.Is_Active = 1
								AND PMU.is_active = 1
								AND PMU.list = 1  
								AND  EXISTS ( (SELECT 1  FROM DBO.tbl_Permission_Module_On_User UUU WHERE UUU.user_id = @UserId AND UUU.module_id = PMU.module_id AND UUU.role_id =PMU.role_id AND UUU.list = 1   ));  
			
			SELECT DISTINCT * FROM @TempTableMenu2; 
			RETURN;


		 INSERT INTO @TempTableMenu1 
			SELECT DISTINCT
				m.ID as ID ,
				m.Menu_Name as menu_name,
				m.Menu_Name_Kh as menu_name_kh,
				m.Level as level,
				m.Is_Active as is_active,
				m.Icon as icon ,
				m.Partial_Name as partial_name
		       FROM DBO.tbl_Permission_Module_On_User PMU
								INNER JOIN DBO.tbl_Modules MD
								ON MD.ID = PMU.module_id
								INNER JOIN DBO.tbl_Menus M
								ON M.ID = MD.Menu_Id 
								INNER JOIN @TempTable TP ON TP._RoleId = PMU.role_id
								AND MD.Is_Active = 1
								AND PMU.is_active = 1
								AND PMU.list = 1  
							 	AND PMU.user_id IS NOT NULL
							  	AND PMU.module_id IN (SELECT UU.module_id FROM DBO.tbl_Permission_Module_On_User UU WHERE  UU.user_id = @UserId AND UU.role_id = PMU.role_id AND UU.list = 1)
				
			


		INSERT INTO @TempTableMenu1
			SELECT DISTINCT
				m.ID as ID ,
				m.Menu_Name as menu_name,
				m.Menu_Name_Kh as menu_name_kh,
				m.Level as level,
				m.Is_Active as is_active,
				m.Icon as icon ,
				m.Partial_Name as partial_name
		   FROM DBO.tbl_Permission_Module_On_User PMU
								LEFT JOIN DBO.tbl_Modules MD
								ON MD.ID = PMU.module_id
								INNER JOIN DBO.tbl_Menus M
								ON M.ID = MD.Menu_Id 
								INNER JOIN @TempTable TB ON TB._RoleId = PMU.role_id  AND TB._UserId = PMU.user_id
								WHERE  MD.Is_Active = 1
								--AND PMU.module_id NOT IN (SELECT TT.ID FROM @TempTableMenu1 TT)
								AND PMU.module_id IN (SELECT UUU.module_id FROM DBO.tbl_Permission_Module_On_User UUU WHERE UUU.user_id = @UserId AND UUU.role_id IN (SELECT TR._RoleId FROM @TempTable TR))
								AND PMU.user_id IS NULL
								AND PMU.is_active = 1
								AND PMU.list = 1 ;
		 
		  

		INSERT INTO @TempTableMenu3
			SELECT   * FROM @TempTableMenu1
			UNION
			SELECT   * FROM @TempTableMenu2
		 
		 --FINAL SELECT 
		SELECT DISTINCT * FROM @TempTableMenu3; 
			
	 


END;
 
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MODULE_ON_ROLE_PERMISSION]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 CREATE PROCEDURE [dbo].[SP_GET_MODULE_ON_ROLE_PERMISSION]
		@MenuId INT = NULL ,
		@RoleId INT = NULL
 AS BEGIN
	   -- Temporary Table for Permissions
    DECLARE @tblTempPermissionOnRole TABLE (
        ID INT,
        module_name NVARCHAR(255), 
        [full] NVARCHAR(MAX),
        [list] NVARCHAR(MAX),
        [add] NVARCHAR(MAX),
        [edit] NVARCHAR(MAX),
        [print] NVARCHAR(MAX),
        [delete] NVARCHAR(MAX),
        remark NVARCHAR(MAX)
    );

	INSERT INTO @tblTempPermissionOnRole (ID, module_name, [full], [list], [add], [edit], [print], [delete], remark)
		SELECT DISTINCT
			MD.ID as [ID],
			MD.Module_Name as [module_name],
			PU.[full] as [full],
			PU.[list] as [list],
			PU.[add] as [add],
			PU.[edit] as [edit],
			PU.[print] as [print],
			PU.[delete] as [delete],
			'' as [remark]
		 FROM DBO.tbl_Permission_Module_On_User  PU
		 INNER JOIN DBO.tbl_Modules MD
		 ON MD.ID = PU.module_id 
		 INNER JOIN DBO.tbl_Menus M
		 ON M.ID = MD.Menu_Id
	WHERE PU.is_active = 1 
	AND MD.Is_Active = 1 
	AND M.ID = @MenuId 
	AND PU.role_id = @RoleId
	AND PU.user_id IS NULL
	AND PU.is_active = 1


	
	INSERT INTO @tblTempPermissionOnRole (ID, module_name, [full], [list], [add], [edit], [print], [delete], remark)
		SELECT DISTINCT
			MD.ID as [ID],
			MD.Module_Name as [module_name],
			0 as [full],
			0 as [list],
			0 as [add],
			0 as [edit],
			0 as [print],
			0 as [delete],
			'' as [remark]
		 FROM DBO.tbl_Modules  md  
		 INNER JOIN DBO.tbl_Menus M
		 ON M.ID = MD.Menu_Id  
		WHERE md.is_active = 1 
		AND m.Is_Active = 1 
		AND M.ID = @MenuId 
		AND MD.ID  NOT IN ( SELECT RR.module_id FROM DBO.tbl_Permission_Module_On_User RR WHERE RR.is_active = 1 AND RR.role_id  = @RoleId)
 
		  
	SELECT  DISTINCT
			MPD.Id as module_id,
			mpd.ID ,
			MPD.Module_Name as module_name, 
			CASE  WHEN mpd.[full] = 1 THEN 
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''full'')" role="switch" id="RoleFullflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"   checked >'
				ELSE 
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''full'')" role="switch" id="RoleFullflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"  >'
			END AS [full],
				
			CASE  WHEN mpd.[list] = 1 THEN 
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''list'')" role="switch" id="RoleListflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'" checked  >'
				ELSE 
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''list'')" role="switch" id="RoleListflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"  >'
			END AS [list],  
				
			CASE  WHEN mpd.[add] = 1 THEN 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''add'')" role="switch" id="RoleAddflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"  checked  >'
			ELSE 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''add'')" role="switch" id="RoleAddflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"  >'
			END AS [add],  

			CASE  WHEN mpd.[edit] = 1 THEN 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''edit'')" role="switch" id="RoleEditflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"   checked>'
			ELSE 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''edit'')" role="switch" id="RoleEditflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"  >'
			END AS [edit],
			  
			CASE  WHEN mpd.[print] = 1 THEN 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''print'')" role="switch" id="RolePrintflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"   checked>'
			ELSE 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''print'')" role="switch" id="RolePrintflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"  >'
			END AS [print],
			CASE  WHEN mpd.[delete] = 1 THEN 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''delete'')" role="switch" id="RoleDeleteflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"   checked>'
			ELSE 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(MPD.ID AS NVARCHAR) +', '''+ MPD.Module_Name + ''', ''delete'')" role="switch" id="RoleDeleteflexSwitchCheck_'+ CAST(MPD.ID AS NVARCHAR) +'"  >'
			END AS [delete],
			'' as remark 
	FROM     @tblTempPermissionOnRole MPD
	END;
 
   
 

 
 
 --SELECT * FROM DBO.tbl_Permission_Module_On_Role;
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION]
     @MenuId INT = NULL,
    @UserId INT = NULL
 AS
BEGIN
    SET NOCOUNT ON;

    -- Temporary Table for User Roles
    DECLARE @tempTableUserRole TABLE (_RoleId INT, _UserId INT);
    INSERT INTO @tempTableUserRole (_RoleId, _UserId)
    SELECT UR.Role_Id, UR.User_Id
    FROM DBO.tbl_UserRoles UR
    WHERE UR.User_Id = @UserId AND UR.Delete_Date IS NULL;

    -- Temporary Table for Permissions
    DECLARE @tblTempPermissionOnUser1 TABLE (
        ID INT,
        module_name NVARCHAR(255),
		[role_id] INT ,
        [full] NVARCHAR(MAX),
        [list] NVARCHAR(MAX),
        [add] NVARCHAR(MAX),
        [edit] NVARCHAR(MAX),
        [print] NVARCHAR(MAX),
        [delete] NVARCHAR(MAX),
        remark NVARCHAR(MAX)
    );
	 -- Temporary Table for Permissions
    DECLARE @tblTempPermissionOnUser2 TABLE (
        ID INT,
        module_name NVARCHAR(255),
		[role_id] INT ,
        [full] NVARCHAR(MAX),
        [list] NVARCHAR(MAX),
        [add] NVARCHAR(MAX),
        [edit] NVARCHAR(MAX),
        [print] NVARCHAR(MAX),
        [delete] NVARCHAR(MAX),
        remark NVARCHAR(MAX)
    );
	 -- Temporary Table for Permissions
    DECLARE @tblTempPermissionOnUser3 TABLE (
        ID INT,
        module_name NVARCHAR(255),
		[role_id] INT ,
        [full] NVARCHAR(MAX),
        [list] NVARCHAR(MAX),
        [add] NVARCHAR(MAX),
        [edit] NVARCHAR(MAX),
        [print] NVARCHAR(MAX),
        [delete] NVARCHAR(MAX),
        remark NVARCHAR(MAX)
    );

	 -- Temporary Table for Permissions for check user not exist in table
    DECLARE @tblTempPermissionOnUser4 TABLE (
        ID INT,
        module_name NVARCHAR(255),
		[role_id] INT ,
        [full] NVARCHAR(MAX),
        [list] NVARCHAR(MAX),
        [add] NVARCHAR(MAX),
        [edit] NVARCHAR(MAX),
        [print] NVARCHAR(MAX),
        [delete] NVARCHAR(MAX),
        remark NVARCHAR(MAX)
    );

	 	INSERT INTO @tblTempPermissionOnUser4 (ID, module_name, role_id , [full], [list], [add], [edit], [print], [delete], remark)
	    SELECT  
		MAX(MD.ID) as [ID],
		MAX(MD.Module_Name) as [module_name],
		MAX(PU.role_id) as [role_id],
		MAX(CAST(PU.[full] AS INT)) AS [full],
		MAX(CAST(PU.[list] AS INT)) AS [list],
		MAX(CAST(PU.[add] AS INT)) AS [add],
		MAX(CAST(PU.[edit] AS INT)) AS [edit],
		MAX(CAST(PU.[print] AS INT)) AS [print], 
		MAX(CAST(PU.[delete] AS INT)) AS [delete],  
		'' as [remark]
	FROM DBO.tbl_Permission_Module_On_User PU
	INNER JOIN DBO.tbl_Modules MD ON MD.ID = PU.module_id 
	INNER JOIN DBO.tbl_Menus M ON M.ID = MD.Menu_Id 
	INNER JOIN @tempTableUserRole UR ON UR._RoleId = PU.role_id 
	 INNER JOIN DBO.tbl_Permission_Module_On_User PUU ON  PU.role_id = PUU.role_id   
	WHERE MD.Is_Active = 1 
	AND M.ID = @MenuId  
    AND NOT EXISTS (SELECT 1 FROM DBO.tbl_Permission_Module_On_User UUU WHERE UUU.module_id = PU.module_id AND UUU.role_id = PU.role_id AND UUU.user_id = @UserId)
	GROUP BY PU.module_id;  

	  -- First INSERT: Check permissions specifically for the given @UserId
	   	INSERT INTO @tblTempPermissionOnUser1 (ID, module_name, role_id , [full], [list], [add], [edit], [print], [delete], remark)
	    SELECT  
		MAX(MD.ID) as [ID],
		MAX(MD.Module_Name) as [module_name],
		MAX(PU.role_id) as [role_id],
		MAX(CAST(
				CASE WHEN PU.[full]  > PUU.[full] THEN 1  
					WHEN PU.[full] = 1 AND PUU.[full] = 0  THEN 2  
				ELSE 0 END AS INT)) 
				as [full],  
		MAX(CAST(
				CASE WHEN PU.[list] > PUU.[list] THEN 1 
				WHEN PU.[list] = 1 AND PUU.[list] = 0  THEN 2
				ELSE 0  END AS INT))
				 as [list],
		MAX(CAST(
				CASE WHEN PU.[add]   > PUU.[add] THEN 1 
				WHEN PU.[add] = 1 AND PUU.[add] =  0 THEN 2
				ELSE 0 END AS INT)) 
				as [add],
		MAX(CAST(
				CASE WHEN PU.[edit]   > PUU.[edit] THEN 1 
				WHEN PU.[edit] = 1 AND PUU.[edit] =  0 THEN 2
				ELSE 0 END AS INT)) 
				as [edit],
		MAX(CAST(
				CASE WHEN PU.[print] > PUU.[print]  THEN 1 
				WHEN PU.[print] = 1 AND PUU.[print] = 0 THEN 2
				ELSE 0 END AS INT)) 
				as [print],
		MAX(CAST(
				CASE WHEN PU.[delete] > PUU.[delete] THEN 1 
				WHEN PU.[delete]  = 1 AND PUU.[delete] = 0 THEN 2
				ELSE 0 END AS INT)) as [delete],
		'' as [remark]
	FROM DBO.tbl_Permission_Module_On_User PU
	INNER JOIN DBO.tbl_Modules MD ON MD.ID = PU.module_id 
	INNER JOIN DBO.tbl_Menus M ON M.ID = MD.Menu_Id 
	INNER JOIN @tempTableUserRole UR ON UR._RoleId = PU.role_id 
	 INNER JOIN DBO.tbl_Permission_Module_On_User PUU ON  PU.role_id = PUU.role_id   
	WHERE MD.Is_Active = 1 
	AND M.ID = @MenuId 
	AND PU.user_id IS NULL  
 	--AND PUU.module_id NOT IN (select uu.module_id from dbo.tbl_Permission_Module_On_User uu where uu.user_id = @UserId) 
	GROUP BY PU.module_id; 
  
	

	INSERT INTO @tblTempPermissionOnUser2 (ID, module_name, role_id , [full], [list], [add], [edit], [print], [delete], remark)
	SELECT  
		MIN(MD.ID)  as [ID],
		MIN(MD.Module_Name) as [module_name],
		MIN(PU2.role_id) as [role_id],
	MIN(CASE 
			WHEN PU.[full] < PU2.[full] THEN 2  
			WHEN PU.[full] = 1 THEN 1 
            ELSE 0 
        END) as [full], 

	MIN(CASE  
			WHEN PU.[list] < PU2.[list] THEN 2 
			WHEN PU.[list] = 1 THEN 1 
			ELSE 0 
		END) as [list], 

	MIN(CASE 
			WHEN PU.[add] < PU2.[add] THEN 2 
			WHEN PU.[add] = 1 THEN 1 
			ELSE 0 
		END) as [add], 

	MIN(CASE 
			WHEN PU.[edit] > PU2.[edit] THEN 2 
			WHEN PU.[edit] = 1 THEN 1 
			ELSE 0 
		END) as [edit], 

	MIN(CASE 
			WHEN PU.[print] < PU2.[print] THEN 2 
			WHEN PU.[print] = 1 THEN 1 
			ELSE 0 
		END) as [print], 

	MIN(CASE 
			WHEN PU.[delete] < PU2.[delete] THEN 2 
			WHEN PU.[delete] = 1 THEN 1 
			ELSE 0 
		END) as [delete],

		'' as [remark]
	FROM DBO.tbl_Permission_Module_On_User PU
	INNER JOIN DBO.tbl_Modules MD ON MD.ID = PU.module_id 
	INNER JOIN DBO.tbl_Menus M ON M.ID = MD.Menu_Id 
	INNER JOIN @tempTableUserRole UR ON UR._RoleId = PU.role_id AND UR._UserId = PU.user_id
	 JOIN DBO.tbl_Permission_Module_On_User PU2 ON PU2.module_id = PU.module_id AND PU.role_id = PU2.role_id AND PU2.user_id = PU.user_id
	LEFT JOIN DBO.tbl_Users US ON US.ID = UR._UserId AND UR._UserId = PU.user_id
	WHERE MD.Is_Active = 1 
	AND M.ID = @MenuId 
	AND US.ID = @UserId  
	AND PU.user_id IS NOT NULL
	GROUP BY PU.module_id , PU.user_id;  

UPDATE T
SET 
    T.[list] = CASE WHEN c.list > t.[list] THEN 2 ELSE t.[list] END,
    T.[add] = CASE WHEN c.[add] > t.[add] THEN 2 ELSE t.[add] END,
    T.[edit] = CASE WHEN c.edit > t.[edit] THEN 2 ELSE t.[edit] END,
    T.[print] = CASE WHEN c.[print] > t.[print] THEN 2 ELSE t.[print] END,
    T.[delete] = CASE WHEN c.[delete] > t.[delete] THEN 2 ELSE t.[delete] END
FROM @tblTempPermissionOnUser2 t
 JOIN @tblTempPermissionOnUser1 c ON c.ID = t.ID ;


 INSERT INTO @tblTempPermissionOnUser3 
		SELECT * FROM @tblTempPermissionOnUser1
		UNION
		SELECT * FROM @tblTempPermissionOnUser2
		UNION
		SELECT * FROM  @tblTempPermissionOnUser4
 
  SELECT DISTINCT
    mpr.ID AS ID,
    MAX(mpr.Module_Name) AS module_name,   
    MAX(mpr.role_id) AS role_id,

    -- Full Permission
    CASE  
        WHEN MAX(MPR.[full]) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''full'')" role="switch" 
            id="UserFullflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" checked >'
        WHEN MAX(MPR.[full]) = 2 THEN   
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''full'')" role="switch" 
            id="UserFullflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" role="switch" 
            id="DisabledUserFullflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" disabled >'
    END AS [full],

    -- List Permission
    CASE 
        WHEN MAX(MPR.[list]) = 1 THEN  
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''list'')" role="switch" 
            id="UserListflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" checked >'
        WHEN MAX(MPR.[list]) = 2 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''list'')" role="switch" 
            id="UserListflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" role="switch" 
            id="DisabledUserListflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" disabled >'
    END AS [list],

    -- Add Permission
    CASE 
        WHEN MAX(MPR.[add]) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '     
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''add'')" role="switch" 
            id="UserAddflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" checked >'
        WHEN MAX(MPR.[add]) = 2 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''add'')" role="switch" 
            id="UserAddflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" role="switch" 
            id="DisabledUserAddflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" disabled >'
    END AS [add],

    -- Edit Permission
    CASE 
        WHEN MAX(MPR.[edit]) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '   
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''edit'')" role="switch" 
            id="UserEditflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" checked >'
        WHEN MAX(MPR.[edit]) = 2 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''edit'')" role="switch" 
            id="UserEditflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" role="switch" 
            id="DisabledUserEditflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" disabled >'
    END AS [edit],

    -- Print Permission
    CASE 
        WHEN MAX(MPR.[print]) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''print'')" role="switch" 
            id="UserPrintflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" checked >'
        WHEN MAX(MPR.[print]) = 2 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''print'')" role="switch" 
            id="UserPrintflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" role="switch" 
            id="DisabledUserPrintflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" disabled >'
    END AS [print],

    -- Delete Permission
    CASE 
        WHEN MAX(MPR.[delete]) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''delete'')" role="switch" 
            id="UserDeleteflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" checked >'
        WHEN MAX(MPR.[delete]) = 2 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '   
            + CAST(MAX(mpr.ID) AS NVARCHAR) + ', ''' + MAX(mpr.Module_Name) + ''', ''delete'')" role="switch" 
            id="UserDeleteflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" role="switch" 
            id="DisabledUserDeleteflexSwitchCheck_' + CAST(MAX(mpr.ID) AS NVARCHAR) + '" disabled >'
    END AS [delete],

    '' AS remark
FROM @tblTempPermissionOnUser3 mpr  
GROUP BY mpr.ID;
 
END;
 
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MODULE_PERMISSION_ON_SCREEN]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[SP_GET_MODULE_PERMISSION_ON_SCREEN] 
	       @UserId INT = NULL
AS BEGIN 
 		DECLARE @TempTable TABLE (_RoleId INT , _UserId INT); 
 		DECLARE @TempTableModuleId TABLE (_module_id INT ); 

		INSERT INTO @TempTable 
		SELECT 
			UR.Role_Id AS _RoleId,
			UR.User_Id AS _UserId
		FROM tbl_UserRoles UR WHERE UR.User_Id = @UserId AND UR.Delete_Date IS NULL 

		    DECLARE @TempModule1 TABLE (
					ID INT,
					module_name NVARCHAR(255),
					module_name_kh NVARCHAR(255),
					icon NVARCHAR(255),
					level INT,
					menu_id INT,
					partial_name NVARCHAR(255),
					url NVARCHAR(500),
					is_active BIT,
					controller NVARCHAR(255),
					views NVARCHAR(255),
					[list] BIT, 
					[add] BIT, 
					[delete] BIT, 
					[print] BIT, 
					[edit] BIT
				);  

		DECLARE @TempModule2 TABLE (
					ID INT,
					module_name NVARCHAR(255),
					module_name_kh NVARCHAR(255),
					icon NVARCHAR(255),
					level INT,
					menu_id INT,
					partial_name NVARCHAR(255),
					url NVARCHAR(500),
					is_active BIT,
					controller NVARCHAR(255),
					views NVARCHAR(255),
					[list] BIT, 
					[add] BIT, 
					[delete] BIT, 
					[print] BIT, 
					[edit] BIT
				);  
			
		DECLARE @TempModule3 TABLE (
					ID INT,
					module_name NVARCHAR(255),
					module_name_kh NVARCHAR(255),
					icon NVARCHAR(255),
					level INT,
					menu_id INT,
					partial_name NVARCHAR(255),
					url NVARCHAR(500),
					is_active BIT,
					controller NVARCHAR(255),
					views NVARCHAR(255),
					[list] BIT, 
					[add] BIT, 
					[delete] BIT, 
					[print] BIT, 
					[edit] BIT
				);  
				 
		 

		INSERT INTO @TempModule2
			SELECT      MD.ID, 
						MD.Module_Name, 
						MD.Module_Name_Kh, 
						MD.Icon, 
						MD.Level, 
                        MD.Menu_Id, 
						MD.Partial_Name, 
						MD.Url, 
						MD.Is_Active, 
						MD.Controller, 
						MD.Views, 
						MAX(CAST(prm.list AS INT)) AS list,
						MAX(CAST(prm.[add] AS INT)) AS [add],
						MAX(CAST(prm.[delete] AS INT)) AS [delete],
						MAX(CAST(prm.[print] AS INT)) AS [print],
						MAX(CAST(prm.[edit] AS INT)) AS [edit]
			FROM DBO.tbl_Permission_Module_On_User prm		
				INNER JOIN DBO.tbl_Modules MD ON MD.ID = PRM.module_id
				INNER JOIN @TempTable TP ON TP._RoleId = PRM.role_id  
				AND MD.Is_Active = 1
				AND PRM.is_active = 1
			    AND PRM.list = 1 
				AND prm.user_id IS NULL
				AND NOT EXISTS (SELECT 1 FROM DBO.tbl_Permission_Module_On_User UUU WHERE UUU.user_id = @UserId AND UUU.module_id = PRM.module_id AND UUU.role_id = TP._RoleId)
			GROUP BY MD.ID, MD.Module_Name, MD.Module_Name_Kh, MD.Icon, MD.Level, 
            MD.Menu_Id, MD.Partial_Name, MD.Url, MD.Is_Active, MD.Controller, MD.Views;
			   	 

		INSERT INTO @TempModule1
			SELECT       MD.ID, 
						MD.Module_Name, 
						MD.Module_Name_Kh, 
						MD.Icon, 
						MD.Level, 
                        MD.Menu_Id, 
						MD.Partial_Name, 
						MD.Url, 
						MD.Is_Active, 
						MD.Controller, 
						MD.Views, 
						MAX(CAST(prm.list AS INT)) AS list,
						MAX(CAST(prm.[add] AS INT)) AS [add],
						MAX(CAST(prm.[delete] AS INT)) AS [delete],
						MAX(CAST(prm.[print] AS INT)) AS [print],
						MAX(CAST(prm.[edit] AS INT)) AS [edit]
			FROM DBO.tbl_Permission_Module_On_User prm		
				INNER JOIN DBO.tbl_Modules MD ON MD.ID = PRM.module_id
				INNER JOIN @TempTable TP ON TP._RoleId = PRM.role_id AND PRM.user_id = TP._UserId 
				AND MD.Is_Active = 1
				AND PRM.is_active = 1
			    AND PRM.list = 1 
				and prm.user_id = @UserId
			GROUP BY MD.ID, MD.Module_Name, MD.Module_Name_Kh, MD.Icon, MD.Level, 
             MD.Menu_Id, MD.Partial_Name, MD.Url, MD.Is_Active, MD.Controller, MD.Views;

	  

		INSERT INTO @TempModule1
		SELECT			   
							MD.ID, 
							MD.Module_Name, 
							MD.Module_Name_Kh, 
							MD.Icon, 
							MD.Level, 
							MD.Menu_Id, 
							MD.Partial_Name, 
							MD.Url, 
							MD.Is_Active, 
							MD.Controller, 
							MD.Views,
							MAX(CAST(prm.list AS INT)) AS list,
			                MAX(CAST(prm.[add] AS INT)) AS [add],
			                MAX(CAST(prm.[delete] AS INT)) AS [delete],
			                MAX(CAST(prm.[print] AS INT)) AS [print],
			                MAX(CAST(prm.[edit] AS INT)) AS [edit]
						FROM DBO.tbl_Permission_Module_On_User prm		
							INNER JOIN DBO.tbl_Modules MD ON MD.ID = PRM.module_id
							INNER JOIN @TempTable TP ON TP._RoleId = PRM.role_id  
							WHERE 
							MD.Is_Active = 1
							AND PRM.is_active = 1
							AND PRM.user_id IS NULL
							AND PRM.list = 1   
				        AND PRM.module_id NOT IN (SELECT PUU.module_id FROM DBO.tbl_Permission_Module_On_User PUU WHERE PUU.user_id IS NOT NULL AND PUU.role_id IN (SELECT _RoleId FROM @TempTable))
						GROUP BY MD.ID, MD.Module_Name, MD.Module_Name_Kh, MD.Icon, MD.Level, 
                        MD.Menu_Id, MD.Partial_Name, MD.Url, MD.Is_Active, MD.Controller, MD.Views; 
	 

		INSERT INTO @TempModule3
			 SELECT *  FROM @TempModule1
			 UNION
			 SELECT * FROM @TempModule2;
		
		--FINAL SELECT 
		SELECT DISTINCT * FROM @TempModule3;
				  
	 
END;
  
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PERMISSION_WHEN_CLICK_OPEN_MODULE]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_PERMISSION_WHEN_CLICK_OPEN_MODULE]
		@UserId INT = NULL,
		@ModuleId INT = NULL
AS BEGIN
		DECLARE @TempTableUserRole TABLE (_Role_Id INT);
		INSERT INTO @TempTableUserRole 
				SELECT 
					UR.Role_Id
				FROM DBO.tbl_UserRoles UR
				INNER JOIN DBO.tbl_Users US 
				ON US.ID = UR.User_Id
				WHERE 	UR.Delete_Date IS NULL
				AND US.is_active = 1	


		IF EXISTS (SELECT 1 FROM dbo.tbl_Permission_Module_On_User WHERE module_id = @ModuleId and user_id = @UserId)
		BEGIN
			SELECT 
				PU.module_id,
				 CONVERT(INT, MAX(CONVERT(INT, PU.[list]))) AS [list], 
				 CONVERT(INT, MAX(CONVERT(INT, PU.[edit]))) AS [edit],
				 CONVERT(INT, MAX(CONVERT(INT, PU.[print]))) AS [print],
				 CONVERT(INT, MAX(CONVERT(INT, PU.[add]))) AS [add],
				 CONVERT(INT, MAX(CONVERT(INT, PU.[delete]))) AS [delete],
				 CONVERT(INT, MAX(CONVERT(INT, PU.[full]))) AS [full]
			FROM DBO.tbl_Permission_Module_On_User PU
			INNER JOIN @TempTableUserRole TR ON TR._Role_Id = PU.role_id 
			WHERE PU.module_id = @ModuleId 
			AND   PU.user_id = @UserId
			GROUP BY 
				  PU.user_id , PU.module_id
		END
		ELSE BEGIN
			SELECT 
				PU.module_id,
				 CONVERT(INT, MAX(CONVERT(INT, PU.[list]))) AS [list], 
				 CONVERT(INT, MAX(CONVERT(INT, PU.[edit]))) AS [edit],
				 CONVERT(INT, MAX(CONVERT(INT, PU.[print]))) AS [print],
				 CONVERT(INT, MAX(CONVERT(INT, PU.[add]))) AS [add],
				 CONVERT(INT, MAX(CONVERT(INT, PU.[delete]))) AS [delete],
				 CONVERT(INT, MAX(CONVERT(INT, PU.[full]))) AS [full]
			FROM DBO.tbl_Permission_Module_On_User PU
			INNER JOIN @TempTableUserRole TR ON TR._Role_Id = PU.role_id 
			WHERE PU.module_id = @ModuleId 
			AND   PU.user_id IS NULL
			GROUP BY 
				  PU.role_id , PU.module_id
		END; 
END;




--select * from dbo.tbl_Permission_Module_On_User where user_id = 1 and module_id = 6;
--exec SP_GET_PERMISSION_WHEN_CLICK_OPEN_MODULE 9 , 6
GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_ON_ROLE_PERMISSION]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
CREATE PROCEDURE [dbo].[SP_SAVE_ON_ROLE_PERMISSION]  
    @AssignBy INT,
    @JsonData NVARCHAR(MAX),
    @Message NVARCHAR(255) OUTPUT  -- Output message
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @TempTable TABLE ( 
        Module_Id INT,
        [Full] BIT,
        List BIT,
        [Add] BIT,
        Edit BIT,
        [Delete] BIT,
        [Print] BIT,
        Role_Id INT 
    );

    -- Start Transaction
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Insert JSON data into temporary table
        INSERT INTO @TempTable (Module_Id, [Full], List, [Add], Edit, [Delete], [Print], Role_Id)
        SELECT 
            Module_Id, 
            [Full], 
            List, 
            [Add], 
            Edit, 
            [Delete], 
            [Print], 
            Role_Id
        FROM OPENJSON(@JsonData)
        WITH (
            Module_Id INT           '$.Module_Id',
            [Full] BIT              '$.Full',
            List BIT                '$.List',
            [Add] BIT               '$.Add',
            Edit BIT                '$.Edit',
            [Delete] BIT            '$.Delete',
            [Print] BIT             '$.Print',
            Role_Id INT             '$.Role_Id'
        );
		 
       -- Insert new permissions if they do not exist
		INSERT INTO DBO.tbl_Permission_Module_On_User
			(module_id, role_id, [full], [list], [add], [edit], [print], [delete], is_active, assign_date, assign_by)
		SELECT 
			BB.Module_Id,
			BB.Role_Id,
			BB.[Full],
			BB.[List],
			BB.[Add],
			BB.Edit,
			BB.[Print],
			BB.[Delete],
			1,
			GETDATE(),
			@AssignBy
		FROM @TempTable BB
		WHERE 
			(BB.[Add] != 0		
			OR BB.[Edit] != 0		
			OR BB.[Full] != 0		
			OR BB.[Print] != 0		
			OR BB.[Delete] != 0		
			OR BB.[List] != 0)		
			AND NOT EXISTS (
				SELECT 1 
				FROM DBO.tbl_Permission_Module_On_User R
				WHERE R.module_id = BB.Module_Id 
				AND R.role_id = BB.Role_Id
			);
			 
        -- Update existing permissions
        UPDATE R
        SET 
            R.[full] = BBU.[Full],
            R.[list] = BBU.[List],
            R.[add] = BBU.[Add],
            R.[edit] = BBU.[Edit],
            R.[print] = BBU.[Print],
            R.[delete] = BBU.[Delete], 
            R.[update_date] = GETDATE()
        FROM DBO.tbl_Permission_Module_On_User R
        INNER JOIN @TempTable BBU
            ON R.module_id = BBU.Module_Id
            AND R.role_id = BBU.Role_Id   

        -- Commit transaction if all operations succeed
        COMMIT TRANSACTION;
        SET @Message = 'Permission Role Save SuccessFully!!!';
    END TRY
    BEGIN CATCH
        -- Rollback on error
        ROLLBACK TRANSACTION;
        SET @Message = ERROR_MESSAGE(); 
    END CATCH
END;
 
 
GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_USER_ROLE_PERMISSIONS]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SAVE_USER_ROLE_PERMISSIONS]
    @AssignBy INT,           -- User who assigns permissions
    @JsonData NVARCHAR(MAX),  -- JSON input containing module permissions
    @Message NVARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Start a transaction
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Temporary table to store parsed JSON data
        DECLARE @Permissions TABLE (
            Module_Id INT,
            Role_Id INT,
            [Full] BIT,
            [List] BIT,
            [Add] BIT,
            [Edit] BIT,
            [Delete] BIT,
            [Print] BIT,
            User_Id INT
        ); 

        -- Parse JSON input and insert into @Permissions table
        INSERT INTO @Permissions (Module_Id, Role_Id, [Full], [List], [Add], [Edit], [Delete], [Print], User_Id)
        SELECT   
            Module_Id, 
            Role_Id,
            [Full], 
            [List], 
            [Add], 
            [Edit], 
            [Delete], 
            [Print],
            User_Id
        FROM OPENJSON(@JsonData)
        WITH (
            Module_Id INT '$.Module_Id',
            Role_Id INT '$.Role_Id',
            [Full] BIT '$.Full',
            [List] BIT '$.List',
            [Add] BIT '$.Add',
            [Edit] BIT '$.Edit',
            [Delete] BIT '$.Delete',
            [Print] BIT '$.Print',
            User_Id INT '$.User_Id'
        );

        -- Insert if not existing
        INSERT INTO tbl_Permission_Module_On_User 
            ([module_id], [role_id], [user_id], [full], [list], [add], [edit], [delete], [print], [assign_by], [assign_date], [is_active])
        SELECT DISTINCT
            Source.Module_Id,
            Source.Role_Id,
            Source.User_Id,
            Source.[Full],
            Source.[List],
            Source.[Add],
            Source.[Edit],
            Source.[Delete],
            Source.[Print],
            @AssignBy AS assign_by,
            GETDATE() AS assign_date,
            1 AS is_active
        FROM @Permissions AS Source  
        WHERE NOT EXISTS (
            SELECT 1 
            FROM tbl_Permission_Module_On_User PUU
            WHERE PUU.module_id = Source.Module_Id
              AND PUU.role_id = Source.Role_Id
              AND PUU.user_id = Source.User_Id 
        );

        -- Update if existing
        UPDATE UPD
        SET 
            UPD.[add] = P.[Add],
            UPD.[list] = P.[List],
            UPD.[delete] = P.[Delete],
            UPD.[edit] = P.[Edit],
            UPD.[print] = P.[Print],
            UPD.[full] = P.[Full]
        FROM DBO.tbl_Permission_Module_On_User UPD
        INNER JOIN @Permissions P 
            ON P.User_Id = UPD.user_id 
            AND P.Role_Id = UPD.role_id
            AND P.Module_Id = UPD.module_id; 

        -- Commit the transaction if everything was successful
        COMMIT TRANSACTION;

        -- Set the success message
        SET @Message = 'Permissions on user saved successfully';

    END TRY
    BEGIN CATCH
        -- Rollback the transaction if any error occurs
        ROLLBACK TRANSACTION;

        -- Set an error message
        SET @Message = 'An error occurred while saving permissions: ' + ERROR_MESSAGE();
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT2_DATA]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[SP_SELECT2_DATA]
	@MapKey VARCHAR(100),
	@KeyId	INT = 0
AS BEGIN 

	IF @MapKey = 'ROLE'
	BEGIN  
		SELECT ID as ID , Role_Name as Text FROM dbo.tbl_Roles ;
		RETURN;
	END;
	
	ELSE IF @MapKey = 'MENU'
	BEGIN
		SELECT ID AS ID , Menu_Name AS Text FROM DBO.tbl_Menus WHERE Is_Active = 1 ORDER BY Menu_Name DESC;
		RETURN;
	END; 
	ELSE IF @MapKey = 'USER_NOT_IN_ROLE'
	BEGIN 
		DECLARE @tempTableRole TABLE (UserId INT )
		INSERT INTO @tempTableRole (UserId)
		SELECT 
	     	ur.User_Id
		FROM DBO.tbl_UserRoles UR WHERE UR.Role_Id = @KeyId

		SELECT DISTINCT  u.ID as Id, CONCAT(u.lastname ,' ', u.firstname) as Text   FROM dbo.tbl_Users u  INNER JOIN dbo.tbl_UserRoles ur  ON u.ID = ur.User_Id 
		WHERE u.ID  NOT IN (SELECT UserId FROM @tempTableRole) 
		AND U.is_active = 1   
		AND UR.Role_Id != @KeyId
		RETURN;
	END;
	ELSE IF @MapKey = 'DATA_USER_ROLE'
	BEGIN
		SELECT u.ID as Id , CONCAT(u.lastname ,' ', u.firstname) as Text  FROM DBO.tbl_Users U INNER JOIN DBO.tbl_UserRoles UR ON UR.User_Id = U.ID WHERE U.is_active = 1 AND UR.Role_Id = @KeyId 
		RETURN;
	END;
	ELSE IF @MapKey = 'DEPARTMENT'
	BEGIN
		SELECT d.ID as Id , d.name as Text FROM dbo.tbl_Department d WHERE D.is_active = 1;
	END;
		ELSE IF @MapKey = 'COMPANY'
	BEGIN
		SELECT d.ID as Id , d.company_name as Text FROM dbo.tbl_Company d WHERE D.is_active = 1;
	END;
	ELSE BEGIN
		SELECT 0 as Id , 'No data' as Text ;
	END;
END;
 
 

 --exec [dbo].[SP_SELECT2_DATA]  'USER_NOT_IN_ROLE' , 1

 -- SELECT * FROM tbl_UserRoles WHERE Role_Id = 1;
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_MENU]    Script Date: 4/6/2025 10:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UPDATE_MENU] 
		@MenuName NVARCHAR(200) ,
		@MenuName_Kh NVARCHAR(200)   ,
		@Icon	VARCHAR(50) ,
		@PartialName VARCHAR(100)  , 
		@Level INT   , 
		@MenuId INT    
 AS BEGIN
		DECLARE @LastLevel  INT = (select top 1 level from dbo.tbl_Menus where id = @MenuId)  
		DECLARE @RowOnthisLevel INT =  (SELECT ID from dbo.tbl_Menus WHERE Level = @level);
 
		UPDATE dbo.tbl_Menus 
		SET
			Menu_Name = @MenuName,
			Menu_Name_Kh = @MenuName_Kh,
			Icon	= @Icon,
			Level =   case when @Level = 0 then Level else @Level end  ,
			Partial_Name = @PartialName 
		WHERE
			ID = @MenuId  
		
		IF (@LastLevel !=  @Level )
		BEGIN  
			UPDATE DBO.tbl_Menus SET Level = @LastLevel WHERE ID = @RowOnthisLevel;  
			 
		END;
 

	END;  
 
GO
