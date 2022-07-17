-- 3.
--Connection 2
USE TestDB;-- 5.-- Connection 2
BEGIN TRAN;
UPDATE Test.TestTable SET Col2 = Col2 + 1
WHERE Col1 = 1;-- 9. 
--Connection 2
COMMIT TRAN;