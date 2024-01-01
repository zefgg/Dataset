create procedure  summary_order_status @StatusID int AS
BEGIN
	select	fso.OrderID, 
			dc.CustomerName, 
			dp.ProductName,
			fso.Quantity,
			dso.StatusOrder
	from FactSalesOrder fso
	JOIN DimCustomer dc ON fso.CustomerID = dc.CustomerID
	JOIN DimProduct dp ON fso.ProductID = dp.ProductID
	JOIN DimStatusOrder dso ON fso.StatusID = dso.StatusID
	where fso.StatusID = @StatusID
END;

select * from FactSalesOrder

EXEC summary_order_status @StatusID = 4