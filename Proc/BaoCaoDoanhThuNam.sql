create proc baoCaoDoanhThuNam @ngayLap date, @DoanhThu int output
as
begin
	
	select @DoanhThu=sum(tongTien)
	from HoaDon
	where year(ngayThanhToan)=@ngayLap
end
