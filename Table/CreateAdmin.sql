Create table QuanTri
		(
            tenDangNhap nvarchar(30),
            matKhau varchar(30),
            primary key (tenDangNhap, matKhau)
		)

insert into QuanTri
values ('sa', 'p@55w0rd_admin');