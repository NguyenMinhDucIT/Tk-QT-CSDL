-- 4. Tạo query 3 tên là Connection3 và chạy lệnh
---Connection 3
/* Leave the above line to easily see that this query window
belongs to Connection 3. */
USE TestDB;

-- 6. Kiểm tra khóa
SELECT
resource_type
,request_mode
,request_status
FROM sys.dm_tran_locks
WHERE resource_database_id = DB_ID('TestDB')
AND request_session_id = 65
AND request_mode IN ('S', 'X')
AND resource_type <> 'DATABASE';-- Trả lời: Không có khóa chia sẻ do cài đặt mặc định là READ_COMMITTED_SNAPSHOT để ở chế độ ON. Lúc này CSDL sử dụng row versioning để biểu diễn kết quả câu lệnh -- cùng với các snapshot của dữ liệu 1 cách nhất quán về giao dịch từ khi bắt đầu câu lệnh.-- 10. Kiểm tra khóa lấy được bởi giao dịch tạo bởi Connection 1SELECT
resource_type
,request_mode
,request_status
FROM sys.dm_tran_locks
WHERE resource_database_id = DB_ID('TestDB')
AND request_session_id = 65
AND request_mode IN ('S', 'X')
AND resource_type <> 'DATABASE';

-- 12. Kiểm tra trạng thái ở Connection 1 ==> Câu lệnh đã thực thi xong
--		Chạy lại truy vấn trên để kiểm tra khóa ==> Không có khóa nào được lấy bởi Connection 1