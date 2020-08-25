CREATE PROCEDURE [dbo].[GetShipments] @Shipments [dbo].[IntListType] READONLY
AS
BEGIN
	SELECT S.ShipmentID,
		S.Name,
		COUNT(L.ShipmentID) AS DataLoggers
	FROM [Shipment] S
	INNER JOIN @Shipments
		ON S.ShipmentID = Value
	LEFT JOIN [DataLogger] L
		ON S.ShipmentID = L.ShipmentID
	GROUP BY S.ShipmentID,
		S.Name
END
