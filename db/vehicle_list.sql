 
USE [ProjectTruck]
GO
/****** Object:  Table [dbo].[vehicle_listing]    Script Date: 06/28/2007 19:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_listing](
	[vehicle_listing_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[model_id] [int] NULL,
	[model_other] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[year] [int] NULL,
	[price] [money] NULL,
	[mileage] [int] NULL,
	[engine_id] [int] NULL,
	[engine_comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fuel_id] [int] NULL,
	[drive_id] [int] NULL,
	[drive_comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[transmission_id] [int] NULL,
	[transmission_comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[doors] [tinyint] NULL,
	[ext_color_id] [int] NULL,
	[ext_color_comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[int_color_id] [int] NULL,
	[int_color_comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vehicle_condition_id] [int] NULL,
	[vehicle_condition_comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[street_legal] [bit] NOT NULL,
	[additional_comments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active] [bit] NOT NULL,
	[owner_id] [int] NOT NULL,
	[updated_date] [datetime] NOT NULL CONSTRAINT [DF_vehicle_listing_updated_date]  DEFAULT (getdate()),
	[zipcode] [nchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[city] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_vehicle_listing] PRIMARY KEY CLUSTERED 
(
	[vehicle_listing_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [ProjectTruck]
GO
ALTER TABLE [dbo].[vehicle_listing]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_listing_vehicle_color] FOREIGN KEY([ext_color_id])
REFERENCES [dbo].[vehicle_color] ([color_id])
GO
ALTER TABLE [dbo].[vehicle_listing]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_listing_vehicle_color1] FOREIGN KEY([int_color_id])
REFERENCES [dbo].[vehicle_color] ([color_id])
GO
ALTER TABLE [dbo].[vehicle_listing]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_listing_vehicle_condition] FOREIGN KEY([vehicle_condition_id])
REFERENCES [dbo].[vehicle_condition] ([vehicle_condition_id])
GO
ALTER TABLE [dbo].[vehicle_listing]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_listing_vehicle_drive] FOREIGN KEY([drive_id])
REFERENCES [dbo].[vehicle_drive] ([vehicle_drive_id])
GO
ALTER TABLE [dbo].[vehicle_listing]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_listing_vehicle_engine] FOREIGN KEY([engine_id])
REFERENCES [dbo].[vehicle_engine] ([vehicle_engine_id])
GO
ALTER TABLE [dbo].[vehicle_listing]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_listing_vehicle_fuel] FOREIGN KEY([fuel_id])
REFERENCES [dbo].[vehicle_fuel] ([vehicle_fuel_id])
GO
ALTER TABLE [dbo].[vehicle_listing]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_listing_vehicle_model] FOREIGN KEY([model_id])
REFERENCES [dbo].[vehicle_model] ([model_id])
GO
ALTER TABLE [dbo].[vehicle_listing]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_listing_vehicle_transmission] FOREIGN KEY([transmission_id])
REFERENCES [dbo].[vehicle_transmission] ([vehicle_transmission_id])