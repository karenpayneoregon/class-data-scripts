USE [master]
GO
/****** Object:  Database [EmailTesting]    Script Date: 4/6/2022 6:54:50 AM ******/
CREATE DATABASE [EmailTesting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmailTesting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EmailTesting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmailTesting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EmailTesting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EmailTesting] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmailTesting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmailTesting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmailTesting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmailTesting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmailTesting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmailTesting] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmailTesting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmailTesting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmailTesting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmailTesting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmailTesting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmailTesting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmailTesting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmailTesting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmailTesting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmailTesting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmailTesting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmailTesting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmailTesting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmailTesting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmailTesting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmailTesting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmailTesting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmailTesting] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmailTesting] SET  MULTI_USER 
GO
ALTER DATABASE [EmailTesting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmailTesting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmailTesting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmailTesting] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmailTesting] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmailTesting] SET QUERY_STORE = OFF
GO
USE [EmailTesting]
GO
/****** Object:  Table [dbo].[CannedMessages]    Script Date: 4/6/2022 6:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CannedMessages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[HtmlMessage] [nvarchar](max) NULL,
	[TextMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_CannedMessages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CannedMessages] ON 

INSERT [dbo].[CannedMessages] ([id], [Description], [HtmlMessage], [TextMessage]) VALUES (1, N'Very simple HTML', N'This email was sent from a <span style="font-weight: bold;color: brown"> unit test</span> as rich text.', N'This email was sent from a unit test as plain text.')
INSERT [dbo].[CannedMessages] ([id], [Description], [HtmlMessage], [TextMessage]) VALUES (2, N'Has unordered list', N'This email was sent from a <span style="font-weight: bold;color: brown"> unit test</span> as hrml.<ul><li>Apples</li><li>Oranges</li><li>Grapes</li></ul>', N'So sorry you missed seeing this great looking message.')
INSERT [dbo].[CannedMessages] ([id], [Description], [HtmlMessage], [TextMessage]) VALUES (3, N'With table', N'<span style="font-weight: bold;color: green">Unit test</span>.<table style="border: 1px solid black; border-collapse: collapse;" rules="groups"><thead style="border: 2px solid black;"><tr><td>First</td><td>Last</td></tr></thead><tr><td>Karen</td><td>Payne</td></tr><tr><td>Jill</td><td>Jones</td></tr></table>', N'Missing table demo')
INSERT [dbo].[CannedMessages] ([id], [Description], [HtmlMessage], [TextMessage]) VALUES (4, N'Bad host', N'Will never see this', N'Not to be seen')
INSERT [dbo].[CannedMessages] ([id], [Description], [HtmlMessage], [TextMessage]) VALUES (5, N'SQL-Server tib but', N'<h1>Microsoft SQL Server</h1><p style="font-style: italic">From Wikipedia, the free encyclopedia</p>Microsoft SQL Server is a <a href="https://en.wikipedia.org/wiki/Relational_database_management_system">relational database management system</a><a href="https://en.wikipedia.org/wiki/Relational_database_management_system">relational database management system</a> developed by Microsoft. As a database server, it is a software product with the primary function of storing and retrieving data as requested by other software applications—which may run either on the same computer or on another computer across a network (including the Internet).
', N'About SQL-Server')
INSERT [dbo].[CannedMessages] ([id], [Description], [HtmlMessage], [TextMessage]) VALUES (6, N'MPC Email', N'<body><div><span style="color:red;">##EMPLOYER_NAME##</span></div><br /><br /><div>A Notice of Wages Reported and Possible Charges (Form 197), for SSN...<span style="color:red;">##CLAIMANT_SSN##</span>, has been posted to the SIDES E-Response system for your review at www.google.com. Your response is due no later than <span style="color:red;">##RESPONSE_DUE_DATE##</span>. You may lose your right to appeal any benefit decision and/or have charges to your account relieved if your response is untimely.</div><br /><br /><div>To access the SIDES E-Response system, you need:<ul><li>Your Federal Employer Identification Number (FEIN), entered without any spaces or dashes (example: 134567891)</li><li>Your State Employer Identification Number (SEIN) which is your Oregon Business Identification Number (BIN) entered as seven digits, a dash and final digit (example: 1234567-8)</li><li>Your Personal Identification Number (<span style="color:red;">##PIN##</span>)</li></ul></div><br /><br /><div>Select the option for <u>Wages Reported and Possible Charges</u> when you enter the site. Once you enter your credentials you will be presented with this pending notice.</div><br /><div>To opt out of these e-mail notifications and resume receiving paper Notice Wages Reported and Possible Charges please visit <a href="#">SIDES E-Response</a>.</div><br /><br /><div><a href="http://www.oregon.gov/EMPLOY/Businesses/Tax/Pages/Respond%20to%20Benefit%20Claims.aspx">***Click Here to review the Employer Quick Tip Guide***</a></div><br /><div>If you have questions call (503) 947-1348.</div><br /><br /><div>The Employment Department provides all base period employers and the successors of base period employers with a Notice of Wages Reported and Possible Charges when an individual files an unemployment insurance claim. The benefit amount of the claim is based on all wages paid during the base year.  This notice provides information about the wages your firm reported paying to this employee during the base year and the amount your account could be charged.</div><br /><br /><div><b>PROTEST</b><br />If you are a tax paying employer, you may be eligible for relief of charges if, this individual was discharged for misconduct, voluntarily quit for reasons which are not attributable to the employer, or continues to work for you part time in the same capacity as hired and has become unemployed from another employer. Please note: per ORS 657.471, your account cannot be relieved of charges if the claimant is no longer working for you due to a lack of work, leave of absence, end of assignment, or layoff.<br /><br />ORS 657.176(3) provides that if an employee was discharged due to the commission of a theft or a felony in connection with work all benefit rights based on wages paid prior to the date of the discharge will be canceled if you notify the Employment Department in writing within 30 calendar days after the mailing date of this notice <b>and</b> the Department obtains an admission of the act or information that the act resulted in a court conviction.<br /><br />If you wish to protest the charges to your account or provide information regarding ORS 657.176(3) please fill out all separation and protest information on the Form 197 and submit the form. If you do not wish to protest, all of the information on this form is correct, and the individual is out of work due to no fault of their own, you do not need to respond to this request.</div></body>', N'Email')
SET IDENTITY_INSERT [dbo].[CannedMessages] OFF
USE [master]
GO
ALTER DATABASE [EmailTesting] SET  READ_WRITE 
GO
