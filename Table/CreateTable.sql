Create table KhachHang 
	(
		maKH bigint not null,
		hoTen nvarchar(30),
		tenDangNhap nvarchar(50),
		matKhau varchar(100),
		soCMND varchar(15),
		diaChi nvarchar(100),
		soDienThoai varchar(15),		
		moTa nvarchar(300),
		email varchar(50),
		primary key (maKH)
	)

	Create table KhachSan
		(
		MaKS char(30) not null,
		tenKS nvarchar(50),
		soSao int,
		soNha nvarchar(10),
		duong nvarchar(30),
		quan nvarchar(20),
		thanhPho nvarchar(20),
		giaTB int,
		moTa nvarchar(300),
		primary key (maKS)
		)
--tạo bảng LoaiPhong
	Create table LoaiPhong
	(
		maLoaiPhong char(30) not null,
		tenLoaiPhong nvarchar(30),
		maKS nchar(30),
		donGia int,
		moTa nvarchar(300),
		slTrong int,
		primary key(maLoaiPhong),
	)
--tạo bảng Phong
	create table Phong
	(
		maPhong char(30) not null,
		LoaiPhong char(30),
		soPhong int,
		primary key (maPhong),
	) 
--tạo bảng TrangThaiPHong

	Create table TrangThaiPhong
	(
		maPhong char(30) not null,
		ngay date NOT NULL ,
		tinhTrang nvarchar(30),
		primary key(maPhong,ngay)
	)
--Tạo bảng đặt phòng
	
	Create table DatPhong
	(
		maDP char(30) not null,
		maLoaiPhong char(30),
		maKH bigint,
		ngayBatDau date,
		ngayTraPhong date,
		ngayDat date,
		donGia int,
		moTa nvarchar(300),
		tinhTrang nvarchar(30),
		primary key (maDP)
	)
--tạo bảng hóa đơn

	Create table HoaDon
	(
		maHD char(30),
		ngayThanhToan date,
		tongTien money,
		maDP char(30),
		primary key(maHD),
	)

--=====================================================================
alter table LoaiPhong 
	add constraint LoaiPhong_KhachSan_FK
	foreign key (maKS)
	references KhachSan(maKS)

alter table Phong
	add constraint phong_LoaiPhong_FK 
	foreign key(loaiPhong)
	references  LoaiPhong(maLoaiPhong)

alter table TrangThaiPhong
	add constraint TrangThaiPhong_Phong_FK
	foreign key (maPhong)
	references Phong(maPhong)

alter table DatPhong 
	add constraint DatPhong_LoaiPhong_FK 
	foreign key(maLoaiPhong)
	references LoaiPhong(maLoaiPhong)

alter table DatPhong 
	add constraint DatPhong_KhachHang_FK
	foreign key (maKH)
	references KhachHang(maKH)

alter table HoaDon
	add constraint HoaDon_DatPhong_FK
	foreign key(maDP)
	references DatPhong(maDP)

--===============================================