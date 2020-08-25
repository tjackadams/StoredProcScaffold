MERGE [dbo].[Shipment] [Target]
USING (
	VALUES (
		1,
		'Shipment 1'
		),
		(
		2,
		'Shipment 2'
		),
		(
		3,
		'Shipment 3'
		)
	) [Source](ShipmentID, Name)
	ON [Target].ShipmentID = [Source].ShipmentID
WHEN NOT MATCHED
	THEN
		INSERT (
			ShipmentID,
			Name
			)
		VALUES (
			[Source].ShipmentID,
			[Source].Name
			);

MERGE [dbo].[DataLogger] [Target]
USING (
	VALUES (
		1,
		1,
		'Logger 1'
		),
		(
		2,
		1,
		'Logger 2'
		),
		(
		3,
		2,
		'Logger 3'
		),
		(
		4,
		3,
		'Logger 4'
		)
	) [Source](LoggerID, ShipmentID, Name)
	ON [Target].LoggerID = [Source].LoggerID
WHEN NOT MATCHED
	THEN
		INSERT (
			LoggerID,
			ShipmentID,
			Name
			)
		VALUES (
			[Source].LoggerID,
			[Source].ShipmentID,
			[Source].Name
			);
