CREATE TRIGGER trgEmail
ON KhachHang
FOR INSERT, UPDATE 
AS
IF(SELECT COUNT (kh.email) FROM dbo.KhachHang kh INNER JOIN inserted I ON kh.email=I.email)>1
BEGIN
	RAISERROR('Lỗi: Email của khách hàng không được trùng',16,1)
	ROLLBACK
END 
