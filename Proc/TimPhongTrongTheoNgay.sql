
use QLKS
go
CREATE PROCEDURE TimPhongTrongTheoNgay @start DATE, @end DATE, @loaiPhong char(30)
AS
    IF (
        @start is not null AND
        @end is not null
    ) BEGIN
        SELECT * FROM Phong p WHERE
        LoaiPhong = @loaiPhong AND (
        (
            SELECT count(*) as SoLuongTrong from TrangThaiPhong WHERE
            ngay <= @end AND
            ngay >= @start AND
            maPhong = p.maPhong
        ) < p.soPhong OR NOT EXISTS (
            SELECT * FROM TrangThaiPhong WHERE
            ngay <= @end AND
            ngay >= @start AND
            maPhong = p.maPhong
        ))
    END