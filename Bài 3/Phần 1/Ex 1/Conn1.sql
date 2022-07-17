-- Phần 1: Mức ưu tiên có sẵn trong cơ sở dữ liệu
-- Exercise 1: Acquire Locks by Using the Read Committed Isolation Level
-- 1. Open MSSQL
-- 2. Execute the following SQL statements to create the TestDB database, the Test schema, the table
-- Connection 1 – Session ID: <put @@SPID result here>
/* Leave the above line to easily see that this query window
belongs to Connection 1. */
SELECT @@SPID;
GO
CREATE DATABASE TestDB;
GO
USE TestDB;
GO
CREATE SCHEMA Test;
GO
CREATE TABLE Test.TestTable (
Col1 INT NOT NULL
,Col2 INT NOT NULL
);
INSERT Test.TestTable (Col1, Col2) VALUES (1,10);
INSERT Test.TestTable (Col1, Col2) VALUES (2,20);
INSERT Test.TestTable (Col1, Col2) VALUES (3,30);
INSERT Test.TestTable (Col1, Col2) VALUES (4,40);
INSERT Test.TestTable (Col1, Col2) VALUES (5,50);
INSERT Test.TestTable (Col1, Col2) VALUES (6,60);


-- 5. Thực hiện 1 giao dịch (no commit)
-- Connection 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN;
SELECT * FROM Test.TestTable
WHERE Col1 = 1;-- 7. Commit giao dịch---Connection 1
COMMIT TRAN;-- 9. Thực thi lệnh để đọc row được cập nhật nhưng chưa commit bởi Connection 2 
-- Connection 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN;SELECT * FROM Test.TestTable
WHERE Col1 = 1;