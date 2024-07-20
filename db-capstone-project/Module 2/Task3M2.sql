CREATE OR REPLACE VIEW OrdersView3 AS

SELECT MenuItemName FROM Menu

WHERE MenuItemID = ANY(SELECT Menu.MenuItemID AS OrderCount FROM Menu
LEFT JOIN Orders ON Orders.MenuItemID=Menu.MenuItemID
GROUP BY Menu.MenuItemID
HAVING COUNT(Menu.MenuItemID)>2);




