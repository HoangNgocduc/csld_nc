use QLKS
go
CREATE TRIGGER trgSDT
ON KhachHang
FOR INSERT,UPDATE 
AS
IF(SELECT COUNT(kh.soDienThoai) FROM dbo.KhachHang kh INNER JOIN inserted I ON kh.soDienThoai=I.soDienThoai )>1
BEGIN
	RAISERROR('Lỗi: số điện thoại của khách hàng đã bị trùng1',16,1)
	ROLLBACK
END 
