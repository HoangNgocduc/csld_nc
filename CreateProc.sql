use QLKS

create procedure themHoaDon
(
	@maDP nchar(15)
)
as
    if(@maDP is not null)
begin
    declare @NgayBatDau date
    declare @NgayTraPhong date
    declare @SoNgayDaLuuTru int
    declare @DonGia money
    declare @TongTien money
    set @NgayBatDau=(select ngayBatDau from DatPhong where maDP=@maDP)
    set @NgayTraPhong=(select ngayTraPhong from DatPhong where maDP=@maDP)
    set @DonGia=(select donGia from DatPhong where maDP=@maDP)
    set @TongTien=@DonGia*datediff(d,@NgayBatDau,@NgayTraPhong)
    -- tạo hóa đơn:
    insert into dbo.HoaDon values ((getdate(), @TongTien, @maDP)		
end

go
---------3/TÌM KIEM THÔNG TIN KHÁCH SAN------
create proc timkiemKhachSan @Gia money,@soSao nvarchar(10),
@thanhPho nvarchar(20)
as 
begin
	select *from KhachSan 
	where (@Gia=giaTB and @thanhPho=thanhPho)
		or (@soSao=soSao and @thanhPho=thanhPho)
		or @thanhPho=thanhPho
end
go
----------8/ TÌM KIEM THÔNG TIN HÓA ÐON ------
create proc timkiemHoaDon @maHoaDon nchar(15),@ngayLap date,
@tongTien money
as 
begin
	select *from HoaDon 
	where @maHoaDon=maHD or @ngayLap=ngayThanhToan or @tongTien=tongTien
end
go
--------9/ THONG KÊ,BÁO CÁO---------
-----9.1/ BÁO CÁO DOANH THU THEO THÁNG
create proc baoCaoDoanhThu @ngayLap int, @DoanhThu int output
as
begin
	
	select @DoanhThu=sum(tongTien)
	from HoaDon
	where month(ngayThanhToan)=@ngayLap
end
-----9.2/ BÁO CÁO DOANH THU THEO NAM
go
create proc baoCaoDoanhThuNam @ngayLap int, @DoanhThu int output
as
begin
	
	select @DoanhThu=sum(tongTien)
	from HoaDon
	where year(ngayThanhToan)=@ngayLap
end
go
-----9.3/ THONG KÊ SO LUONG PHÒNG TRONG
create proc thongKePhongTrong @soLuong int output
as
begin
	select count(distinct Phong.maPhong)
	from TrangThaiPhong,Phong,KhachSan,LoaiPhong
	where tinhTrang=N'còn tr?ng' and Phong.maPhong=TrangThaiPhong.maPhong and Phong.LoaiPhong=LoaiPhong.maLoaiPhong
	and LoaiPhong.maKS=KhachSan.MaKS
	group by LoaiPhong,Phong.maPhong,soSao,thanhPho
	order by soSao,thanhPho
end
declare @sum int
exec sp_ThongKePhongTrong @sum out
print @sum


alter table KhachHang
drop column maHash
alter table KhachHang
add maHash nvarchar(20)

go
create procedure kiemTraTenNguoiDung @User nvarchar(50)
as
if (exists (select tenDangNhap
			from KhachHang
			where tenDangNhap = @User))
	begin
		raiserror (N'Tên đăng nhập đã được sử dụng',16,1)
		return
	end

go
create procedure kiemTramaKH @maKH nvarchar(15)
as
if (exists (select KH.maKH
			from KhachHang KH
			where hoTen = @maKH))
	begin
		raiserror (N'Create another ID',16,1)
		rollback transaction
		return
	end

go
create procedure kiemtraLapNguoiDung @User nvarchar(50)
as
	if (exists (select *
				from KhachHang
				where tenDangNhap = @User))
	return 1
	else
	return 0


go
create procedure kiemtraMatKhau @User nvarchar(50), @Pass varchar(100)
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