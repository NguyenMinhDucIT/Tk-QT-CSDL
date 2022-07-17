--use master;
--drop database TestDB;

-- 2. Tạo DB
-- Connection 1
/* Leave the above line to easily see that this query window
belongs to Connection 1. */
CREATE DATABASE TestDB;
GO
ALTER DATABASE TestDB SET READ_COMMITTED_SNAPSHOT ON;
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
INSERT Test.TestTable (Col1, Col2) VALUES (6,60);-- 6.-- Connection 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN;
SELECT * FROM Test.TestTable
WHERE Col1 = 1;-- Trả lời: dữ liệu trả về là dữ liệu trước khi được Update bởi giao dịch tạo ra bởi Connection 2-- 10. 
SELECT * FROM Test.TestTable
WHERE Col1 = 1;-- Trả lời: dữ liệu trả về là dữ liệu đã được thay đổi bởi giao dịch của Connection 2--			Câu lệnh select đầu tiên ở Connection 1 không trả về dirty reads do giao dịch tạo bởi Connection 2 chưa được commit.