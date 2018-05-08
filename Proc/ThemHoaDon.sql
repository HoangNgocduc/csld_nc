CREATE procedure themHoaDon @maDP nchar(15), @maHD nchar(15)
as
    if(@maDP is not null)
begin
    declare @NgayBatDau date
    declare @NgayTraPhong date
    declare @SoNgayDaLuuTru int
    declare @DonGia money
    declare @TongTien money
    declare @dateDK date
    set @NgayBatDau = (select ngayBatDau from DatPhong where maDP=@maDP)
    set @NgayTraPhong = (select ngayTraPhong from DatPhong where maDP=@maDP)
    set @DonGia = (select donGia from DatPhong where maDP=@maDP)
    set @TongTien = @DonGia * datediff(d, @NgayBatDau, @NgayTraPhong)
    set @dateDK = getdate()
    insert into dbo.HoaDon values (@maHD, @dateDK, @TongTien, @maDP)		
end