CREATE TRIGGER trgNgayDat
	ON DatPhong
	FOR INSERT ,UPDATE 
	AS 
	IF UPDATE(ngayDat)
	BEGIN
		 IF ( EXISTS(SELECT*FROM inserted I WHERE ngayDat > ngayBatDau OR ngayDat > ngayTraPhong))
		 BEGIN
			RAISERROR(N'Lỗi: ngày đặt phải nhỏ hơn ngày bắt đầu và ngày trả phòng !!!',16,1)
			ROLLBACK 
		 END
	END