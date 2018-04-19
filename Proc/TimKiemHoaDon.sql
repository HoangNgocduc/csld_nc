create proc timkiemHoaDon @maHoaDon nchar(15),@ngayLap date,
@tongTien money
as 
begin
	select *from HoaDon 
	where @maHoaDon=maHD or @ngayLap=ngayThanhToan or @tongTien=tongTien
end
