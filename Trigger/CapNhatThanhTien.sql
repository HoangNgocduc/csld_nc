CREATE TRIGGER trgCapNhatThanhTien
ON HoaDon
FOR  INSERT,update
AS
IF UPDATE(tongTien)
BEGIN 
	DECLARE @ngayBatDau DATE = (SELECT dp.ngayBatDau FROM inserted I,dbo.DatPhong dp WHERE I.maDP=dp.maDP)
	DECLARE @ngayTraPhong DATE = (SELECT dp.ngayTraPhong FROM inserted I,dbo.DatPhong dp WHERE I.maDP=dp.maDp)
	DECLARE @donGia int = (SELECT dp.donGia FROM inserted I, dbo.DatPhong dp WHERE I.maDP=dp.maDp)
	DECLARE @tongngay INT

	DECLARE @madp CHAR(15)  =(SELECT dp.maDP FROM inserted I, dbo.DatPhong dp WHERE I.maDP=dp.maDp)
	SET @tongngay = DATEDIFF(day,@ngayBatDau,@ngayTraPhong) 
	UPDATE Hoadon SET tongTien=@tongngay*@donGia WHERE maDP=@madp
END 
