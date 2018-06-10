use QLKS
go
CREATE TRIGGER trgNgayBatDau
	ON DatPhong
	FOR INSERT, UPDATE
	as
	IF UPDATE (ngayBatDau)
	BEGIN
		IF(EXISTS(SELECT*FROM inserted I WHERE ngayBatDau > ngayTraPhong))
		BEGIN 
			RAISERROR (N'Lỗi: ngày bắt đầu  lớn hơn ngày trả',16,1)
			ROLLBACK
		END
	END
	IF UPDATE (NgayTraPhong)
	BEGIN
		IF(EXISTS(SELECT*FROM inserted I WHERE ngayBatDau > ngayTraPhong))
		BEGIN 
			RAISERROR (N'Lỗi: ngày bắt đầu  lớn hơn ngày trả',16,1)
			ROLLBACK
		END
	END