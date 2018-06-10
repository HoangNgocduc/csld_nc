use QLKS
go
CREATE TRIGGER trgDatPhongMotHoaDon
ON HoaDon
FOR INSERT
as
IF(SELECT COUNT(hd.maDP)FROM inserted I  INNER  JOIN  dbo.HoaDon hd ON hd.maDP=I.maDP )>1
BEGIN
	RAISERROR(N'Loỗi :1 mã đặt phog chỉ một hóa đơn!!',16,1)
	ROLLBACK
END 