use QLKS
go
CREATE PROCEDURE TimKiemThongTinHoaDonTheoNgay
    @ngayBatDau DATETIME,
    @ngayKetThuc DATETIME
AS
    if (
        @ngayBatDau is not null AND
        @ngayKetThuc is not null
    ) BEGIN
        SELECT * FROM HoaDon WHERE
        ngayThanhToan >= @ngayBatDau OR
        ngayThanhToan <= @ngayKetThuc
    END