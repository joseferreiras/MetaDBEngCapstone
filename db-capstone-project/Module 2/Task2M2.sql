CREATE VIEW OrdersView2 AS
SELECT Customers.CustomerID AS CustomerID, CONCAT(CustomerFirstName,' ',CustomerLastName) AS FullName,
Orders.OrderID AS OrderID,Orders.TotalCost AS Cost, Cuisine.CuisineType AS MenuName, Menu.MenuItemName AS CourseName
FROM Customers
LEFT JOIN Orders ON Orders.CustomerID=Customers.CustomerID
LEFT JOIN Menu ON Menu.MenuItemID=Orders.MenuItemID
LEFT JOIN Cuisine ON Cuisine.CuisineType=Menu.CuisineID
WHERE Orders.TotalCost>150
ORDER BY Cost ASC;
;
