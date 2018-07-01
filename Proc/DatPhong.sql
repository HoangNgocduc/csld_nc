use QLKS
go
create PROCEDURE DatPhongProc
    @maDP char(30),
    @maLoaiPhong char(30),
    @maKH bigint,
    @ngayBatDau date,
    @ngayTraPhong date,
    @ngayDat date,
    @moTa nvarchar(300),
    @tinhTrang nvarchar(30)
AS
    IF (
        @maDP is NOT NULL AND
        @maLoaiPhong is NOT NULL AND
        @maKH is NOT NULL AND
        @ngayBatDau is NOT NULL AND
        @ngayTraPhong is NOT NULL AND
        @ngayDat is NOT NULL
    ) BEGIN
        DECLARE @dongia int
        set @dongia = (SELECT donGia from DatPhong WHERE maLoaiPhong = @maDP)
        INSERT INTO DatPhong VALUES (
            @maDP,
            @maLoaiPhong,
            @maKH,
            @ngayBatDau,
            @ngayTraPhong,
            @ngayDat,
            @dongia,
            @moTa,
            @tinhTrang
        )
    END