use QLKS
go
create proc baoCaoDoanhThuNam @ngayLap date, @DoanhThu int output
as
begin
	
	select @DoanhThu=sum(tongTien)
	from HoaDon
	where year(ngayThanhToan)=year(@ngayLap)
end
