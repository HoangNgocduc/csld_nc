create proc baoCaoDoanhThu @ngayLap int, @DoanhThu int output
as
begin
	
	select @DoanhThu=sum(tongTien)
	from HoaDon
	where month(ngayThanhToan)=@ngayLap
end
