--1--List of all customers
select * from Customers;
--2--list of all customers where company name ending in N
select CompanyName from Customers where CompanyName like '%n';
--3--list of all customers who live in Berlin or London
select ContactName from Customers
where City = 'Berlin' OR City ='London';
--4--ist of all customers who live in UK or USA
select ContactName from Customers
where Country = 'USA' OR Country ='UK';
--5--list of all products sorted by product name
select * from Products
select ProductName from Products;
--6--
select ProductName from Products where ProductName like 'A%';
--7--
select * from Customers where CustomerID in (select CustomerId from Orders);
--8--
select * from Customers,Products where ProductName='chai' and City='London';
--9--
select * from Customers where CustomerID not in (select CustomerId from Orders);
--10--
select * from Customers,Products where ProductName='tofu' ;
--11--
select * from [Order Details] where OrderID in (select min(OrderID) from [Order Details])
--12--
SELECT Orders.OrderDate, [Order Details].UnitPrice*Quantity
FROM [Order Details] INNER JOIN Orders ON [Order Details].UnitPrice*Quantity= [Order Details].UnitPrice*Quantity ;
--13--For each order get the OrderID and Average quantity of items in that order
select OrderID from Orders where OrderID in (select avg(Quantity) from [Order Details]) 
--15--
select * from Employees
select ReportsTo, count(ReportsTo) as 'Employee' 
from Employees
group by ReportsTo 
--16--
select top 2 OrderID,sum(Quantity) as 'total quantity' from[Order Details]
group by [Order Details].OrderID order by [total quantity] DESC;
--17--
select * from Orders where OrderDate>='1996-12-31';
--18--
select * from Orders where ShipCountry ='Canada';
--19--
--20--
select * from Suppliers where City= Country;
--21--
select ContactName,ShipVia from Customers,Orders where Customers.CustomerID = Orders.CustomerID;
--22--
select ContactName from Customers where CustomerID in (select CustomerID from Orders where ShipVia >=3);
--23--
select distinct(ProductName) from Products,[Order Details] where OrderID in (select OrderID from Orders where OrderDate>'1/1/1997' and OrderDate>'1/1/1998');  
--24--
select  FirstName,LastName,Title from Employees;-- superviset FirstName,LastNmae are not found
--25--
select EmployeeID from Employees where EmployeeID in (select EmployeeID from Orders);
--26--
select * from Employees where FirstName like 'a%' ;
--27--
select * from Employees where Title like '%manager%' and ReportsTo >4;
--28--
select OrderID,ProductName from Orders,Products where ProductID in (select ProductID from [Order Details]);
--29--
select * from Customers where CustomerID in (select top 10 CustomerID from Orders order by Freight DESC);
--30--
select * from Orders where CustomerID in (select CustomerID from Customers where Fax is NULL);
--31--
select PostalCode from Customers where CustomerID in (
select CustomerID from Orders where OrderID in(
select OrderID from [Order Details] where ProductID in (
select ProductID from Products where ProductName ='Tofu')
)
);
--32--
select ProductName from Products where ProductID in (
select ProductID from [Order Details] where OrderID in (
select OrderID from Orders where ShipCountry= 'France'));
--33--
select ProductName from Products where SupplierID in (select SupplierID from Suppliers where CompanyName = 'Specialty Biscuits,Ltd');
--34--
select ProductName from Products where ProductID not in (select ProductID from [Order Details])
--35--
select * from Products where UnitsInStock < 10 and UnitsOnOrder = 0
--36--
select top 10 ShipCountry,count (ShipCountry) as 'total ship' from Orders group by ShipCountry order by [total ship] DESC
--37--
select EmployeeID, count(OrderID) as 'orders' from Orders where CustomerID between 'A' and 'AO' group by EmployeeID
--38--
select OrderDate from Orders where OrderID in (select top 1 OrderID from [Order Details] order by UnitPrice DESC)
--39--
select ProductName,sum(UnitPrice) as 'Revenue' from Products group by ProductName
--40--
select SupplierID, count(Discontinued) as 'offer' from Products group by SupplierID
--41--
select top 10 * from Customers where ContactTitle='Owner'
--42-- 
select sum(UnitPrice) as 'Revenue' from Products 





 