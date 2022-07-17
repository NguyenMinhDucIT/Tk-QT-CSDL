-- 3. Tạo query mới tên là Connection 2 và thực thi lệnh.
-- Connection 2 – Session ID: <put @@SPID result here>
/* Leave the above line to easily see that this query window
belongs to Connection 2. */
SELECT @@SPID;
GO
USE TestDB;

-- 8. Thực thi 1 giao dịch và có được khóa đặc biệt
-- Connection 2
BEGIN TRAN;
UPDATE Test.TestTable SET Col2 = Col2 + 1
WHERE Col1 = 1;-- 11. Kết thúc giao dịch--Connection 2
COMMIT TRAN;