use QLKS
go
create procedure kiemtraLapNguoiDung @User nvarchar(50)
as
	if (exists (select *
				from KhachHang
				where tenDangNhap = @User))
	return 1
	else
	return 0
