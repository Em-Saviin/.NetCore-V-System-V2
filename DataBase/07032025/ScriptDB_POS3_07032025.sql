/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Standard Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [DB_POS3]
GO
/****** Object:  Table [dbo].[tbl_BussinessType]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Department]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Icons]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Menus]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Modules]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Permission_Module_On_Role]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Permission_Module_On_User]    Script Date: 3/7/2025 5:49:53 PM ******/
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
 CONSTRAINT [PK__ModulePe__3214EC27B6241D80] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Permissions]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Role_Module_Permissions]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_System]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Telgram_Users]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_UserRoles]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ASSIGN_PERMISSION_ROLE]    Script Date: 3/7/2025 5:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[SP_ASSIGN_PERMISSION_ROLE]  
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
        INSERT INTO DBO.tbl_Permission_Module_On_Role  
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
        WHERE NOT EXISTS (
            SELECT 1 
            FROM DBO.tbl_Permission_Module_On_Role R
            WHERE R.module_id = BB.Module_Id 
              AND R.role_id = BB.Role_Id 
              AND R.is_active = 1
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
        FROM DBO.tbl_Permission_Module_On_Role R
        INNER JOIN @TempTable BBU
            ON R.module_id = BBU.Module_Id
            AND R.role_id = BBU.Role_Id;

        -- Commit transaction if all operations succeed
        COMMIT TRANSACTION;
        SET @Message = 'Success Add';
    END TRY
    BEGIN CATCH
        -- Rollback on error
        ROLLBACK TRANSACTION;
        SET @Message = ERROR_MESSAGE(); 
    END CATCH
END;

 

GO
/****** Object:  StoredProcedure [dbo].[SP_ASSIGN_ROLE_TO_USER]    Script Date: 3/7/2025 5:49:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GET_MENU_PERMISSION_ON_SCREEN]    Script Date: 3/7/2025 5:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[SP_GET_MENU_PERMISSION_ON_SCREEN]
	@UserId INT 
AS BEGIN 
			DECLARE @TempTable TABLE (_RoleId INT , _UserId INT);
			INSERT INTO @TempTable 
			SELECT 
				UR.Role_Id AS _RoleId,
				UR.User_Id AS _UserId
			FROM tbl_UserRoles UR WHERE UR.User_Id = @UserId AND UR.Delete_Date IS NULL



			SELECT DISTINCT M.* FROM DBO.tbl_Permission_Module_On_Role PRM
								LEFT JOIN DBO.tbl_Modules MD
								ON MD.ID = PRM.module_id
								INNER JOIN DBO.tbl_Menus M
								ON M.ID = MD.Menu_Id 
								WHERE 
								PRM.role_id IN (SELECT _RoleId FROM @TempTable)
								AND MD.Is_Active = 1
								AND PRM.is_active = 1
								AND PRM.list = 1
							 	AND PRM.module_id NOT IN (select pmu.module_id from dbo.tbl_Permission_Module_On_User pmu where role_id   IN (SELECT _RoleId FROM @TempTable) and pmu.user_id = @UserId) 
			UNION   

			SELECT DISTINCT M.* FROM DBO.tbl_Permission_Module_On_User PMU
								LEFT JOIN DBO.tbl_Modules MD
								ON MD.ID = PMU.module_id
								INNER JOIN DBO.tbl_Menus M
								ON M.ID = MD.Menu_Id 
								WHERE 
								PMU.role_id IN (SELECT _RoleId FROM @TempTable)
								AND PMU.user_id = @UserId
								AND MD.Is_Active = 1
								AND PMU.is_active = 1
								AND PMU.list = 1
						 --	AND PMU.module_id NOT IN (SELECT module_id FROM dbo.tbl_Permission_Module_On_Role WHERE role_id = @RoleId) 
END;

 
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MODULE_ON_ROLE_PERMISSION]    Script Date: 3/7/2025 5:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 CREATE PROCEDURE [dbo].[SP_GET_MODULE_ON_ROLE_PERMISSION]
		@MenuId INT = NULL ,
		@RoleId INT = NULL
 AS BEGIN
	IF(@RoleId = 0)
	BEGIN 
		SELECT DISTINCT
				md.Id AS module_id,
				0 AS ID,   
				md.Module_Name AS module_name, 
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''full'')" role="switch" id="RoleFullflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [full],
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''list'')" role="switch" id="RoleListflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [list],   
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''add'')" role="switch" id="RoleAddflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [add],
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''edit'')" role="switch" id="RoleEditflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [edit],
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''print'')" role="switch" id="RolePrintflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [print],
				N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''delete'')" role="switch" id="RoleDeleteflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'" >' AS [delete],
				'' AS remark
		FROM  DBO.tbl_Modules md
		INNER JOIN	DBO.tbl_Menus m
		ON md.Menu_Id = m.ID   
		WHERE MD.Is_Active = 1    
		AND m.ID =  @MenuId    
	END;
		ELSE 
	BEGIN 
			SELECT  DISTINCT
					md.Id as module_id,
					mpd.ID ,
					md.Module_Name as module_name, 
					CASE  WHEN mpd.[full] = 1 THEN 
							N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''full'')" role="switch" id="RoleFullflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"   checked >'
						ELSE 
							N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''full'')" role="switch" id="RoleFullflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >'
					END AS [full],
				
					CASE  WHEN mpd.[list] = 1 THEN 
							N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''list'')" role="switch" id="RoleListflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'" checked  >'
						ELSE 
							N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''list'')" role="switch" id="RoleListflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >'
					END AS [list],  
				
					CASE  WHEN mpd.[add] = 1 THEN 
						N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''add'')" role="switch" id="RoleAddflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  checked  >'
					ELSE 
						N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''add'')" role="switch" id="RoleAddflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >'
					END AS [add],  

					CASE  WHEN mpd.[edit] = 1 THEN 
						N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''edit'')" role="switch" id="RoleEditflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"   checked>'
					ELSE 
						N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''edit'')" role="switch" id="RoleEditflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >'
					END AS [edit],
			  
			  		CASE  WHEN mpd.[print] = 1 THEN 
						N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''print'')" role="switch" id="RolePrintflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"   checked>'
					ELSE 
						N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''print'')" role="switch" id="RolePrintflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >'
					END AS [print],
					CASE  WHEN mpd.[delete] = 1 THEN 
						N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''delete'')" role="switch" id="RoleDeleteflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"   checked>'
					ELSE 
						N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''delete'')" role="switch" id="RoleDeleteflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >'
					END AS [delete],
					'' as remark 
			FROM   [dbo].[tbl_Permission_Module_On_Role] mpd 
			INNER JOIN    DBO.tbl_Modules md
			ON mpd.module_id = md.Id    
			INNER JOIN	DBO.tbl_Menus m
			ON md.Menu_Id = m.ID     
			WHERE MD.Is_Active = 1    
			AND m.ID =  @MenuId 
			AND  mpd.role_id =  @RoleId 
			AND mpd.is_active = 1 
   UNION 

			SELECT DISTINCT
					md.Id AS module_id,
					0 AS ID,   
					md.Module_Name AS module_name, 
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''full'')" role="switch" id="RoleFullflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [full],
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''list'')" role="switch" id="RoleListflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [list],   
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''add'')" role="switch" id="RoleAddflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [add],
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''edit'')" role="switch" id="RoleEditflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [edit],
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''print'')" role="switch" id="RolePrintflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [print],
					N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionRole(this, '+ CAST(md.ID AS NVARCHAR) +', '''+ md.Module_Name + ''', ''delete'')" role="switch" id="RoleDeleteflexSwitchCheck_'+ CAST(md.ID AS NVARCHAR) +'"  >' AS [delete],
					'' AS remark
			FROM dbo.tbl_Modules md
			LEFT JOIN dbo.tbl_Menus mm
			ON mm.ID = md.Menu_Id
			WHERE md.Is_Active = 1
			AND mm.Id = @MenuId 
			AND NOT EXISTS (
						SELECT 1 
						FROM tbl_Permission_Module_On_Role prr 
						WHERE prr.role_id = @RoleId
						AND prr.is_active = 1
						AND prr.module_id = md.ID
					);
			--AND md.ID NOT IN (select prr.module_id from dbo.tbl_Permission_Module_On_Role prr where prr.role_id = @RoleId AND PRR.is_active = 1) 
	END;
	
 END;
   
 

 
 
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION]    Script Date: 3/7/2025 5:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 CREATE PROCEDURE [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION] 
		@MenuId INT = NULL , 
		@UserId INT = NULL
  AS BEGIN 
	
	DECLARE @tempTable TABLE(_RoleId INT , _UserId INT)
	INSERT INTO @tempTable (_RoleId , _UserId)
	SELECT 
		UR.Role_Id as _RoleId,
		UR.User_Id as _UserId
	FROM DBO.tbl_UserRoles UR WHERE UR.User_Id = @UserId


	IF( @UserId = 0)
	BEGIN
		SELECT DISTINCT
		md.Id as module_id,
		md.Module_Name as module_name, 
		'false'	as  [full]  ,
		'false' as [list]   ,
		'false' as [add]   ,
		'false' as [edit] ,
		'false' as [print]  ,
		'' as remark
		FROM  DBO.tbl_Modules md
		INNER JOIN	DBO.tbl_Menus m
		ON md.Menu_Id = m.ID   
		WHERE MD.Is_Active = 1    
	 	AND m.ID =  @MenuId     
	END;
	ELSE
	BEGIN  

			SELECT  DISTINCT
				md.Id as module_id,
				mpd.ID ,
				md.Module_Name as module_name,
				mpd.[full]  ,
				mpd.[list]  ,
				mpd.[add]  ,
				mpd.[edit]  ,
				mpd.[print]  ,
				'' as remark
			FROM   [dbo].[tbl_Permission_Module_On_Role] mpd 
		    LEFT JOIN    DBO.tbl_Modules md
			ON mpd.module_id = md.Id    
			INNER JOIN	DBO.tbl_Menus m
		    ON md.Menu_Id = m.ID     
			WHERE MD.Is_Active = 1     
			AND mpd.module_id NOT IN (SELECT prmu.module_id FROM DBO.tbl_Permission_Module_On_User prmu WHERE prmu.User_Id = @UserId and prmu.role_id IN (SELECT _RoleId FROM @tempTable)   and is_active = 1)
		    AND m.ID =  @MenuId 
		    AND  mpd.role_id IN (SELECT _RoleId FROM @tempTable)  
			 
			UNION
			SELECT  DISTINCT
				md.Id as module_id,
				mpu.ID ,
				md.Module_Name as module_name,
				mpu.[full]  ,
				mpu.[list]  ,
				mpu.[add]  ,
				mpu.[edit]  ,
				mpu.[print]  ,
				'' as remark
			FROM   [dbo].[tbl_Permission_Module_On_User] mpu 
			LEFT JOIN DBO.tbl_Permission_Module_On_Role PRM
			ON MPU.role_id = PRM.role_id
			LEFT JOIN    DBO.tbl_Modules md
			ON mpu.module_id = md.Id    
			INNER JOIN	DBO.tbl_Menus m
			ON md.Menu_Id = m.ID      
			WHERE MD.Is_Active = 1   
			AND mpu.is_active = 1  
			AND mpu.user_id = @UserID
			AND PRM.role_id  IN (SELECT _RoleId FROM @tempTable)  
			AND m.ID = @MenuId 
		--	AND MPU.module_id NOT IN (SELECT PRM.module_id FROM DBO.tbl_Permission_Module_On_Role PRM WHERE PRM.role_id = @RoleId AND PRM.is_active = 1) 
			
			UNION 

			SELECT DISTINCT
				md.Id AS module_id,
				0 AS ID,   
				md.Module_Name AS module_name,
				'false' AS [full],
				'false' AS [list],
				'false' AS [add],
				'false' AS [edit],
				'false' AS [print],
				'' AS remark
			FROM dbo.tbl_Modules md
			LEFT JOIN dbo.tbl_Menus mm
			ON mm.ID = md.Menu_Id
			WHERE md.Is_Active = 1
            AND mm.Id = @MenuId
			AND md.ID NOT IN (select  aa.module_id from dbo.tbl_Permission_Module_On_Role aa where aa.role_id IN (SELECT _RoleId FROM @tempTable)   AND aa.is_active = 1)
			AND md.ID NOT IN (select bb.module_id from dbo.tbl_Permission_Module_On_User bb  where bb.user_id = @UserId AND bb.role_id IN (SELECT _RoleId FROM @tempTable)   AND bb.is_active = 1);  
	END;

END;



  
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION_V2]    Script Date: 3/7/2025 5:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION_V2]
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
    DECLARE @tblTempPermissionOnUser TABLE (
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

	INSERT INTO @tblTempPermissionOnUser (ID, module_name, role_id , [full], [list], [add], [edit], [print], [delete], remark)
		SELECT DISTINCT
			MD.ID as [ID],
			MD.Module_Name as [module_name],
			pu.role_id as [role_id],
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
	     INNER JOIN @tempTableUserRole UR
		 ON UR._RoleId = PU.role_id 
		 AND UR._UserId = PU.user_id
	WHERE PU.is_active = 1 
	AND MD.Is_Active = 1 
	AND M.ID = @MenuId;


	INSERT INTO @tblTempPermissionOnUser (ID, module_name,role_id, [full], [list], [add], [edit], [print], [delete], remark)
	SELECT 
		MD.ID as [ID],
		MD.Module_Name as [module_name],
		MAX(CAST(PR.role_id  AS INT)) as [role_id] ,
		MAX(CAST(PR.[full] AS INT)) as [full],
		MAX(CAST(PR.[list] AS INT)) as [list],
		MAX(CAST(PR.[add] AS INT)) as [add],
		MAX(CAST(PR.[edit] AS INT)) as [edit],
		MAX(CAST(PR.[print] AS INT)) as [print],
		MAX(CAST(PR.[delete] AS INT)) as [delete],
		'' as [remark]
	FROM DBO.tbl_Permission_Module_On_Role PR
	INNER JOIN DBO.tbl_Modules MD ON MD.ID = PR.module_id
	INNER JOIN DBO.tbl_Menus M ON M.ID = MD.Menu_Id
	INNER JOIN @tempTableUserRole UR ON UR._RoleId = PR.role_id  
	WHERE PR.is_active = 1 
	  AND MD.Is_Active = 1  
	  AND PR.role_id NOT IN (SELECT PUU.role_id FROM DBO.tbl_Permission_Module_On_User PUU 
							 WHERE PUU.role_id IN (SELECT TM._RoleId FROM @tempTableUserRole as TM)) 
	  AND M.ID = @MenuId
	GROUP BY MD.ID, MD.Module_Name;


 
    SELECT DISTINCT 
        mpr.ID AS ID,
        mpr.Module_Name AS module_name,   
		mpr.role_id as role_id,
        CASE WHEN MPR.[full] = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '   + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''full'')" role="switch" id="UserFullflexSwitchCheck_'  + CAST(mpr.ID AS NVARCHAR) + '" checked  >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''full'')" role="switch" id="DisabledUserFullflexSwitchCheck_'    + CAST(mpr.ID AS NVARCHAR) + '" disabled >'
        END AS [full],

        CASE WHEN MPR.[list] = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '     + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''list'')" role="switch" id="UserListflexSwitchCheck_'  + CAST(mpr.ID AS NVARCHAR) + '" checked >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''list'')" role="switch" id="DisabledUserListflexSwitchCheck_'  + CAST(mpr.ID AS NVARCHAR) + '" disabled>'
        END AS [list],

        CASE WHEN MPR.[add] = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''add'')" role="switch" id="UserAddflexSwitchCheck_'  + CAST(mpr.ID AS NVARCHAR) + '" checked >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''add'')" role="switch" id="DisabledUserAddflexSwitchCheck_'   + CAST(mpr.ID AS NVARCHAR) + '" disabled>'
        END AS [add],

       CASE WHEN MPR.[edit] = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '   + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''edit'')" role="switch" id="UserEditflexSwitchCheck_'  + CAST(mpr.ID AS NVARCHAR) + '" checked>'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''edit'')" role="switch" id="DisabledUserEditflexSwitchCheck_'   + CAST(mpr.ID AS NVARCHAR) + '" disabled >'
        END AS [edit],

        CASE WHEN MPR.[print] = 1 THEN 
		 N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''print'')" role="switch" id="UserPrintflexSwitchCheck_'    + CAST(mpr.ID AS NVARCHAR) + '" checked>'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''print'')" role="switch" id="DisabledUserPrintflexSwitchCheck_'  + CAST(mpr.ID AS NVARCHAR) + '" disabled >'
        END AS [print],

       CASE WHEN MPR.[delete] = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '   + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''delete'')" role="switch" id="UserDeleteflexSwitchCheck_'    + CAST(mpr.ID AS NVARCHAR) + '" checked>'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(mpr.ID AS NVARCHAR) + ', ''' + mpr.Module_Name + ''', ''delete'')" role="switch" id="DisabledUserDeleteflexSwitchCheck_'    + CAST(mpr.ID AS NVARCHAR) + '" disabled>'
        END AS [delete],

        '' AS remark
    FROM @tblTempPermissionOnUser mpr
     
END;


 
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION_V2_BACKUP]    Script Date: 3/7/2025 5:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION_V2_BACKUP]
    @MenuId INT = NULL,
    @UserId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Temporary Table for User Roles
    DECLARE @tempTable TABLE (_RoleId INT, _UserId INT);
    INSERT INTO @tempTable (_RoleId, _UserId)
    SELECT UR.Role_Id, UR.User_Id
    FROM DBO.tbl_UserRoles UR
    WHERE UR.User_Id = @UserId;

    -- Get Effective Permissions for User
    SELECT DISTINCT 
        md.id AS module_id,
        md.Module_Name AS module_name,   
        CASE WHEN COALESCE(usrPerm.[full], MAX(CAST(mpr.[full] AS INT))) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '   + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''full'')" role="switch" id="UserFullflexSwitchCheck_'  + CAST(md.ID AS NVARCHAR) + '" checked  >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''full'')" role="switch" id="DisabledUserFullflexSwitchCheck_'    + CAST(md.ID AS NVARCHAR) + '" disabled >'
        END AS [full],

        CASE WHEN COALESCE(usrPerm.[list], MAX(CAST(mpr.[list] AS INT))) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '     + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''list'')" role="switch" id="UserListflexSwitchCheck_'  + CAST(md.ID AS NVARCHAR) + '" checked >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''list'')" role="switch" id="DisabledUserListflexSwitchCheck_'  + CAST(md.ID AS NVARCHAR) + '" disabled>'
        END AS [list],

        CASE WHEN COALESCE(usrPerm.[add], MAX(CAST(mpr.[add] AS INT))) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''add'')" role="switch" id="UserAddflexSwitchCheck_'  + CAST(md.ID AS NVARCHAR) + '" checked >'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''add'')" role="switch" id="DisabledUserAddflexSwitchCheck_'   + CAST(md.ID AS NVARCHAR) + '" disabled>'
        END AS [add],

        CASE WHEN COALESCE(usrPerm.[edit], MAX(CAST(mpr.[edit] AS INT))) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '   + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''edit'')" role="switch" id="UserEditflexSwitchCheck_'  + CAST(md.ID AS NVARCHAR) + '" checked>'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''edit'')" role="switch" id="DisabledUserEditflexSwitchCheck_'   + CAST(md.ID AS NVARCHAR) + '" disabled >'
        END AS [edit],

        CASE WHEN COALESCE(usrPerm.[print], MAX(CAST(mpr.[print] AS INT))) = 1 THEN   
		 N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''print'')" role="switch" id="UserPrintflexSwitchCheck_'    + CAST(md.ID AS NVARCHAR) + '" checked>'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '  + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''print'')" role="switch" id="DisabledUserPrintflexSwitchCheck_'  + CAST(md.ID AS NVARCHAR) + '" disabled >'
        END AS [print],

        CASE WHEN COALESCE(usrPerm.[delete], MAX(CAST(mpr.[delete] AS INT))) = 1 THEN 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '   + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''delete'')" role="switch" id="UserDeleteflexSwitchCheck_'    + CAST(md.ID AS NVARCHAR) + '" checked>'
        ELSE 
            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, '    + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''delete'')" role="switch" id="DisabledUserDeleteflexSwitchCheck_'    + CAST(md.ID AS NVARCHAR) + '" disabled>'
        END AS [delete],

        '' AS remark
    FROM [dbo].[tbl_Permission_Module_On_Role] mpr
    RIGHT JOIN DBO.tbl_Modules md ON mpr.module_id = md.Id
    INNER JOIN DBO.tbl_Menus m ON md.Menu_Id = m.ID
    INNER JOIN DBO.tbl_UserRoles UR ON UR.Role_Id = MPR.role_id
    INNER JOIN DBO.tbl_Users US ON US.ID = UR.User_Id
    LEFT JOIN dbo.tbl_Permission_Module_On_User usrPerm ON usrPerm.user_id = @UserId AND usrPerm.module_id = md.Id
    WHERE MD.Is_Active = 1
        AND mpr.is_active = 1
        AND m.Is_Active = 1
        AND MD.Is_Active = 1
        AND m.ID = ISNULL(@MenuId, 0)
        AND mpr.role_id IN (SELECT _RoleId FROM @tempTable)
    GROUP BY md.Id, md.Module_Name, usrPerm.[full], usrPerm.[list], usrPerm.[add], usrPerm.[edit], usrPerm.[print], usrPerm.[delete]  ;

END;








 

-- ALTER PROCEDURE [dbo].[SP_GET_MODULE_ON_USER_ROLE_PERMISSION_V2]
--    @MenuId INT = NULL,
--    @UserId INT = NULL
--AS
--BEGIN
--    SET NOCOUNT ON;

--    -- Temporary Table to Store User Roles
--    DECLARE @tempTable TABLE(_RoleId INT, _UserId INT);

--    INSERT INTO @tempTable (_RoleId, _UserId)
--    SELECT UR.Role_Id, UR.User_Id
--    FROM DBO.tbl_UserRoles UR
--    WHERE UR.User_Id = @UserId
--	AND	  UR.Delete_Date IS NULL

--    -- Get Effective Permissions for User
--    SELECT DISTINCT
--        md.Id AS module_id,
--        md.Module_Name AS module_name, 
--        -- Effective Permissions Calculation (Max Value Per Permission)
--        CASE WHEN MAX(CAST(mpr.[full] AS INT)) = 1 THEN 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''full'')" role="switch" id="UserFullflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" checked >'
--        ELSE 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''full'')" role="switch" id="DisabledUserFullflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" disabled >'
--        END AS [full],

--        CASE WHEN MAX(CAST(mpr.[list] AS INT)) = 1 THEN 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''list'')" role="switch" id="UserListflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" checked >'
--        ELSE 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''list'')" role="switch" id="DisabledUserListflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" disabled>'
--        END AS [list],

--        CASE WHEN MAX(CAST(mpr.[add] AS INT)) = 1 THEN 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''add'')" role="switch" id="UserAddflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" checked >'
--        ELSE 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''add'')" role="switch" id="DisabledUserAddflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" disabled>'
--        END AS [add],

--        CASE WHEN MAX(CAST(mpr.[edit] AS INT)) = 1 THEN 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''edit'')" role="switch" id="UserEditflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" checked>'
--        ELSE 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''edit'')" role="switch" id="DisabledUserEditflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" disabled >'
--        END AS [edit],

--        CASE WHEN MAX(CAST(mpr.[print] AS INT)) = 1 THEN 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''print'')" role="switch" id="UserPrintflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" checked>'
--        ELSE 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''print'')" role="switch" id="DisabledUserPrintflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" disabled >'
--        END AS [print],

--        CASE WHEN MAX(CAST(mpr.[delete] AS INT)) = 1 THEN 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''delete'')" role="switch" id="UserDeleteflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" checked>'
--        ELSE 
--            N'<input class="form-check-input" type="checkbox" onchange="onCheckPermissionUser(this, ' 
--            + CAST(md.ID AS NVARCHAR) + ', ''' + md.Module_Name + ''', ''delete'')" role="switch" id="DisabledUserDeleteflexSwitchCheck_' 
--            + CAST(md.ID AS NVARCHAR) + '" disabled>'
--        END AS [delete],

--        '' AS remark
--    FROM [dbo].[tbl_Permission_Module_On_Role] mpr
--    RIGHT JOIN DBO.tbl_Modules md ON mpr.module_id = md.Id
--    INNER JOIN DBO.tbl_Menus m ON md.Menu_Id = m.ID
--    INNER JOIN DBO.tbl_UserRoles UR ON UR.Role_Id = MPR.role_id
--    INNER JOIN DBO.tbl_Users US ON US.ID = UR.User_Id
--    WHERE MD.Is_Active = 1
--        AND mpr.is_active = 1
--        AND M.Is_Active = 1
--        AND MD.Is_Active = 1
--        AND m.ID = ISNULL(@MenuId, 0)
--        AND mpr.role_id IN (SELECT _RoleId FROM @tempTable)
--    GROUP BY md.Id, md.Module_Name;

--END;

 
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MODULE_PERMISSION_ON_SCREEN]    Script Date: 3/7/2025 5:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 CREATE PROCEDURE [dbo].[SP_GET_MODULE_PERMISSION_ON_SCREEN] 
		@UserId INT = NULL
 AS BEGIN 
 		DECLARE @TempTable TABLE (_RoleId INT , _UserId INT);
			INSERT INTO @TempTable 
			SELECT 
				UR.Role_Id AS _RoleId,
				UR.User_Id AS _UserId
			FROM tbl_UserRoles UR WHERE UR.User_Id = @UserId AND UR.Delete_Date IS NULL



		SELECT DISTINCT MD.* FROM DBO.tbl_Permission_Module_On_Role prm		
			INNER JOIN DBO.tbl_Modules MD
			ON MD.ID = PRM.module_id
			WHERE PRM.role_id IN (SELECT _RoleId FROM @TempTable)
			AND MD.Is_Active = 1
			AND PRM.is_active = 1
			AND PRM.list = 1 
		--	AND PRM.module_id NOT IN (select pmu.module_id from dbo.tbl_Permission_Module_On_User pmu where role_id = @RoleId and pmu.user_id = @UserId)  
		UNION 
		SELECT DISTINCT MD.* FROM DBO.tbl_Permission_Module_On_User pmu		
			INNER JOIN DBO.tbl_Modules MD
			ON MD.ID = pmu.module_id
			WHERE pmu.role_id IN (SELECT _RoleId FROM @TempTable)
			AND pmu.user_id = @UserId
			AND MD.Is_Active = 1
			AND pmu.is_active = 1
			AND pmu.list = 1
		--	AND pmu.module_id  NOT IN (select module_id from dbo.tbl_Permission_Module_On_Role prm where role_id = @RoleId  ) 
			ORDER BY md.Level DESC 
 END;


--select * from dbo.tbl_Permission_Module_On_User	 where user_id = 2 and role_id = 2;
--select * from dbo.tbl_Permission_Module_On_Role	 where    role_id = 2;

--select * from dbo.tbl_Modules ;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_USER_ROLE_PERMISSIONS]    Script Date: 3/7/2025 5:49:53 PM ******/
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

    -- Temporary table to store parsed JSON data
    DECLARE @Permissions TABLE (
        Module_Id INT,
        [Full] BIT,
        [List] BIT,
        [Add] BIT,
        [Edit] BIT,
        [Delete] BIT,
        [Print] BIT,
        User_Id INT
    ); 
    -- Parse JSON input and insert into @Permissions table
    INSERT INTO @Permissions (Module_Id, [Full], [List], [Add], [Edit], [Delete], [Print], User_Id)
    SELECT   
        Module_Id, 
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
        [Full] BIT '$.Full',
        [List] BIT '$.List',
        [Add] BIT '$.Add',
        [Edit] BIT '$.Edit',
        [Delete] BIT '$.Delete',
        [Print] BIT '$.Print',
        User_Id INT '$.User_Id'
    );
	 
 
	 
    INSERT INTO tbl_Permission_Module_On_User ([module_id] , [user_id], [full], list, [Add], [edit], [delete], [print] , [assign_by], [assign_date] , [is_active])
			SELECT 
				Source.Module_Id,
				Source.User_Id,
				Source.[Full],
				Source.[List],
				Source.[Add],
				Source.[Edit],
				Source.[Delete],
				Source.[Print],
				@AssignBy as assign_by,
				GETDATE() as  assign_date,
				1 as is_active
			FROM  @Permissions AS Source  
		 
		 
    -- Return success message
    SELECT 0 AS Code, 'Permissions saved successfully' AS Message;
END;

 --truncate table DBO.tbl_Permission_Module_On_User
--SELECT * FROM DBO.tbl_Permission_Module_On_User
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT2_DATA]    Script Date: 3/7/2025 5:49:53 PM ******/
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
		 
	ELSE BEGIN
		SELECT 0 as Id , 'No data' as Text ;
	END;
END;
 
 

 --exec [dbo].[SP_SELECT2_DATA]  'USER_NOT_IN_ROLE' , 1

 -- SELECT * FROM tbl_UserRoles WHERE Role_Id = 1;
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_MENU]    Script Date: 3/7/2025 5:49:53 PM ******/
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
