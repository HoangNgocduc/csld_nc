CREATE TRIGGER trgTenDangNhap
ON  KhachHang
FOR INSERT,UPDATE 
AS
IF(SELECT COUNT(kh.tenDangNhap) FROM inserted I INNER JOIN dbo.KhachHang kh on kh.tenDangNhap=I.tenDangNhap)>1
BEGIN 
	RAISERROR('Lôi: tên đang nhập  đã bị trùng!!!',16,1)
	ROLLBACK 
END 