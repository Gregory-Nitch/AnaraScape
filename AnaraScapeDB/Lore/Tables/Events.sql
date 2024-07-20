CREATE TABLE [Lore].[Events]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] VARCHAR(100) NOT NULL,
	[IsMultiDayEvent] BIT NOT NULL,
	[Description] VARCHAR(MAX) NULL,
	[StartDate] VARCHAR(MAX) NULL,
	[StartAgeId] INT NULL,
	[EndDate] VARCHAR(MAX) NULL,
	[EndAgeId] INT NULL,
	CONSTRAINT [FK_StartAgeId] FOREIGN KEY ([StartAgeId]) 
		REFERENCES [Lore].[HistoricalAges]([Id]),
	CONSTRAINT [FK_EndAgeId] FOREIGN KEY ([EndAgeId]) 
		REFERENCES [Lore].[HistoricalAges]([Id])
);
