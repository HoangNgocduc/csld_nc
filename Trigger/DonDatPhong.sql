CREATE TRIGGER trgDonDatPhong
ON HoaDon
FOR INSERT 
AS
BEGIN 
	DECLARE @madp CHAR(10)
	SELECT @madp=dp.maDP FROM inserted I,dbo.DatPhong dp WHERE I.maDP= dp.maDP AND dp.tinhTrang = N'Chưa xác nhận'

	IF(EXISTS (SELECT*FROM inserted I WHERE I.maDP=@madp))
	BEGIN 
		RAISERROR(N'Lỗi: đơn đặt hàng trạng thái chưa xác nhân ko được insert"',16,1)
		ROLLBACK
	END 
END 