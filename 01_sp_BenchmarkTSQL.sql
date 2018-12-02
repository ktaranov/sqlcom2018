-- @skipTSQLCheck
EXEC sp_BenchmarkTSQL
     @tsqlStatement = 'SELECT * FROM , sys.databases;'
   , @skipTSQLCheck = 0;

EXEC sp_BenchmarkTSQL
         @tsqlStatement = 'SELECT * FROM sys.databases;'
       , @skipTSQLCheck = 0;

/* Min: 3094ms, Max: 6170ms, Average: 3626ms, Median: 3328.5ms */
EXEC sp_BenchmarkTSQL
         @tsqlStatement = 'SELECT TOP(100000) * FROM sys.objects AS o1 CROSS JOIN sys.objects AS o2 CROSS JOIN sys.objects AS o3;'
       , @numberOfExecution = 10
       , @saveResults       = 1
       , @calcMedian        = 1
       , @clearCache        = 1
       , @printStepInfo     = 1
       , @durationAccuracy  = 'ms';

/* Min: 2937ms, Max: 4250ms, Average: 3590ms, Median: 3609ms */
EXEC sp_BenchmarkTSQL
         @tsqlStatement       = 'SET NOCOUNT OFF; SELECT TOP(100000) * FROM sys.objects AS o1 CROSS JOIN sys.objects AS o2 CROSS JOIN sys.objects AS o3;'
       , @numberOfExecution   = 5
       , @saveResults         = 1
       , @calcMedian          = 1
       , @clearCache          = 1
       , @printStepInfo       = 1
       , @durationAccuracy    = 'ms'
       , @additionalInfo      = 1;

/* Backup [WideWorldImporters] without Compression */
DECLARE @tsql NVARCHAR(MAX) = N'SET NOCOUNT OFF;
                                DECLARE @tsql NVARCHAR(MAX) = N''BACKUP DATABASE [WideWorldImporters]
                                TO DISK = N''''c:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\WideWorldImporters_'' +
                                   REPLACE(CAST(CAST(GETDATE() AS DATETIME2(7)) AS NVARCHAR(MAX)), '':'', '' '') +
                                   ''.bak'''' WITH NOFORMAT, NOINIT;''
                                   EXECUTE sp_executesql @tsql;';
EXEC sp_BenchmarkTSQL
     @tsqlStatement     = @tsql
   , @numberOfExecution = 3
   , @saveResults       = 1
   , @calcMedian        = 1
   , @clearCache        = 1
   , @printStepInfo     = 1
   , @durationAccuracy  = 'ms'
   , @dateTimeFunction  = 'SYSUTCDATETIME'
   , @additionalInfo    = 1;


-- Backup [WideWorldImporters] with Compression
DECLARE @TSQL NVARCHAR(MAX) = N'SET NOCOUNT OFF;
                                DECLARE @tsql NVARCHAR(MAX) = N''BACKUP DATABASE [WideWorldImporters]
                                TO DISK = N''''c:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\WideWorldImporters_'' +
                                   REPLACE(CAST(CAST(GETDATE() AS DATETIME2(7)) AS NVARCHAR(MAX)), '':'', '' '') +
                                   ''.bak'''' WITH NOFORMAT, NOINIT
                                   , COMPRESSION;''
                                   EXECUTE sp_executesql @tsql;';
EXEC sp_BenchmarkTSQL
     @tsqlStatement     = @TSQL
   , @numberOfExecution = 3
   , @saveResults       = 1
   , @calcMedian        = 1
   , @clearCache        = 1
   , @printStepInfo     = 1
   , @durationAccuracy  = 'ms'
   , @dateTimeFunction  = 'SYSUTCDATETIME'
   , @additionalInfo    = 1;


/* OBJECT_ID versus INFORMATION_SCHEMA versus sys.tables */
/* Min: 0mcs, Max: 15642mcs, Average: 4060mcs, Median: 0mcs
   Min: 0mcs, Max: 62504mcs, Average: 3436mcs, Median: 0mcs*/
EXEC sp_BenchmarkTSQL
         @tsqlStatement = 'IF OBJECT_ID(''t'',''U'') IS NOT NULL DROP TABLE t;'
       , @numberOfExecution = 100
       , @saveResults       = 1
       , @calcMedian        = 1
       , @clearCache        = 1
       , @printStepInfo     = 1
       , @tsqlStatementBefore = 'CREATE TABLE t(c INT);'
       , @durationAccuracy  = 'mcs';

/* Min: 0mcs, Max: 31268mcs, Average: 21970mcs, Median: 15635.5mcs */
EXEC sp_BenchmarkTSQL
         @tsqlStatement = 'IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES AS t WHERE t.TABLE_NAME = ''t'') DROP TABLE t;'
       , @numberOfExecution = 100
       , @saveResults       = 1
       , @calcMedian        = 1
       , @clearCache        = 1
       , @printStepInfo     = 1
       , @tsqlStatementBefore = 'CREATE TABLE t(c INT);'
       , @durationAccuracy  = 'mcs';

/* Min: 10385mcs, Max: 93760mcs, Average: 27401mcs, Median: 28678mcs */
EXEC sp_BenchmarkTSQL
         @tsqlStatement = 'IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES AS t WHERE t.TABLE_NAME = ''t'') DROP TABLE t;'
       , @numberOfExecution = 100
       , @saveResults       = 1
       , @calcMedian        = 1
       , @clearCache        = 1
       , @printStepInfo     = 1
       , @tsqlStatementBefore = 'CREATE TABLE t(c INT);'
       , @durationAccuracy  = 'mcs';

/* Min: 0mcs, Max: 109381mcs, Average: 22479mcs, Median: 15627mcs */
EXEC sp_BenchmarkTSQL
         @tsqlStatement = 'IF EXISTS (SELECT 1/0 FROM INFORMATION_SCHEMA.TABLES AS t WHERE t.TABLE_NAME = ''t'') DROP TABLE t;'
       , @numberOfExecution = 100
       , @saveResults       = 1
       , @calcMedian        = 1
       , @clearCache        = 1
       , @printStepInfo     = 1
       , @tsqlStatementBefore = 'CREATE TABLE t(c INT);'
       , @durationAccuracy  = 'mcs';

/* Min: 0mcs, Max: 171916mcs, Average: 45779mcs, Median: 46868mcs */
EXEC sp_BenchmarkTSQL
         @tsqlStatement = 'IF EXISTS (SELECT 1 FROM sys.tables AS t WHERE t.name = ''t'') DROP TABLE t;'
       , @numberOfExecution = 100
       , @saveResults       = 1
       , @calcMedian        = 1
       , @clearCache        = 1
       , @printStepInfo     = 1
       , @tsqlStatementBefore = 'CREATE TABLE t(c INT);'
       , @durationAccuracy  = 'mcs';


/* CURSOR versus LOOP 
https://sqlundercover.com/2017/11/16/sql-smackdown-cursors-vs-loops/ 
Great thanks to David Fowler
*/
IF OBJECT_ID('CursorsLoops','U') IS NOT NULL
DROP TABLE CursorsLoops;

CREATE TABLE CursorsLoops(
    ID INT NOT NULL
  , [GUID] UNIQUEIDENTIFIER NOT NULL);

INSERT INTO CursorsLoops (ID, [GUID])
SELECT TOP(10000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL))  AS ID
     , NEWID() AS [GUID]
FROM sys.columns A, sys.columns B;

/* Cursor test */
DECLARE @guid UNIQUEIDENTIFIER;
DECLARE @id INT;
 
DECLARE Test CURSOR LOCAL FAST_FORWARD FOR
 SELECT ID, GUID
 FROM CursorsLoops
 ORDER BY ID;

OPEN Test;
FETCH NEXT FROM Test INTO @id, @guid;
WHILE @@FETCH_STATUS = 0
BEGIN
 PRINT CAST(@id AS VARCHAR(50)) + ' ' + CAST(@guid AS VARCHAR(50));
 FETCH NEXT FROM Test INTO @id, @guid
END;
CLOSE Test;
DEALLOCATE Test;

/* WHILE loop test */
/* ALTER TABLE [dbo].[CursorsLoops] ADD  CONSTRAINT [PK_CursorsLoops_ID] PRIMARY KEY CLUSTERED (ID ASC); */
DECLARE @GUID UNIQUEIDENTIFIER;
DECLARE @ID INT = 0;
 
SELECT TOP(1) @ID = ID
     , @GUID = [GUID]
FROM CursorsLoops
WHERE ID > @ID
ORDER BY ID;
 
WHILE @ID IS NOT NULL
BEGIN
 PRINT CAST(@ID AS VARCHAR(50)) + ' ' + CAST(@GUID AS VARCHAR(50));
SELECT TOP 1 @ID = ID, @GUID = [GUID]
 FROM CursorsLoops
 WHERE ID > @ID
 ORDER BY ID;
IF @ID = 10000 BREAK;
END;

/* Min: 109ms, Max: 281ms, Average: 172ms, Median: 170ms */
DECLARE @TSql NVARCHAR(MAX) = N'
DECLARE @guid UNIQUEIDENTIFIER;
DECLARE @id INT;
 
DECLARE Test CURSOR LOCAL FAST_FORWARD FOR
 SELECT ID, GUID
 FROM CursorsLoops
 ORDER BY ID;

OPEN Test;
FETCH NEXT FROM Test INTO @id, @guid;
WHILE @@FETCH_STATUS = 0
BEGIN
 --PRINT CAST(@id AS VARCHAR(50)) + '' '' + CAST(@guid AS VARCHAR(50));
 FETCH NEXT FROM Test INTO @id, @guid
END;
CLOSE Test;
DEALLOCATE Test;';
EXEC sp_BenchmarkTSQL
     @tsqlStatement     = @TSql
   , @numberOfExecution = 100
   , @saveResults       = 1
   , @calcMedian        = 1
   , @clearCache        = 1
   , @printStepInfo     = 1
   , @durationAccuracy  = 'ms'
   , @dateTimeFunction  = 'SYSUTCDATETIME'
   , @additionalInfo    = 1;


/* Min: 77ms, Max: 312ms, Average: 147ms, Median: 141ms */
DECLARE @Tsql NVARCHAR(MAX) = N'
DECLARE @GUID UNIQUEIDENTIFIER;
DECLARE @ID INT = 0;
 
SELECT TOP 1 @ID = ID
     , @GUID = [GUID]
FROM CursorsLoops
WHERE ID > @ID
ORDER BY ID;
 
WHILE @ID IS NOT NULL
BEGIN
--PRINT CAST(@ID AS VARCHAR(50)) + '' '' + CAST(@GUID AS VARCHAR(50));
SELECT TOP 1 @ID = ID, @GUID = [GUID]
 FROM CursorsLoops
 WHERE ID > @ID
 ORDER BY ID;
IF @ID = 10000 BREAK;
END;';
EXEC sp_BenchmarkTSQL
     @tsqlStatement     = @Tsql
   , @numberOfExecution = 100
   , @saveResults       = 1
   , @calcMedian        = 1
   , @clearCache        = 1
   , @printStepInfo     = 1
   , @durationAccuracy  = 'ms'
   , @dateTimeFunction  = 'SYSUTCDATETIME'
   , @additionalInfo    = 1;

IF OBJECT_ID('CursorsLoops','U') IS NOT NULL
DROP TABLE CursorsLoops;


/* Median calculation */
DECLARE @median        REAL;
WITH CTE_RN AS (
SELECT TOP(1000000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS ID
FROM sys.columns A, sys.columns B
)
SELECT @median =
        (
             (SELECT MAX(TMIN) FROM
                  (SELECT TOP(50) PERCENT ID AS TMIN
                   FROM CTE_RN
                   ORDER BY TMIN
                  ) AS BottomHalf
             )
             +
             (SELECT MIN(TMAX) FROM
                  (SELECT TOP(50) PERCENT ID AS TMAX
                   FROM CTE_RN
                   ORDER BY TMAX DESC
                  ) AS TopHalf
             )
         ) / 2.0;
PRINT(@median);

/* Bencmark Median calculation with PRINT */
EXEC sp_BenchmarkTSQL
         @tsqlStatement = '
DECLARE @median        REAL;
WITH CTE_RN AS (
SELECT TOP(1000000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS ID
FROM sys.columns A, sys.columns B
)
SELECT @median =
        (
             (SELECT MAX(TMIN) FROM
                  (SELECT TOP(50) PERCENT ID AS TMIN
                   FROM CTE_RN
                   ORDER BY TMIN
                  ) AS BottomHalf
             )
             +
             (SELECT MIN(TMAX) FROM
                  (SELECT TOP(50) PERCENT ID AS TMAX
                   FROM CTE_RN
                   ORDER BY TMAX DESC
                  ) AS TopHalf
             )
         ) / 2.0;
PRINT(@median);'
       , @numberOfExecution = 5
       , @saveResults       = 1
       , @calcMedian        = 1
       , @clearCache        = 1
       , @printStepInfo     = 1
       , @durationAccuracy  = 'mcs';

/* Bencmark Median calculation withOUT PRINT */
EXEC sp_BenchmarkTSQL
         @tsqlStatement = '
DECLARE @median        REAL;
WITH CTE_RN AS (
SELECT TOP(1000000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS ID
FROM sys.columns A, sys.columns B
)
SELECT @median =
        (
             (SELECT MAX(TMIN) FROM
                  (SELECT TOP(50) PERCENT ID AS TMIN
                   FROM CTE_RN
                   ORDER BY TMIN
                  ) AS BottomHalf
             )
             +
             (SELECT MIN(TMAX) FROM
                  (SELECT TOP(50) PERCENT ID AS TMAX
                   FROM CTE_RN
                   ORDER BY TMAX DESC
                  ) AS TopHalf
             )
         ) / 2.0;
--PRINT(@median);'
       , @numberOfExecution = 5
       , @saveResults       = 1
       , @calcMedian        = 1
       , @clearCache        = 1
       , @printStepInfo     = 1
       , @durationAccuracy  = 'mcs';
