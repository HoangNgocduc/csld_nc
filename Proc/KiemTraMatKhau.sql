create procedure kiemtraMatKhau @User bigint, @Pass varchar(100)
as
	declare @check int;
	exec @check = CheckExistUser @User
	if(@check = 0)
	begin
		raiserror (N'Tên đăng nhập không tồn tại',16,1)
		return
	end
	else
	if (exists (select *
				from KhachHang
				where tenDangNhap = @User and matKhau = @Pass))
		return
	else
	begin
		raiserror (N'Đăng nhập sai, xin vui lòng thử lại',16,1)
		return
	end