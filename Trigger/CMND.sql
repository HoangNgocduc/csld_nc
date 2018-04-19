CREATE TRIGGER trgSoCMND
ON KhachHang
FOR INSERT, UPDATE 
AS
IF(SELECT COUNT (kh.soCMND) FROM dbo.KhachHang kh INNER JOIN inserted I ON kh.soCMND=I.soCMND)>1
BEGIN
	RAISERROR('Lỗi: số CMND của khách hàng không được trùng',16,1)
	ROLLBACK
END 
