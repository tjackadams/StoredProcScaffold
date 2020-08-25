CREATE TABLE [dbo].[DataLogger]
(
	[LoggerID] INT NOT NULL, 
    [ShipmentID] INT NOT NULL, 
    [Name] VARCHAR(50) NOT NULL,
    CONSTRAINT PK_LoggerID PRIMARY KEY (LoggerID), 
    CONSTRAINT [FK_DataLogger_Shipment] FOREIGN KEY ([ShipmentID]) REFERENCES [Shipment]([ShipmentID])
)
