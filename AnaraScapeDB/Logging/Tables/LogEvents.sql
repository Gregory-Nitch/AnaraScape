﻿CREATE TABLE [Logging].[LogEvents]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [Time] DATETIME2 NOT NULL,
    [Level] INT NOT NULL,
    [Message] VARCHAR(MAX) NOT NULL
);
