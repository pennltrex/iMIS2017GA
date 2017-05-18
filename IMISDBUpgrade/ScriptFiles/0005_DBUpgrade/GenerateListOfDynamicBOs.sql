SET NOCOUNT ON
DECLARE @lf char(1);
DECLARE @count int;
DECLARE @list varchar(MAX);
SET @list = '';
SET @count = 1;
SET @lf = '|';
WITH allUDViews AS (  
SELECT TABLE_NAME, SUBSTRING(TABLE_NAME, 6, LEN(TABLE_NAME) - 5) AS [BOName]
  FROM INFORMATION_SCHEMA.VIEWS 
   WHERE TABLE_NAME LIKE 'vUDBO%'
UNION ALL
SELECT TABLE_NAME, SUBSTRING(TABLE_NAME, 7, LEN(TABLE_NAME) - 6) AS [BOName]
  FROM INFORMATION_SCHEMA.VIEWS 
   WHERE TABLE_NAME LIKE 'vUDMBO%'
), allBODocuments AS (
SELECT DocumentName
FROM DocumentMain
WHERE DocumentTypeCode = 'BOD' AND DocumentStatusCode = 40
) 
SELECT @list += COALESCE(udv.BOName, '') + CASE WHEN (@count % 8) = 0 THEN @lf ELSE ',' END, @count +=1
  FROM allUDViews udv
       INNER JOIN allBODocuments abod ON udv.BOName = abod.DocumentName
 ORDER BY udv.BOName;

-- trim off white-space and trailing comma
IF (SUBSTRING(@list, CASE WHEN (LEN(@list) > 0) THEN LEN(@list) ELSE 0 END, 1) = '|')
BEGIN
    SELECT @list = SUBSTRING(@list, 1, CASE WHEN (LEN(@list) > 0) THEN LEN(@list) - 1 ELSE 0 END);
END 
IF (SUBSTRING(@list, CASE WHEN (LEN(@list) > 0) THEN LEN(@list) ELSE 0 END, 1) = ',')
BEGIN
    SELECT @list = SUBSTRING(@list, 1, CASE WHEN (LEN(@list) > 0) THEN LEN(@list) - 1 ELSE 0 END);
END 
SELECT RTRIM(LTRIM(@list)) AS UDBOList;
