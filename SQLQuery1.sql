/***Question 1: You need to combine the values of column name with 
respect to schema name and table name and it should be separated by ',' 
and if schema name and column name are same all the column names 
should come in one row.***/

SELECT Schema_Name,Table_Name,
   (SELECT ',' + SS.Column_Name
    FROM  Information1
    WHERE SS.Schema_Name = SS.Schema_Name
   FOR XML PATH('')) [Column_Name]
FROM Information1 SS
GROUP BY SS.Schema_Name,SS.Table_Name, SS.Column_Name
ORDER BY 1

/***Question 2: You need to change the ‘,’ separated values given in 
input into the form of rows and columns when schema name and table 
name are same.***/
SELECT Schema_Name,Table_Name,
   Column_Name
FROM Information1 SS
GROUP BY SS.Schema_Name,SS.Table_Name, SS.Column_Name
ORDER BY 1
/***Question 5: I have so many columns in a table but only want to 
apply aggregation on several particular Characteristics not all the 
columns. (Create Dynamic Procedure)***/
CREATE TABLE Procedure_Name (
    Prod_Des varchar(50),
    Prod_Code int,
    Prod_Qty  int,
    Prod_Price int
);
insert into Procedure_Name(Prod_Des,Prod_Code,Prod_Qty,Prod_Price)
values('Detergent',12012,1,120),('Detergent',12011,1,90),('Detergent',12014,1,130)
select * from Procedure_Name
DECLARE @sqlCommand varchar(1000)
DECLARE @columnList varchar(75)
DECLARE @Prod_Code varchar(75)
DECLARE @Prod_Des varchar(75)
DECLARE @SqlCommand2 varchar(1000)


SET @columnList = 'Prod_Des, Prod_Code, Prod_Qty,Prod_Price'
SET @Prod_Des = '''Detergent'''
SET @Prod_Code ='12012,12011,12014'
SET @sqlCommand = 'SELECT ' + @columnList + ' FROM Procedure_Name WHERE Prod_Des = ' + @Prod_Des + 'and Prod_Code = ' +@Prod_Code

EXEC (@sqlCommand)

