use QLKS
go
create proc timkiemHoaDon @maHoaDon char(30),@ngayLap date,
@tongTien money
as 
begin
	select *from HoaDon 
	where @maHoaDon=maHD or @ngayLap=ngayThanhToan or @tongTien=tongTien
end
